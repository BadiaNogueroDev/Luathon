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
  title = love.graphics.newImage("sprites/title.png")
  startButton = love.graphics.newImage("sprites/Start-Button.png")
  exitButton = love.graphics.newImage("sprites/Exit-Button.png")
  
  table.insert(buttons, newButton("", function() --Start Game
                        inGame = true
                        startGame() end))
  --[[table.insert(buttons, newButton("Scoreboard", function() 
                        mainMenu = false
                        gameStarted = false
                        scoreboard = true
                        sBoard:printLeaderboard() end))
  ]]--
  table.insert(buttons, newButton("", function() love.event.quit(0) end)) --Exit Game
end


function menu:draw()
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()
  
  local spriteWidth = 1
  local spriteHeight = 1
  local buttonWidth = w/2.5
  local buttonHeight = h/8
  
  local margin = 80
  
  local totalHeight = (buttonHeight + margin) * #buttons
  local totalSpriteHeight = (spriteHeight + margin) * #buttons
  local cursorY = 0
  
  love.graphics.draw(title, w/2 - title:getWidth()/2, 100)
  
  for i, button in ipairs(buttons) do
    button.last = button.now
    
    local spriteX = w/2 - startButton:getWidth()/2
    local spriteY = h/2 - totalSpriteHeight/4 + cursorY
    
    local buttonX = w/2 - buttonWidth/2
    local buttonY = h/2 - totalHeight/4 + cursorY
    local color = {0.4, 0.4, 0.5}
    local mX, mY = love.mouse.getPosition()
    
    --Highlight
    local highlight = mX > buttonX and mX < buttonX + buttonWidth and mY > buttonY and mY < buttonY + buttonHeight
    if highlight then
      color = {0.8, 0.8, 0.9, 0.2}
    end
    
    --Detectar un solo clic
    button.now = love.mouse.isDown(1)
    if button.now and not button.last and highlight then
      button.fn()
    end
    
    love.graphics.setColor(unpack(color))
    if i == 1 then
      love.graphics.draw(startButton, spriteX, buttonY)
    else
      love.graphics.draw(exitButton, spriteX, buttonY)
    end
  
    --love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight)
    
    love.graphics.setColor(1, 1, 1)
    
    cursorY = cursorY + (buttonHeight + margin)
  end
end

return menu