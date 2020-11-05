local ui = Object:extend()

levelComplete = love.graphics.newImage("sprites/level-complete.png")

local function newButton (text, fn)
  return{
    text = text,
    fn = fn,
    
    now = false,
    last = false,
    }
end

local buttons = {}

local timer = 0

function ui:new()
  buttons = {}
  targetsAlive = numOfTargets
  mainButton = love.graphics.newImage("sprites/home.png")
  table.insert(buttons, newButton("", function() restartGame() end))
  timer = 0
end

function ui:update(dt)
  if targetsAlive > 0 then
    timer = timer + dt
  end
end

function ui:draw()
  love.graphics.setColor(0,0,0)
  love.graphics.print(math.floor(timer), 100, 70)
  love.graphics.setColor(1, 1, 1)
  
  
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()
  
  local spriteWidth = 0.6
  local spriteHeight = 0.6
  
  local buttonWidth = 120
  local buttonHeight = 120
  
  local margin = 0
  
  local totalSpriteHeight = (spriteHeight + margin) * #buttons
  local cursorY = 0
  
  if targetsAlive <= 0 then
    love.graphics.draw(levelComplete, w/2, h/2, 0, 1, 1, levelComplete:getWidth()/2, levelComplete:getHeight()/2)
    
    for i, button in ipairs(buttons) do
      button.last = button.now
      
      local spriteX = 1380
      local spriteY = 80 + cursorY
  
      local color = {0.4, 0.4, 0.5}
      local mX, mY = love.mouse.getPosition()
      
      --Highlight
      local highlight = mX > spriteX and mX < spriteX + buttonWidth and mY > spriteY and mY < spriteY + buttonHeight
      if highlight then
        color = {0.8, 0.8, 0.9, 0.2}
      end
      
      --Detectar un solo clic
      button.now = love.mouse.isDown(1)
      if button.now and not button.last and highlight then
        button.fn()
      end
      
      love.graphics.setColor(unpack(color))
      love.graphics.draw(mainButton, spriteX, spriteY, 0, spriteWidth, spriteHeight)
    
      love.graphics.rectangle("fill", spriteX, spriteY, spriteWidth, spriteHeight)
      
      love.graphics.setColor(1, 1, 1)
      
      cursorY = cursorY + (buttonHeight + margin)
    end
  end
end


return ui