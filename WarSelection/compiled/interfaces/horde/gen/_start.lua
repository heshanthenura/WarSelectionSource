local nodes = interface.nodes
interfaceScale = interface.scaleWidgets
root.interface.f_create("/project/Tools/scene", "scene", interfaceScale, interfaceScale)
root.interface_scene_active = true
root.interface_scene_priority = -100
root.interface.f_create("/project/Tools/settings", "settings", interfaceScale, interfaceScale, "dumpFileName", root.system_localFolder .. "/dump.dat")
root.interface_settings_priority = 1000
local vSession = root.session_visual
local gSes = root.session_gameplay
isModeNetwork = gSes.streamMode == 1
isModeReplay = gSes.streamMode == 2
local gameplay = gSes.gameplay
local currentFaction = vSession.currentFaction
local chatBanned = gameplay.faction[currentFaction].abilities[18]
local n = nodes[108]
root.interface.f_create("/project/Tools/chat", "chat", interfaceScale, interfaceScale, "banned", chatBanned, "playerNames", toJson(playerNames), "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "sound", 256)
root.interface_chat_active = true
root.interface_chat_priority = 70
local n = nodes[1]
root.interface.f_create("/project/Tools/minimap", "minimap", interfaceScale, interfaceScale, "showEnvs", true, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "targetName", "objectsMinimap", "textureName", "minimapEnvs", "canControl", false)
root.interface_minimap_active = true
root.interface_minimap_priority = 50
if not isModeReplay then
  root.interface.f_create("/project/WarSelection/interfaces/match_result", "matchResult", interfaceScale, interfaceScale)
  root.interface_matchResult_active = true
  root.interface_matchResult_priority = 40
  nodes[68].visible = true
  nodes[68].disabled = true
  raceNotSelected = true
end
if isModeNetwork then
  root.interface.f_create("/project/WarSelection/interfaces/wait_for_connect", "disconnectControl", interfaceScale, interfaceScale)
  root.interface_disconnectControl_active = true
  root.interface_disconnectControl_priority = 60
  root.interface.f_create("/project/WarSelection/interfaces/wait_for_players", "waitingStart", interfaceScale, interfaceScale)
  root.interface_waitingStart_active = true
  root.interface_waitingStart_priority = 60
end
lastUnisSum = 0
playersCount = gameplay.faction_size - 1
interface.sound.f_playMusic(0)
nodes[17].visible = false
unitIcons = {}
local images = interface.content_image
local ut = gameplay.unitType
for i = 1, ut.size do
  unitIcons[i] = findImage(images, "unit" .. i - 1 .. ".png")
end
