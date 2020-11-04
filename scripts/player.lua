player = Object:extend()

mouse = {} --Guarda las cordenadas del mouse

function player:new(x, y)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.impulseSpeed = 1000
  self.jumpForce = -150
  
  self.forward = Vector.new(fx or 1,fy or 0)
  self.airborn = true --El personatge esta al aire
  
  --Player in the physics system
  objects.player = {}
  objects.player.body = love.physics.newBody(world, 850, 600, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  objects.player.shape = love.physics.newRectangleShape(0, 0, 50, 80) --the players' shape is 50 by 80
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.player.body:setLinearDamping(2)
  objects.player.body:setGravityScale(2)
  objects.player.body:setFixedRotation(true)
  
  --Player shooting
  self.attacking = false --El personatge esta disparant
  self.fireRate = 0.2
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
end

function player:update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()  -- This gets the x and y coordinates of the mouse
  VelocityX, VelocityY = objects.player.body:getLinearVelocity()


  --Shooting
  if love.mouse.isDown(1) then
    --angle = math.atan2(mouse.y-(height/2), mouse.x-(width/2))
    --playerx = playerx + math.cos(angle) * dt * self.speed
    --playery = playery + math.sin(angle) * dt * self.speed
    --[[if canShoot then
      self.nextFire = 0
      canShoot = false
      self.attacking = true
    end--]]
    objects.player.body:applyLinearImpulse(100, 100)
  end
  
  --Coordinar el spawn de la bala amb el moment de la animacio que li toca
  if self.attacking then
    --Temps de recarrega per tornar a disparar
    self.nextFire = self.nextFire + dt
    if self.nextFire >= self.fireRate then
      canShoot = true
    end
  end
end

function player:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints())) --DEBUG PHYSICS HITBOX
end

return player