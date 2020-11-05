love.graphics.setDefaultFilter("nearest", "nearest") --Es como el "point no filter" de Unity: hace que el pixel art no se le aplique filtro

Object = require "lib/classic"

Vector = require "lib/vector"

Actor = require "lib/actor"

local player = player or require "scripts/player"

local target = target or require "scripts/target"

local menu = menu or require "scripts/menu"

local mainMap = mainMap or require "scripts/mainMap"

actorList = {}

local numOfTargets = 10 --Esto se puede cambiar

function love.load()
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  love.window.setMode(w, h)

  math.randomseed(os.time())

  m = menu()
  
  inGame = false
  startGame()
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  
  if inGame then
    map:update(dt)
    p:update(dt)
    for _,v in ipairs(actorList) do
      v:update(dt, v.x, v.y)
    end
  else
    m:update(dt)
  end
end

function love.draw()
  if inGame then
    map:draw()
    p:draw()
    for _,v in ipairs(actorList) do
      v:draw()
    end
  else
    m:draw()
  end
end

function startGame()
  --ELEMENTS IN-GAME
  map = mainMap
  map:new()
  
  p = player
  p:new()
  
  for i = 0, numOfTargets, 1 do
    --print("Target num "..i)
    t = target:extend()
    t:new()
    table.insert(actorList, t)
  end
  
  inGame = true
end

function mainMenu()
  inGame = false
  m:new()
end