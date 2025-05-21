colorReplaces = getParameter("colorReplaces")
sendResNotificationEndTime = 0
gameIsEnded = nil
interfaceScale = interface.scaleWidgets
local gSes = root.session_gameplay
local gameplay = gSes.gameplay
playersFactions = {}
for i = 1, gameplay.player_size do
  table.insert(playersFactions, getPlayerFaction(i - 1))
end
if colorReplaces ~= nil then
  colorReplaces = fromJson(colorReplaces)
  local colors = {}
  for i = 1, #factionColorsBase do
    if colorReplaces[i] == nil then
      table.insert(colors, factionColorsBase[i])
    else
      table.insert(colors, deepCopy(factionColorsBase[colorReplaces[i]]))
    end
  end
  factionColorsBase = colors
end
factionColors = deepCopy(factionColorsBase)
playersColors = {}
factionColorsByTeams = toBool(root.storage_factionColorsByTeams)
updateFactionsColors()
attackPriorityLimitZero = false
attackPriorityLimitHigh = false
buttonAttackMove = false
buttonAttackGround = false
attackGroundList = {}
buttonUnload = false
unloadToPosition = false
buttonStop = false
danceUnitTypes = {}
buttonGatherLast = false
unitsShowWork = false
workButtonsState = {
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0},
  {show = false, workId = 0}
}
local nodes = interface.nodes
playersListPosition = {}
playerStatusOn = nodes[playersListStatus[1]].widget_image
playerStatusOff = nodes[playersListStatus[2]].widget_image
playerStatusMe = nodes[playersListStatus[3]].widget_image
nodes[163].widget_text = "Early Access - v" .. root.f_version(true)
playersChatBan = {}
local vStorage = root.session_visual_dataStorage
playersLocalId = vStorage.playersLocalId
if playersLocalId ~= nil then
  playersLocalId = splitByComma(playersLocalId)
  local bans = root.storage_bans
  if bans ~= nil and playersLocalId ~= nil then
    bans = fromJson(bans)
    if bans ~= nil then
      for plId, plLocal in ipairs(playersLocalId) do
        if bans[plLocal] then
          playersChatBan[plId - 1] = true
        end
      end
    end
  end
end
ticked = false
sessionInited = true
idlerWorkerNum = 1
choosenUnitTypeId = nil
minimapPressed = false
massUpdateMass = true
showMinimapIcons = {}
editorMode = root.project ~= nil
HQ = {
  x = 0,
  y = 0,
  id = nil,
  inst = nil
}
timelineType = "all"
lastDamageTimeMe = -100000
lastDamageTimeAlly = -100000
local nodes = interface.nodes
local gStorage = gameplay.dataStorage
nodes[1139].widget_checked = false
timelineByTeams = false
sendResourcesData = gStorage.srr
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
canSeeEnemySecrets = getParameter("canSeeEnemySecrets")
if canSeeEnemySecrets == nil then
  canSeeEnemySecrets = false
end
canSeeEnemySecrets = canSeeEnemySecrets or isModeReplay
canControl = getParameter("canControl")
if canControl == nil then
  canControl = true
end
canControl = canControl and not isModeReplay
root.session_render_entities_units_showLoadbarForAll = canSeeEnemySecrets
nodes[1149].visible = canSeeEnemySecrets and gStorage.useTimeline ~= nil
nodes[1151].visible = canSeeEnemySecrets
local vSession = root.session_visual
local currentFaction = vSession.currentFaction
local currentPlayer = getPlayerOfFaction(currentFaction)
local scene = gameplay.scene[0]
local teams = scene.teamsCount
local factionsCount = scene.faction_size
teamMode = teams < factionsCount
updateTeamBlocks()
reinitPlayersList(true)
local sFactions = scene.faction
local players = gameplay.player_size
timelineTeams = {}
timelineTeamsCount = 0
for plId = 1, players do
  local func = function(facId)
    local team = sFactions[facId].team + 1
    if timelineTeams[team] == nil then
      timelineTeams[team] = {plId}
    else
      table.insert(timelineTeams[team], plId)
    end
  end
  forEachPlayerFaction(plId - 1, func)
end
for _, _ in pairs(timelineTeams) do
  timelineTeamsCount = timelineTeamsCount + 1
end
nodes[1389].visible = canControl
if gameplay.player[currentPlayer].eliminated then
  nodes[230].visible = true
end
if factionColorsByTeams then
  root.session_visual_script_scripts.f_run(19)
end
root.interface.f_create("/project/Tools/cameraMove", "cameraMove", interfaceScale, interfaceScale, "bordersScroll", toBool(root.storage_bordersScroll))
root.interface_cameraMove_active = true
root.interface_cameraMove_priority = 500
root.interface.f_create("/project/Tools/cinematicCamera", "cinematic", interfaceScale, interfaceScale, "parent", interfaceId)
root.interface_cinematic_priority = 80
root.interface.f_create("/project/Tools/scene", "scene", interfaceScale, interfaceScale, "useFrame", true, "useSignals", true, "bottom", nodes[205].sizeY, "signalScript", 37, "addSelectionHotKey", addSelectionHotKey, "envSignalTags", 128, "directionAppearance", 31)
root.interface_scene_active = true
root.interface_scene_priority = -100
root.interface.f_create("/project/Tools/settings", "settings", interfaceScale, interfaceScale, "dumpFileName", root.system_localFolder .. "/dump.dat", "parent", interfaceId)
root.interface_settings_priority = 1000
local chatBanned = gameplay.faction[currentFaction].abilities[18]
local n = nodes[11]
root.interface.f_create("/project/Tools/chat", "chat", interfaceScale, interfaceScale, "banned", chatBanned, "playerNames", toJson(playerNames), "colors", toJson(factionColors), "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "sound", 256, "bans", toJson(playersChatBan))
root.interface_chat_active = true
root.interface_chat_priority = 70
borderMapState = toBool(root.storage_minimapShowFactions)
if borderMapState then
  vSession.scene[0].factionsMap.f_update(100)
end
minimapShowEnvs = true
if root.storage_minimapShowEnvs ~= nil then
  minimapShowEnvs = toBool(root.storage_minimapShowEnvs)
end
local n = nodes[1]
root.interface.f_create("/project/Tools/minimap", "minimap", interfaceScale, interfaceScale, "signalScript", 37, "showTerritories", borderMapState, "showEnvs", minimapShowEnvs, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "targetName", "objectsMinimap", "textureName", "minimapEnvs")
root.interface_minimap_active = true
root.interface_minimap_priority = 50
local n = nodes[1609]
root.interface.f_create("/project/Tools/minimap", "bigminimap", interfaceScale, interfaceScale, "signalScript", 37, "showTerritories", borderMapState, "showEnvs", minimapShowEnvs, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "targetName", "minimapObjectsBig", "textureName", "minimapEnvsBig")
root.interface_bigminimap_priority = 50
local n = nodes[46]
unitsSelectedGroupInterface = root.interface.f_create("/project/Tools/unitsSelectedGroup", "unitsSelectedGroup", interfaceScale, interfaceScale, "parent", interfaceId, "rightDirection", false, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "allFactionsAsMy", canSeeEnemySecrets)
root.interface[unitsSelectedGroupInterface].active = true
root.interface[unitsSelectedGroupInterface].priority = 30
if isModeReplay then
  root.interface.f_create("/project/Tools/replay", "replay", interfaceScale, interfaceScale, "playerNames", toJson(playerNames), "replayCode", getParameter("replayCode"))
  root.interface_replay_active = true
  root.interface_replay_priority = 40
else
  root.interface.f_create("/project/WarSelection/interfaces/match_result", "matchResult", interfaceScale, interfaceScale)
  root.interface_matchResult_active = true
  root.interface_matchResult_priority = 40
  if canControl then
    local buildReconfigure = getParameter("buildReconfigure")
    root.interface.f_create("/project/WarSelection/interfaces/building_plans", "buildPlans", interfaceScale, interfaceScale, "reconfigure", buildReconfigure)
    root.interface_buildPlans_active = true
    root.interface_buildPlans_priority = 40
  end
end
if isModeNetwork then
  root.interface.f_create("/project/WarSelection/interfaces/wait_for_connect", "disconnectControl", interfaceScale, interfaceScale)
  root.interface_disconnectControl_active = true
  root.interface_disconnectControl_priority = 60
  root.interface.f_create("/project/WarSelection/interfaces/wait_for_players", "waitingStart", interfaceScale, interfaceScale)
  root.interface_waitingStart_active = true
  root.interface_waitingStart_priority = 60
end
local kickRightsPlayer = tonumber(gStorage.kickRightsPlayer)
nodes[378].visible = isModeNetwork and kickRightsPlayer ~= nil and kickRightsPlayer == gSes.controlledPlayer
local abilities = gameplay.faction[currentFaction].abilities
local workersDance = 1 < abilities.size and abilities[1]
local pikemanAgroDance = abilities.size > 4 and abilities[4]
unitCanDance = {
  [1] = workersDance,
  [12] = workersDance,
  [31] = workersDance,
  [55] = workersDance,
  [56] = workersDance,
  [89] = workersDance,
  [90] = workersDance,
  [201] = workersDance,
  [301] = workersDance,
  [349] = workersDance,
  [22] = pikemanAgroDance,
  [36] = pikemanAgroDance,
  [39] = pikemanAgroDance,
  [48] = pikemanAgroDance,
  [72] = pikemanAgroDance,
  [101] = pikemanAgroDance,
  [146] = pikemanAgroDance,
  [119] = pikemanAgroDance,
  [131] = pikemanAgroDance,
  [153] = pikemanAgroDance,
  [164] = pikemanAgroDance,
  [172] = pikemanAgroDance
}
workersAtWork = {0, 0}
boatsAtWork = {0, 0}
workersLowWorkCounter = 0
workersWorstWorkCounter = 0
boatsLowWorkCounter = 0
boatsWorstWorkCounter = 0
victoryPredictions = {}
