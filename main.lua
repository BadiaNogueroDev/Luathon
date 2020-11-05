Object = require "lib/classic"

Vector = require "lib/vector"

Actor = require "lib/actor"

local player = player or require "scripts/player"

local target = target or require "scripts/target"

local menu = menu or require "scripts/menu"

local mainMap = mainMap or require "scripts/mainMap"

local ui = ui or require "scripts/ui"

local sfx = sfx or require "scripts/sfx"

actorList = {}

gameElements = {}

numOfTargets = 10 --Esto se puede cambiar

function love.load()
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  
  background = love.graphics.newImage("sprites/Fons-Paper.png")

  font = love.graphics.newFont('fonts/Pixeled.ttf', 20)
  love.graphics.setFont (font)
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  love.window.setMode(w, h)

  math.randomseed(os.time())

  m = menu
  m:new()
  
  s = sfx:extend()
  sfx:new()
  
  inGame = false
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  
  if inGame then
    for _,v in ipairs(gameElements) do
      v:update(dt)
    end
    for _,v in ipairs(actorList) do
      v:update(dt, v.x, v.y)
    end
  end
end

function love.draw()
  if inGame then
    gameElements[1]:draw()
    gameElements[2]:draw()
    for _,v in ipairs(actorList) do
      v:draw()
    end
    
    gameElements[3]:draw() --No s'ha fet servir un for aqui perque quan acabes un nivell vols el missatge per sobre de tot
  else
    love.graphics.draw(background)
    m:draw()
  end
end

function startGame()
  --ELEMENTS IN-GAME
  map = mainMap
  map:new()
  table.insert(gameElements, map)
  
  p = player
  p:new()
  table.insert(gameElements, p)
  
  ui = ui
  ui:new()
  table.insert(gameElements, ui)
  
  for i = 1, numOfTargets, 1 do
    --print("Target num "..i)
    t = target:extend()
    t:new()
    table.insert(actorList, t)
  end
end

function restartGame()
  inGame = false
  --ELEMENTS INGAME
  actorList = {}

  gameElements = {}
  
  --ELEMENTS DEL MAPA INGAME
  platformsList = {}
  
  objects = {}
  
  positionsX = {150, 420, 320, 150, 650, 650, 960, 1450, 1450, 1250, 1450, 1250, 1100, 530, 800, 576, 800, 960, 1035}
  positionsY = {314, 157, 476, 642, 805, 642, 805,  805,  642,  462,  314,  166,  462, 157, 464 ,495, 314, 642,  345}
end