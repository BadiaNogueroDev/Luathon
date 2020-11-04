local Target = Object:extend()

local positionsX = {100, 250, 340, 400, 570, 660, 720, 830, 890, 940, 1020, 1100, 1230, 1290, 1370, 1460, 1500}
local positionsY = { 70, 150, 400, 350, 580, 220, 460, 590, 420, 360,  690,  200,  480,  190,  300,  610,  200}
local targetNum = 10

function Target:new()
  self.index = math.random(#positionsX)
  
  self.x = positionsX[index]
  self.y = positionsY[index]
  
  table.remove(positionsX, index)
  table.remove(positionsY, index)
end

function Target:update(dt)
end

function Target:draw()
end

return Target