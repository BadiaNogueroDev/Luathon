sfx = Object:extend()

soundEffects = {"sfx/Among_Us_Kill.wav" , "sfx/GAME_THEME.wav", "sfx/SWORD_SLASH_1.wav", "sfx/SWORD_SLASH_2.wav", "sfx/SWORD_SLASH_3.wav", "sfx/SWORD_SLASH_4.wav"}

function sfx:new()
  self.amongUsKill = love.audio.newSource(soundEffects[1], 'stream')
  self.amongUsKill:setVolume(0.4)
  
  self.gameTheme = love.audio.newSource(soundEffects[2], 'stream')
  self.gameTheme:setVolume(0.1)
  self.gameTheme:setLooping(true)
  self.gameTheme:play()
  
  
  self.swordSlash = love.audio.newSource(soundEffects[1], 'stream')
  self.swordSlash:setVolume(0.2)
  end

function sfx:playSlash()
  self.swordSlash = love.audio.newSource(soundEffects[math.random(3, 6)], 'stream')
  self.swordSlash:play()
end

function sfx:playKill()
  self.amongUsKill:stop()
  self.amongUsKill:play()
end

return sfx