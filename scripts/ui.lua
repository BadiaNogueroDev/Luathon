local ui = Object:extend()

local timer = 0

function ui:new()
  mainButton = love.graphics.newImage("sprites/home.png")
end

function ui:update(dt)
  
  timer = timer + dt
  
end

function ui:draw()
  love.graphics.setColor(0,0,0)
  love.graphics.print(math.floor(timer), 100, 70)
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(mainButton, 1380, 80, 0, 0.6, 0.6)
end

return ui