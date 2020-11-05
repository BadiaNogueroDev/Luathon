player = Actor:extend() 

mouse = {} --Guarda las cordenadas del mouse

function player:new(x, y)
  --Initialize the propierties position
  self.x = x
  self.y = y
  self.impulseSpeed = 500
  self.jumpForce = -150
  self.mouseUp = true --True quan el mouse no s'estigui apretant
  
  --Player in the physics system
  objects.player = {}
  objects.player.body = love.physics.newBody(world, h/2, w/2, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  objects.player.shape = love.physics.newRectangleShape(0, 0, 35, 60) --the players' shape is 50 by 80
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.player.body:setLinearDamping(3)
  objects.player.body:setGravityScale(3)
  objects.player.body:setFixedRotation(true)
  
  
  --Initialize animation parameters
  player.super.new(self, "sprites/Stickman_Attack_Monigote.png", x, y)
  --frames
  self.frames = {}
  self.nFrames = 7
  local width = self.image:getWidth() / self.nFrames
  local height = self.image:getHeight()
  
  for y = 0, self.image:getWidth() - height, height do
    for x = 0, self.image:getWidth() - width, width do
      table.insert(self.frames, love.graphics.newQuad(x, y, width, height, self.image:getDimensions()))
    end
  end
  
  self.scaleX = 0.66
  
  --frameRate
  self.frameRate = 24
  self.actFrame = 1 
  
  
  --Player attacking
  self.attacking = false --El personatge esta atacant
  self.canAttack = true --El personatge pot atacar
  self.dashing = false
  self.attackDuration = 0.1 --Temps en el que estas atacant
  self.currentDuration = 0 --Timer, se li sumara dt fins arribar a attackDuration
  self.fireRate = 0.8 --Cooldown entre atacs
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
end

function player:update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()  -- This gets the x and y coordinates of the mouse
  
  angle = math.atan2(mouse.y-objects.player.body:getY(), mouse.x-objects.player.body:getX())
  
  self.x = objects.player.body:getX()
  self.y = objects.player.body:getY()
  
  --Shooting
  if love.mouse.isDown(1) and self.canAttack and self.mouseUp then
    self.mouseUp = false
    self.dashing = true
  elseif not love.mouse.isDown(1) and self.dashing and self.canAttack then
    objects.player.body:setLinearVelocity(0,0)
    
    self.nextFire = 0
    self.currentDuration = 0
    self.canAttack = false
    self.dashing = true
    self.attacking = true
    
    sfx:playSlash()
    
    objects.player.body:setGravityScale(0)
    objects.player.body:setLinearDamping(0)
    objects.player.body:applyLinearImpulse(math.cos(angle) * self.impulseSpeed, math.sin(angle) * self.impulseSpeed)
    self.mouseUp = true
  end
  
  if not self.canAttack then
    --Temps de recarrega per tornar a disparar
    self.nextFire = self.nextFire + dt
    self.currentDuration = self.currentDuration + dt
    
    if self.currentDuration >= self.attackDuration then
      objects.player.body:setLinearDamping(3)
      objects.player.body:setGravityScale(3)
      self.dashing = false
    end
    if self.nextFire >= self.fireRate then
      self.canAttack = true
    end
  end
  
  --Update animations
    if not self.canAttack then
      if self.actFrame <= self.nFrames then
        self.actFrame = self.actFrame + self.frameRate*dt
      else
        self.attacking = false
      end
    else
      self.actFrame =1
    end
    player.super.update(self,dt) 
end

function player:draw()
  love.graphics.setColor(1,0,0)
  if self.dashing then
    if math.cos(angle) > 0 then
      self.scaleX = 0.66
    else
      self.scaleX = -0.66
    end
    love.graphics.line(objects.player.body:getX() + math.cos(angle) * 25, objects.player.body:getY() + math.sin(angle) * 25, objects.player.body:getX() + math.cos(angle) * 250, objects.player.body:getY() + math.sin(angle) * 250)
  end
  love.graphics.setColor(1,1,1)
  --love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints())) --DEBUG PHYSICS HITBOX
  
  --Draw animations
  local i = math.floor(self.actFrame)
  love.graphics.draw(self.image, self.frames[i], objects.player.body:getX(), objects.player.body:getY(), 0,self.scaleX,0.66, 111/2 , 135/2)
end

function math.clamp(low, n, high) 
  return math.min(math.max(low, n), high)
end

return player