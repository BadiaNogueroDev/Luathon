local menu = Object:extend()

local function newButton (text, fn)
  return{
    text = text,
    fn = fn,
    
    now = false,
    last = false,
    }
end

local buttons = {}

function menu:new()
  background = love.graphics.newImage("sprites/Fons-Paper.png")
  
  table.insert(buttons, newButton("Start Game", function() 
                        inGame = true
                        startGame() end))
  --[[table.insert(buttons, newButton("Scoreboard", function() 
                        mainMenu = false
                        gameStarted = false
                        scoreboard = true
                        sBoard:printLeaderboard() end))
  ]]--
  table.insert(buttons, newButton("Exit Game", function() love.event.quit(0) end))
end


function menu:draw()
  love.graphics.draw(background)
  
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()
  
  local buttonWidth = w/2.5
  local buttonHeight = h/12
  local margin = 15
  
  local totalHeight = (buttonHeight + margin) * #buttons
  local cursorY = 0
  
  for i, button in ipairs(buttons) do
    button.last = button.now
    
    local buttonX = w/2 - buttonWidth/2
    local buttonY = h/2 - totalHeight/2 + cursorY
    local color = {0.4, 0.4, 0.5}
    local mX, mY = love.mouse.getPosition()
    
    --Highlight
    local highlight = mX > buttonX and mX < buttonX + buttonWidth and mY > buttonY and mY < buttonY + buttonHeight
    if highlight then
      color = {0.8, 0.8, 0.9}
    end
    
    --Detectar un solo clic
    button.now = love.mouse.isDown(1)
    if button.now and not button.last and highlight then
      button.fn()
    end
    
    love.graphics.setColor(unpack(color))
    love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight)
    
    love.graphics.setColor(0, 0, 0)
    
    local textW = font:getWidth(button.text)
    local textH = font:getHeight(button.text)
    
    love.graphics.print(button.text, w/2 - textW/2, buttonY + textH/10)
    
    love.graphics.setColor(1, 1, 1)
    
    cursorY = cursorY + (buttonHeight + margin)
  end
end

return menu