interfaceScale = interface.scaleWidgets
local nodes = interface.nodes
local vSes = root.session_visual
local gSes = root.session_gameplay
local gameplay = gSes.gameplay
local vStorage = vSes.dataStorage
local gStorage = gameplay.dataStorage
nodes[163].widget_text = "Early Access - v" .. root.version
myFactionId = vSes.currentFaction
staticData = fromJson(gStorage.static)
ticked = false
sessionInited = true
editorMode = root.project ~= nil
local streamMode = gSes.streamMode
isModeSingle = streamMode == 0
isModeNetwork = streamMode == 1
isModeReplay = streamMode == 2
local pns = vStorage.playerNames
playerNames = nil
playerFonts = nil
if pns ~= "" then
  playerNames = fromJson(pns)
  playerRankings = fromJson(vStorage.playerRankings)
  if playerNames ~= nil then
    playerFonts = {}
    for i = 1, #playerNames do
      if editorMode and playerRankings ~= nil then
        playerNames[i] = "(" .. playerRankings[i] .. ") " .. playerNames[i]
      end
      local font = fonts[root.functions.f_detectLanguage(playerNames[i])]
      assert(font ~= nil)
      table.insert(playerFonts, font)
    end
  end
end
controlledPlayer = gSes.controlledPlayer
myFactionNum = staticData.players[controlledPlayer].factionNum
myTeamNum = staticData.players[controlledPlayer].teamNum
myPlayerNum = staticData.players[controlledPlayer].playerNum
dynamicData = fromJson(gStorage.dynamic)
for teamNum, teamData in ipairs(staticData.teams) do
  for plNum, plData in ipairs(teamData) do
    local itf = playerInterfaces[teamNum][plNum]
    local plId = plData.playerId
    if itf.panel ~= nil then
      nodes[itf.panel].visible = dynamicData.teams[teamNum].players[plNum].active
    end
    writePlayerToWidget(plId, nodes[itf.name].widget, factionColorsBase[plId + 1][1], factionColorsBase[plId + 1][2])
  end
end
nodes[185].widget_text = staticData.middlePercent - 100 .. "%"
nodes[177].widget_text = staticData.middlePercent - 100 .. "%"
local interfaces = root.interface
interfaces.f_create("/project/Tools/cameraMove", "cameraMove", interfaceScale, interfaceScale, "bordersScroll", toBool(root.storage_bordersScroll))
interfaces.cameraMove_active = true
interfaces.cameraMove_priority = 100
interfaces.f_create("/project/Tools/cinematicCamera", "cinematic", interfaceScale, interfaceScale)
interfaces.cinematic_priority = 80
interfaces.f_create("/project/Tools/scene", "scene", interfaceScale, interfaceScale, "useDrag", 1, "useSignals", true, "bottom", nodes[85].sizeY, "signalScript", 37)
interfaces.scene_active = true
interfaces.scene_priority = -100
local n = nodes[2]
interfaces.f_create("/project/Tools/minimap", "minimap", interfaceScale, interfaceScale, "moveScript", 11, "signalScript", 37, "showTerritories", false, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "targetName", "objectsMinimap", "textureName", "minimapEnvs")
interfaces.minimap_active = true
interfaces.minimap_priority = 50
interfaces.f_create("/project/Tools/settings", "settings", interfaceScale, interfaceScale, "dumpFileName", root.system_localFolder .. "/dump.dat")
interfaces.settings_priority = 1000
local chatBanned = gameplay.faction[myFactionId].abilities[18]
local n = nodes[6]
interfaces.f_create("/project/Tools/chat", "chat", interfaceScale, interfaceScale, "banned", chatBanned, "playerNames", toJson(playerNames), "colors", toJson(factionColorsBase), "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
interfaces.chat_active = true
interfaces.chat_priority = 70
if not isModeReplay then
  interfaces.f_create("/project/WarSelection/interfaces/match_result", "matchResult", interfaceScale, interfaceScale)
  interfaces.matchResult_active = true
  interfaces.matchResult_priority = 40
end
if isModeNetwork then
  interfaces.f_create("/project/WarSelection/interfaces/wait_for_connect", "disconnectControl", interfaceScale, interfaceScale)
  interfaces.disconnectControl_active = true
  interfaces.disconnectControl_priority = 60
  interfaces.f_create("/project/WarSelection/interfaces/wait_for_players", "waitingStart", interfaceScale, interfaceScale)
  interfaces.waitingStart_active = true
  interfaces.waitingStart_priority = 60
end
playersChatBan = {}
nodes[189].widget_middle_set_normal = researchIcons[41]
