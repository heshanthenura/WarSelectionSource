isUploading = false
nonameFaction = localize("<*factionNoName>")
nonameTeam = localize("<*teamNoName>")
ruler = {nil, nil}
brushSize = 20
cbGraphicsChange = getParameter("cbGraphicsChange")
choosenTexture = 0
texturesCount = getParameter("texturesCount")
assert(texturesCount ~= nil)
placerAppearance = getParameter("placerAppearance")
envsList = {}
hasModNewVersion = 0
notReleasedAttached = 0
local data = fromJson(getParameter("data"))
if data ~= nil then
  nationNames = data.nationNames
  unitNames = data.unitNames
  unitNations = data.unitNations
  nationsAccess = data.nationsAccess
end
factionsColors = fromJson(getParameter("factionsColors"))
local nodes = interface.nodes
local gameplay = root.session_gameplay_gameplay
root.session_render_viewport_farPlane = 6000
local landscape = gameplay.scene[0].landscape
landscapeSize = {
  landscape.size_x,
  landscape.size_y
}
if landscapeSize[1] ~= landscapeSize[2] then
  nodes[259].widget_lines.f_remove(6)
  nodes[259].widget_lines.f_remove(5)
end
local interfaceScale = interface.scaleWidgets
root.interface.f_create("/project/Tools/scene", "scene", interfaceScale, interfaceScale, "left", nodes[39].sizeX)
root.interface_scene_active = true
root.interface_scene_priority = -100
local n = nodes[48]
root.interface.f_create("/project/Tools/minimap", "minimap", interfaceScale, interfaceScale, "repositionWithPlacer", true, "showFow", false, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign, "scale", interface.scaleWidgets)
root.interface_minimap_active = true
root.interface_minimap_priority = 50
root.interface.f_create("/project/Tools/cameraMove", "cameraMove", interfaceScale, interfaceScale, "bordersScroll", toBool(root.storage_bordersScroll))
root.interface_cameraMove_active = true
root.interface_cameraMove_priority = 100
root.interface.f_create("/project/Tools/settings", "settings", interfaceScale, interfaceScale, "mayStopTime", false, "useVeil", false)
root.interface_settings_priority = 90
local data = {
  nationNames = nationNames,
  unitNames = unitNames,
  unitNations = unitNations,
  nationsAccess = nationsAccess
}
local n = nodes[761]
unitPlacingInterface = root.interface.f_create("/project/Tools/unitPlacing", interfaceName .. "-unitPlacing", interfaceScale, interfaceScale, "selfClose", false, "changeFactions", false, "changeAmount", false, "data", toJson(data), "placeInterface", interfaceId, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface[unitPlacingInterface].priority = 60
toolsInterface = root.interface.f_create("/project/Tools/tools", interfaceName .. "-tools", interfaceScale, interfaceScale, "parent", interfaceId)
root.interface[toolsInterface].active = true
workingMapCode = root.session_visual_dataStorage_mapCode
nodes[68].visible = false
nodes[161].disabled = true
nodes[161].widget_text_text = localize("<*defaultMapName>")
nodes[69].visible = false
if workingMapCode == nil then
  nodes[67].visible = false
else
  nodes[67].visible = true
  nodes[50].widget_text_text = "map-" .. workingMapCode
  initUpload("getShort", "getShort", true)
  uploadAddGetData("code", workingMapCode)
  startUpload()
end
updateEnvTypes()
math.randomseed(os.time())
nodes[116].visible = true
markMapSaved()
nodes[94].visible = false
modsG = {
  {
    "6gqH17D5rDl_2",
    ""
  },
  {
    "t0RdMqvHcB9_14",
    ""
  },
  {
    "PqR6QgyQlHb_4",
    ""
  },
  {
    "KgbndOUtoob_10",
    "res0=100,res1=250,res2=0"
  },
  {
    "fIoO5t44ONj_8",
    "limit=100"
  },
  {
    "Rgi6rNgLAmd_5",
    ""
  },
  {
    "BkorbliOBbj_2",
    "updatePeriod=5000,blockLevels=10,unitTag=7,territorySize=10000"
  },
  {
    "osemAL0QGYe_7",
    "waitingTime=180"
  },
  {
    "X6OqsoSYnB2_7",
    ""
  },
  {
    "6OzC814a3Re_1",
    ""
  },
  {
    "lFMtjJTcyml_11",
    ""
  }
}
modsV = {
  {
    "BPoKSILDqIl_1",
    ""
  },
  {
    "8yzJ72ZQArl_2",
    ""
  },
  {
    "AfAIhxPztX1_5",
    ""
  },
  {
    "uKeGCLnotPg_2",
    ""
  },
  {
    "mCpWa2x0F7i_0",
    "height=1724,borders=350"
  },
  {
    "mkrXH0nVJC7_5",
    "unitTags=32"
  },
  {
    "fBB0HwHlfzd_19",
    ""
  }
}
local mapData = fromJson(gameplay.dataStorage_mapData)
if mapData ~= nil then
  if mapData.modsG ~= nil then
    modsG = mapData.modsG
    for _, mod in ipairs(modsG) do
      if string.sub(mod[1], 1, 4) == "mod-" then
        error("Error!!!")
        mod[1] = string.sub(mod[1], 5, 15) .. "_0"
      end
    end
  end
  if mapData.modsV ~= nil then
    modsV = mapData.modsV
    for _, mod in ipairs(modsV) do
      if string.sub(mod[1], 1, 4) == "mod-" then
        error("Error!!!")
        mod[1] = string.sub(mod[1], 5, 15) .. "_0"
      end
    end
  end
end
if mapData == nil or mapData.teams == nil then
  factionsList = {
    {
      name = nonameFaction,
      color = math.random(64),
      relations = {},
      team = 1
    }
  }
  teamsList = {
    {
      name = nonameTeam
    }
  }
else
  factionsList = mapData.factions
  teamsList = mapData.teams
  for _, fac in ipairs(factionsList) do
    if fac.relations == nil then
      fac.relations = {}
    end
    if 0 >= fac.team or fac.team > #teamsList then
      fac.team = 1
    end
  end
end
local lines = nodes[295].widget_lines
lines.f_clear()
for _, team in ipairs(teamsList) do
  lines.f_create(team.name)
end
nodes[293].visible = true
nodes[256].widget_checked = false
local teamsRelations = getTeamsRelations()
for fromTeam = 1, #teamsRelations do
  for toTeam = 1, #teamsRelations do
    local v = teamsRelations[fromTeam][toTeam]
    if v ~= 0 and v ~= 1 and v ~= 2 and v ~= 4 then
      nodes[256].widget_checked = true
    end
  end
end
if not nodes[256].widget_checked then
  for fromFac = 1, #factionsList do
    for toFac = 1, #factionsList do
      if factionsList[fromFac].team == factionsList[toFac].team then
        factionsList[fromFac].relations[toFac] = true
      end
    end
  end
end
nodes[249].widget_checked = true
for fromFac = 1, #factionsList do
  for toFac = 1, #factionsList do
    if factionsList[fromFac].relations[toFac] ~= factionsList[toFac].relations[fromFac] then
      nodes[249].widget_checked = false
    end
  end
end
updateTeamsList()
updateFactionsList()
nodes[303].widget_currentLine = 0
nodes[289].widget_currentLine = 0
onTeamSelect(1)
onFactionSelect(1)
switchToFactions()
for i = 1, 64 do
  nodes[330 + i].widget_color_value = factionsColors[i][1]
end
local lines = nodes[92].widget_lines
for _, mod in pairs(modsG) do
  lines.f_create(mod[1])
end
local lines = nodes[8].widget_lines
for _, mod in pairs(modsV) do
  lines.f_create(mod[1])
end
loadModsInfo()
nodes[534].visible = true
nodes[439].visible = true
nodes[469].visible = false
enableTexturingGrass(true)
