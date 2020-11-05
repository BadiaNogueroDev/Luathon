Object = require "lib/classic"

Vector = require "lib/vector"

Actor = require "lib/actor"

local player = player or require "scripts/player"

local menu = menu or require "scripts/menu"

local mainMap = mainMap or require "scripts/mainMap"

actorList = {}

function love.load()
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  love.graphics.setDefaultFilter("nearest", "nearest") --Es el "point no filter" de Unity: hace que el pixel art no se le aplique filtro
  
  love.window.setMode(w, h)

  --m = menu
  --m:new()
  
  inGame = false
  startGame()
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  
  if inGame then
    map:update(dt)
    p:update(dt)
    for _,v in ipairs(actorList) do
      v:update(dt)
    end
  else
    --m:update(dt)
  end
end

function love.draw()
  if inGame then
    map:draw()
    p:draw()
  else
    --m:draw()
  end
end

function startGame()
  --ELEMENTS IN-GAME
  map = mainMap
  map:new()
  
  p = player
  p:new()
  
  inGame = true
end

function mainMenu()
  inGame = false
  m:new()
end