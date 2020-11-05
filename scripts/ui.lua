local ui = Object:extend()

local timer = 0

function ui:new()
end

function ui:update(dt)
  
  timer = timer + dt
  
end

function ui:draw()
  love.graphics.setColor(0,0,0)
  love.graphics.print(math.floor(timer), 100, 70)
  love.graphics.setColor(1, 1, 1)
end

return ui