local Target = Object:extend()

positionsX = {150, 420, 320, 150, 650, 650, 960, 1450, 1450, 1250, 1450, 1250, 1100, 530, 800, 576, 800, 960, 1035}
positionsY = {314, 157, 476, 642, 805, 642, 805,  805,  642,  462,  314,  166,  462, 157, 464 ,495, 314, 642, 345}
local targetNum = 10

local aliveSprite = love.graphics.newImage('img/Target_Alive.png')
local deadSprite = love.graphics.newImage('img/Target_Ded.png')

function Target:new()
  self.index = math.random(#positionsX)
  print(self.index)
  
  self.x = positionsX[self.index]
  --print("TargetX " .. self.x)
  self.y = positionsY[self.index]
  --print("TargetY " .. self.y .. "\n")
  
  table.remove(positionsX, self.index)
  table.remove(positionsY, self.index)
  
  self.isAlive = true
end

function Target:update(dt)
  
  --if Vector.distance(target, p) < 10 then
    --print("Touching")
  --end
end

function Target:draw()
  if self.isAlive then
    love.graphics.draw(aliveSprite, self.x, self.y,0 ,2 ,2, aliveSprite:getWidth()/2, aliveSprite:getHeight()/2)
  else
    love.graphics.draw(deadSprite, self.x, self.y, 0, 2, 2, deadSprite:getWidth()/2, deadSprite:getHeight()/2)
  end
end

return Target