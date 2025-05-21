local nodes = interface.nodes
local storage = root.storage
if getParameter("value") == 1 then
  storage.set = {
    "musicVolume",
    tonumber(storage.musicVolumeDisabled)
  }
  storage.set = {
    "musicVolumeDisabled",
    0
  }
else
  storage.set = {
    "musicVolumeDisabled",
    tonumber(storage.musicVolume)
  }
  storage.set = {
    "musicVolume",
    0
  }
end
initSoundVolume()
