mainMap = Object:extend()

function mainMap:new()
  --PHYSICS FUNCTIONS
  
  objects = {} -- table to hold all our physical objects
  
  platformsList = {}
  
  --let's create the ground
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 1600/2, 900-74/2) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.ground.shape = love.physics.newRectangleShape(1600, 74) --make a rectangle with a width of 1600 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) --attach shape to body
  table.insert(platformsList, objects.ground)
  
  objects.leftWall = {}
  objects.leftWall.body = love.physics.newBody(world, 74/2 +8, 450) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.leftWall.shape = love.physics.newRectangleShape(89, 900) --make a rectangle with a width of 1600 and a height of 50
  objects.leftWall.fixture = love.physics.newFixture(objects.leftWall.body, objects.leftWall.shape) --attach shape to body
  table.insert(platformsList, objects.leftWall)
  
  objects.rightWall = {}
  objects.rightWall.body = love.physics.newBody(world, 1600-80/2 -4, 450) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.rightWall.shape = love.physics.newRectangleShape(89, 900) --make a rectangle with a width of 1600 and a height of 50
  objects.rightWall.fixture = love.physics.newFixture(objects.rightWall.body, objects.rightWall.shape) --attach shape to body
  table.insert(platformsList, objects.rightWall)
  
  objects.topWall = {}
  objects.topWall.body = love.physics.newBody(world, 1600/2, 74/2) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.topWall.shape = love.physics.newRectangleShape(1600, 74) --make a rectangle with a width of 1600 and a height of 50
  objects.topWall.fixture = love.physics.newFixture(objects.topWall.body, objects.topWall.shape) --attach shape to body
  table.insert(platformsList, objects.topWall)
  
  objects.platform1 = {}
  objects.platform1.body = love.physics.newBody(world, 169, 676) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform1.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform1.fixture = love.physics.newFixture(objects.platform1.body, objects.platform1.shape) --attach shape to body
  table.insert(platformsList, objects.platform1)
  
  objects.platform2 = {}
  objects.platform2.body = love.physics.newBody(world, 89 + 158*3, 676) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform2.shape = love.physics.newRectangleShape(316, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform2.fixture = love.physics.newFixture(objects.platform2.body, objects.platform2.shape) --attach shape to body
  table.insert(platformsList, objects.platform2)
  
  objects.platform3 = {}
  objects.platform3.body = love.physics.newBody(world, 89 + 158*4 -13, 756) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform3.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform3.fixture = love.physics.newFixture(objects.platform3.body, objects.platform3.shape) --attach shape to body
  table.insert(platformsList, objects.platform3)
  
  objects.platform4 = {}
  objects.platform4.body = love.physics.newBody(world, 89 + 158*3 + 13, 596) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform4.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform4.fixture = love.physics.newFixture(objects.platform4.body, objects.platform4.shape) --attach shape to body
  table.insert(platformsList, objects.platform4)
  
  objects.platform5 = {}
  objects.platform5.body = love.physics.newBody(world, 169, 676 -150*2 -28) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform5.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform5.fixture = love.physics.newFixture(objects.platform5.body, objects.platform5.shape) --attach shape to body
  table.insert(platformsList, objects.platform5)
  
  objects.platform6 = {}
  objects.platform6.body = love.physics.newBody(world, 89 + 160 -13, 676 - 258) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform6.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform6.fixture = love.physics.newFixture(objects.platform6.body, objects.platform6.shape) --attach shape to body
  table.insert(platformsList, objects.platform6)
  
  objects.platform7 = {}
  objects.platform7.body = love.physics.newBody(world, 89 + 227, 510) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform7.shape = love.physics.newRectangleShape(186, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform7.fixture = love.physics.newFixture(objects.platform7.body, objects.platform7.shape) --attach shape to body
  table.insert(platformsList, objects.platform7)
  
  objects.platform9 = {}
  objects.platform9.body = love.physics.newBody(world, 89 + 320 -13, 676 - 258 -160) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform9.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform9.fixture = love.physics.newFixture(objects.platform9.body, objects.platform9.shape) --attach shape to body
  table.insert(platformsList, objects.platform9)
  
  objects.platform10 = {}
  objects.platform10.body = love.physics.newBody(world, 89 + 480 -13, 676 - 258 -160) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform10.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform10.fixture = love.physics.newFixture(objects.platform10.body, objects.platform10.shape) --attach shape to body
  table.insert(platformsList, objects.platform10)
  
  objects.platform11 = {}
  objects.platform11.body = love.physics.newBody(world, 429, 676 - 258 -227) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform11.shape = love.physics.newRectangleShape(240, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform11.fixture = love.physics.newFixture(objects.platform11.body, objects.platform11.shape) --attach shape to body
  table.insert(platformsList, objects.platform11)
  
  objects.platform12 = {}
  objects.platform12.body = love.physics.newBody(world, 236 + 240, 134) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform12.shape = love.physics.newRectangleShape(26, 120) --make a rectangle with a width of 1600 and a height of 50
  objects.platform12.fixture = love.physics.newFixture(objects.platform12.body, objects.platform12.shape) --attach shape to body
  table.insert(platformsList, objects.platform12)
  
  objects.platform13 = {}
  objects.platform13.body = love.physics.newBody(world, 1600/2, 120) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform13.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform13.fixture = love.physics.newFixture(objects.platform13.body, objects.platform13.shape) --attach shape to body
  table.insert(platformsList, objects.platform13)
  
  objects.platform14 = {}
  objects.platform14.body = love.physics.newBody(world, 1600/2, 676 -150*2 -28) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform14.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform14.fixture = love.physics.newFixture(objects.platform14.body, objects.platform14.shape) --attach shape to body
  table.insert(platformsList, objects.platform14)
  
  objects.platform15 = {}
  objects.platform15.body = love.physics.newBody(world, 1600/2, 676 -150 -28) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform15.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform15.fixture = love.physics.newFixture(objects.platform15.body, objects.platform15.shape) --attach shape to body
  table.insert(platformsList, objects.platform15)
  
  objects.platform16 = {}
  objects.platform16.body = love.physics.newBody(world, 1600 - 150, 676 -150*2 -28) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform16.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform16.fixture = love.physics.newFixture(objects.platform16.body, objects.platform16.shape) --attach shape to body
  table.insert(platformsList, objects.platform16)
  
  objects.platform17 = {}
  objects.platform17.body = love.physics.newBody(world, 1600 - 150, 676) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform17.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform17.fixture = love.physics.newFixture(objects.platform17.body, objects.platform17.shape) --attach shape to body
  table.insert(platformsList, objects.platform17)
  
  objects.platform18 = {}
  objects.platform18.body = love.physics.newBody(world, 1600 - 420, 676 -180) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform18.shape = love.physics.newRectangleShape(312, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform18.fixture = love.physics.newFixture(objects.platform18.body, objects.platform18.shape) --attach shape to body
  table.insert(platformsList, objects.platform18)
  
  objects.platform19 = {}
  objects.platform19.body = love.physics.newBody(world, 1600 - 420, 676 -240) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform19.shape = love.physics.newRectangleShape(26, 480) --make a rectangle with a width of 1600 and a height of 50
  objects.platform19.fixture = love.physics.newFixture(objects.platform19.body, objects.platform19.shape) --attach shape to body
  table.insert(platformsList, objects.platform19)
  
  objects.platform20 = {}
  objects.platform20.body = love.physics.newBody(world, 1600 - 563, 676 -250) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform20.shape = love.physics.newRectangleShape(26, 120) --make a rectangle with a width of 1600 and a height of 50
  objects.platform20.fixture = love.physics.newFixture(objects.platform20.body, objects.platform20.shape) --attach shape to body
  table.insert(platformsList, objects.platform20)
  
  objects.platform21 = {}
  objects.platform21.body = love.physics.newBody(world, 1600 - 353, 200) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform21.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform21.fixture = love.physics.newFixture(objects.platform21.body, objects.platform21.shape) --attach shape to body
  table.insert(platformsList, objects.platform21)
  
  objects.platform22 = {}
  objects.platform22.body = love.physics.newBody(world, 1600/2 + 169, 676) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform22.shape = love.physics.newRectangleShape(160, 26) --make a rectangle with a width of 1600 and a height of 50
  objects.platform22.fixture = love.physics.newFixture(objects.platform22.body, objects.platform22.shape) --attach shape to body
  table.insert(platformsList, objects.platform22)
  
  objects.platform23 = {}
  objects.platform23.body = love.physics.newBody(world, 1600/2 + 249 -13, 756) --remember, the shape (the rectangle we create next) anchors to the body from its center
  objects.platform23.shape = love.physics.newRectangleShape(26, 160) --make a rectangle with a width of 1600 and a height of 50
  objects.platform23.fixture = love.physics.newFixture(objects.platform23.body, objects.platform23.shape) --attach shape to body
  table.insert(platformsList, objects.platform23)
  
  --initial graphics setup
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
  
end

function mainMap:update(dt)
  
end

function mainMap:draw()
  love.graphics.setColor(0,0,0)
  --love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
  --love.graphics.polygon("fill", objects.leftWall.body:getWorldPoints(objects.leftWall.shape:getPoints()))
  --love.graphics.polygon("fill", objects.rightWall.body:getWorldPoints(objects.rightWall.shape:getPoints()))
  --love.graphics.polygon("fill", objects.topWall.body:getWorldPoints(objects.topWall.shape:getPoints()))
  for _,v in ipairs(platformsList) do
    love.graphics.polygon("fill", v.body:getWorldPoints(v.shape:getPoints()))
  end
end

return mainMap