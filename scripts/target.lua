local Target = Object:extend()

positionsX = {150, 420, 320, 150, 650, 650, 960, 1450, 1450, 1250, 1450, 1250, 1100, 530, 800, 576, 800, 960, 1035}
positionsY = {314, 157, 476, 642, 805, 642, 805,  805,  642,  462,  314,  166,  462, 157, 464 ,495, 314, 642, 345}
local targetNum = 10

local aliveSprite = love.graphics.newImage('img/Target_Alive_Drawing.png')
local deadSprite = love.graphics.newImage('img/Target_Ded_Drawing.png')

function Target:new()
  self.index = math.random(#positionsX)
  --print(self.index)
  
  self.x = positionsX[self.index]
  --print("TargetX " .. self.x)
  self.y = positionsY[self.index]
  --print("TargetY " .. self.y .. "\n")
  
  table.remove(positionsX, self.index)
  table.remove(positionsY, self.index)
  
  self.isAlive = true
end

function Target:update(dt)
  local DeltaX = self.x - Max(p.x, Min(self.x, p.x))
  local DeltaY = self.y - 10 - Max(p.y, Min(self.y - 10, p.y))
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (30*30) and p.attacking and self.isAlive then
    self.isAlive = false
    sfx:playKill()
    targetsAlive = targetsAlive - 1
    print(targetsAlive)
  end
end

function Target:draw()
  --love.graphics.circle("fill", self.x, self.y - 10, 25, 25) --DEBUG COLLISION HITBOX
  if self.isAlive then
    love.graphics.draw(aliveSprite, self.x, self.y,0 ,0.66 ,0.66, aliveSprite:getWidth()/2, aliveSprite:getHeight()/2)
  else
    love.graphics.draw(deadSprite, self.x, self.y, 0, 0.66, 0.66, deadSprite:getWidth()/2, deadSprite:getHeight()/2)
  end
end

function Max(a, b)
  if a > b then 
    return a
  else 
    return b
  end
end

function Min(a, b)
  if a > b then
    return b
  else 
    return a
  end
end

return Target