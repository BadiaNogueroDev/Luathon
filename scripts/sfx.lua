local soundEffects = {"sfx/Among_Us_Kill.wav" , "sfx/GAME_THEME.wav", "sfx/SWORD_SLASH.wav"}

function sfx:new()
  
  self.amongUsKill = love.audio.newSource(soundEffects[1], 'stream')
  self.amongUsKill:setVolume(0.2)
  
  self.gameTheme = love.audio.newSource(sfx[2], 'stream')
  self.gameTheme:setVolume(0.1)
  self.gameTheme:setLooping(true)
  self.gameTheme:play()
  
  
  self.swordSlash = love.audio.newSource(soundEffects[1], 'stream')
  self.swordSlash:setVolume(0.2)
  end
