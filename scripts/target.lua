local Target = Object:extend()

local positionsX = {100, 250, 340, 400, 570, 660, 720, 830, 890, 940, 1020, 1100, 1230, 1290, 1370, 1460, 1500}
local positionsY = { 70, 150, 400, 350, 580, 220, 460, 590, 420, 360,  690,  200,  480,  190,  300,  610,  200}
local targetNum = 10

local aliveSprite = love.graphics.newImage('img/Target_Alive.png')
local deadSprite = love.graphics.newImage('img/Target_Ded.png')

function Target:new()
  self.index = math.random(#positionsX)
  print(self.index)
  
  self.x = positionsX[index]
  --print("TargetX " .. self.x)
  self.y = positionsY[index]
  --print("TargetY " .. self.y)
  
  table.remove(positionsX, index)
  table.remove(positionsY, index)
  
  self.isAlive = true
end

function Target:update(dt)
end

function Target:draw()
  if self.isAlive then
    love.graphics.draw(aliveSprite, self.x, self.y)
  else
    love.graphics.draw(deadSprite, self.x, self.y)
  end
end

return Target