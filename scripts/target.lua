local Target = Object:extend()

positionsX = {150, 420, 320, 150, 650, 650, 960, 1450, 1450, 1250, 1450, 1250, 1100, 530, 800, 576, 800, 960, 1035}
positionsY = {314, 157, 476, 642, 805, 642, 805,  805,  642,  462,  314,  166,  462, 157, 464 ,495, 314, 642, 345}
local targetNum = 10

local aliveSprite = love.graphics.newImage('img/Target_Alive.png')
local deadSprite = love.graphics.newImage('img/Target_Ded.png')

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
  local DeltaX = self.x - Max(p.x, Min(self.x, p.x + aliveSprite:getWidth()/2))
  local DeltaY = self.y - Max(p.y, Min(self.y, p.y + aliveSprite:getHeight()/2))
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (30*30) and p.attacking then--Cambiamos la velocidad de la pelota para que vaya hacia el otro lado
    self.isAlive = false
  end
end

function Target:draw()
  --love.graphics.rectangle("fill", self.x - aliveSprite:getWidth()/2, self.y - aliveSprite:getHeight()/2, 30, 30)
  if self.isAlive then
    love.graphics.draw(aliveSprite, self.x, self.y,0 ,2 ,2, aliveSprite:getWidth()/2, aliveSprite:getHeight()/2)
  else
    love.graphics.draw(deadSprite, self.x, self.y, 0, 2, 2, deadSprite:getWidth()/2, deadSprite:getHeight()/2)
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