local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
end
local reconfigure = getParameter("reconfigure")
buildButtons = {
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17
}
buildButtonsLockers = {
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  32,
  33
}
buildPlansAbilities = {
  {
    6,
    2,
    1,
    -1,
    4,
    -1,
    -1,
    -1,
    -1,
    3,
    -1,
    -1,
    5,
    -1,
    -1,
    -1
  },
  {
    68,
    8,
    9,
    23,
    10,
    -1,
    11,
    -1,
    13,
    22,
    -1,
    -1,
    12,
    -1,
    -1,
    -1
  },
  {
    71,
    15,
    16,
    30,
    17,
    19,
    18,
    -1,
    20,
    -1,
    -1,
    -1,
    21,
    -1,
    -1,
    -1
  },
  {
    74,
    26,
    28,
    48,
    44,
    -1,
    -1,
    45,
    46,
    47,
    -1,
    -1,
    49,
    50,
    -1,
    -1
  },
  {
    77,
    27,
    29,
    37,
    31,
    -1,
    32,
    33,
    35,
    36,
    -1,
    -1,
    34,
    -1,
    -1,
    -1
  },
  {
    80,
    40,
    42,
    51,
    52,
    54,
    53,
    67,
    57,
    55,
    -1,
    58,
    56,
    -1,
    -1,
    -1
  },
  {
    83,
    41,
    43,
    59,
    60,
    61,
    62,
    -1,
    64,
    65,
    -1,
    66,
    63,
    -1,
    -1,
    -1
  },
  {
    93,
    86,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    110,
    92,
    -1,
    112,
    -1
  },
  {
    93,
    97,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    -1,
    92,
    100,
    111,
    -1
  },
  {
    93,
    98,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    55,
    92,
    -1,
    111,
    -1
  },
  {
    93,
    99,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    110,
    92,
    101,
    112,
    -1
  },
  {
    93,
    105,
    87,
    88,
    89,
    107,
    91,
    96,
    95,
    106,
    108,
    104,
    92,
    103,
    102,
    -1
  },
  {
    93,
    109,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    110,
    92,
    -1,
    112,
    -1
  },
  {
    93,
    113,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    -1,
    92,
    -1,
    112,
    -1
  },
  {
    93,
    114,
    87,
    117,
    89,
    116,
    -1,
    115,
    95,
    94,
    -1,
    110,
    92,
    -1,
    111,
    -1
  },
  {
    93,
    118,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    -1,
    92,
    -1,
    111,
    -1
  },
  {
    121,
    119,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    110,
    92,
    120,
    112,
    -1
  },
  {
    93,
    122,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    -1,
    92,
    -1,
    111,
    -1
  },
  {
    93,
    123,
    87,
    126,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    110,
    92,
    124,
    111,
    125
  },
  {
    93,
    127,
    87,
    88,
    89,
    90,
    91,
    96,
    95,
    94,
    108,
    -1,
    92,
    -1,
    112,
    -1
  }
}
if reconfigure ~= nil then
  reconfigure = fromJson(reconfigure)
  for _, data in ipairs(reconfigure) do
    buildPlansAbilities[data[1]][data[2]] = data[3]
  end
end
local gameplay = root.session_gameplay_gameplay
researchNames = {}
researchTexts = {}
for i = 0, gameplay.researches_list_size + 10 do
  table.insert(researchNames, localize("<*upgrade" .. i .. "/0>"))
  table.insert(researchTexts, localize("<*upgrade" .. i .. "/1>"))
end
unitNames = {}
unitTexts = {}
for i = 0, gameplay.unitType_size + 10 do
  table.insert(unitNames, localize("<*unitName" .. i .. ">"))
  table.insert(unitTexts, localize("<*unitText" .. i .. ">"))
end
buildPlanText = {
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanBarrackAndRange>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanTemple>"),
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanBarrackAndRange>"),
  localize("<*buildPlanHorse>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanBarrack>"),
  localize("<*buildPlanHorse>"),
  localize("<*buildPlanRange>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanTurretScout>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanFarm>"),
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanRanch>"),
  localize("<*buildPlanBarrackAndRange>"),
  localize("<*buildPlanHorse>"),
  localize("<*buildPlanWorkshop>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanFarm>"),
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanTownhall>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanBarrack>"),
  localize("<*buildPlanWorkshop>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanFarm>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanSiegeStatic>"),
  localize("<*buildPlanRanch>"),
  localize("<*buildPlanBarrack>"),
  localize("<*buildPlanHorse>"),
  localize("<*buildPlanRange>"),
  localize("<*buildPlanElephant>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanSiege>"),
  localize("<*buildPlanRanch>"),
  localize("<*buildPlanBarrack>"),
  localize("<*buildPlanRange>"),
  localize("<*buildPlanHorse>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanSiege>"),
  localize("<*buildPlanSiege>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanWall>"),
  "",
  "",
  localize("<*buildPlanWall>"),
  "",
  "",
  localize("<*buildPlanWall>"),
  "",
  "",
  localize("<*buildPlanWall>"),
  "",
  "",
  localize("<*buildPlanWall>"),
  "",
  "",
  localize("<*buildPlanWall>"),
  "",
  "",
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanStorage>"),
  localize("<*buildPlanFarmMeatWheat>"),
  localize("<*buildPlanBarrackAndRangeAndHorse>"),
  localize("<*buildPlanWorkshop>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanSonic>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanDock>"),
  localize("<*buildPlanMine>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanTurret> <*buildPlanBuiltOnWater>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanTurret>. <*buildPlanChosenOne>"),
  localize("<*buildPlanTurret>"),
  localize("<*buildPlanArtillery>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanForge>"),
  localize("<*buildPlanWorkshop>"),
  localize("<*buildPlanAirfield>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHorse>"),
  localize("<*buildPlanAirDefence>"),
  localize("<*buildPlanAirDefence>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanRiceFarm>"),
  localize("<*buildPlanDeliveryStorage>"),
  localize("<*buildPlanRanch>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanStoneMine>"),
  localize("<*buildPlanSonic>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanHouse>"),
  localize("<*buildPlanArtillery>"),
  localize("<*buildPlanFarmFish>"),
  localize("<*buildPlanFarmMeatWheat>"),
  ""
}

function haveRequiredUnit(requirement, statistics, noMax)
  local live = statistics.f_liveConstructed(requirement.type)
  return live >= requirement.min and (noMax or live <= requirement.max)
end

function haveRequiredUnitsAny(requirements, statistics)
  local sz = requirements.size
  for i = 1, sz do
    if haveRequiredUnit(requirements[i - 1], statistics, 5 <= sz) then
      return true
    end
  end
  return false
end

function haveRequiredUnitsAll(requirements, statistics)
  local sz = requirements.size
  for i = 1, sz do
    if not haveRequiredUnit(requirements[i - 1], statistics, 5 <= sz) then
      return false
    end
  end
  return true
end

function haveRequiredUnits(requirements, all, statistics)
  if all then
    return haveRequiredUnitsAll(requirements, statistics)
  else
    return haveRequiredUnitsAny(requirements, statistics)
  end
end

function haveRequiredResearchesAny(requirements, researchState)
  local sz = requirements.size
  if sz == 0 then
    return true
  end
  for i = 1, sz do
    local o = requirements[i - 1]
    if isResearchCompleteF(researchState, o.id) then
      return true
    end
  end
  return false
end

function haveRequiredResearchesAll(requirements, researchState)
  local sz = requirements.size
  for i = 1, sz do
    local o = requirements[i - 1]
    if not isResearchCompleteF(researchState, o.id) then
      return false
    end
  end
  return true
end

function haveRequiredResearches(requirements, all, researchState)
  if all then
    return haveRequiredResearchesAll(requirements, researchState)
  else
    return haveRequiredResearchesAny(requirements, researchState)
  end
end

function haveRequiredAll(requirements, statistics, researchState)
  return haveRequiredResearches(requirements.research, requirements.researchesAll, researchState) and haveRequiredUnits(requirements.unit, requirements.unitsAll, statistics)
end

function isResearchCompleteF(researchesState, researchId)
  if researchId >= researchesState.size then
    return false
  end
  local researchState = researchesState[researchId]
  return researchState.quantity > 0
end

function getAgeFactionIndustrial(researchesState, default)
  if isResearchCompleteF(researchesState, 93) then
    return {6, 8}
  end
  if isResearchCompleteF(researchesState, 59) then
    return {5, 8}
  end
  if isResearchCompleteF(researchesState, 114) then
    return {6, 9}
  end
  if isResearchCompleteF(researchesState, 64) then
    return {5, 9}
  end
  if isResearchCompleteF(researchesState, 115) then
    return {6, 10}
  end
  if isResearchCompleteF(researchesState, 68) then
    return {5, 10}
  end
  if isResearchCompleteF(researchesState, 116) then
    return {6, 11}
  end
  if isResearchCompleteF(researchesState, 67) then
    return {5, 11}
  end
  if isResearchCompleteF(researchesState, 118) then
    return {6, 12}
  end
  if isResearchCompleteF(researchesState, 63) then
    return {5, 12}
  end
  if isResearchCompleteF(researchesState, 121) then
    return {6, 13}
  end
  if isResearchCompleteF(researchesState, 65) then
    return {5, 13}
  end
  if isResearchCompleteF(researchesState, 125) then
    return {6, 14}
  end
  if isResearchCompleteF(researchesState, 62) then
    return {5, 14}
  end
  if isResearchCompleteF(researchesState, 126) then
    return {6, 15}
  end
  if isResearchCompleteF(researchesState, 70) then
    return {5, 15}
  end
  if isResearchCompleteF(researchesState, 131) then
    return {6, 16}
  end
  if isResearchCompleteF(researchesState, 73) then
    return {5, 16}
  end
  if isResearchCompleteF(researchesState, 135) then
    return {6, 17}
  end
  if isResearchCompleteF(researchesState, 72) then
    return {5, 17}
  end
  if isResearchCompleteF(researchesState, 136) then
    return {6, 18}
  end
  if isResearchCompleteF(researchesState, 61) then
    return {5, 18}
  end
  if isResearchCompleteF(researchesState, 145) then
    return {6, 19}
  end
  if isResearchCompleteF(researchesState, 69) then
    return {5, 19}
  end
  if isResearchCompleteF(researchesState, 146) then
    return {6, 20}
  end
  if isResearchCompleteF(researchesState, 71) then
    return {5, 20}
  end
  return {4, default}
end

function getAgeFaction(faction)
  local factions = root.session_gameplay_gameplay_faction
  local researchesState = factions[faction].researchState
  if isResearchCompleteF(researchesState, 3) then
    if not isResearchCompleteF(researchesState, 1) then
      return {1, 2}
    end
    if isResearchCompleteF(researchesState, 5) then
      if not isResearchCompleteF(researchesState, 15) then
        return {3, 4}
      end
      return getAgeFactionIndustrial(researchesState, 4)
    end
    if isResearchCompleteF(researchesState, 6) then
      if not isResearchCompleteF(researchesState, 9) then
        return {3, 5}
      end
      return getAgeFactionIndustrial(researchesState, 5)
    end
    return {2, 2}
  end
  if isResearchCompleteF(researchesState, 4) then
    if not isResearchCompleteF(researchesState, 2) then
      return {1, 3}
    end
    if isResearchCompleteF(researchesState, 7) then
      if not isResearchCompleteF(researchesState, 16) then
        return {3, 6}
      end
      return getAgeFactionIndustrial(researchesState, 6)
    end
    if isResearchCompleteF(researchesState, 8) then
      if not isResearchCompleteF(researchesState, 17) then
        return {3, 7}
      end
      return getAgeFactionIndustrial(researchesState, 7)
    end
    return {2, 3}
  end
  return {0, 1}
end

function getListOfRequiredUnits(requirements, all)
  local delimiter = "/"
  if all then
    delimiter = "+"
  end
  local s = ""
  local sz = requirements.size
  for i = 1, sz do
    local requirementUnit = requirements[i - 1]
    local num = requirementUnit.min
    if 0 < num then
      local unitType = requirementUnit.type
      if 1 < i then
        s = s .. " " .. delimiter .. " "
      end
      s = s .. unitNames[unitType + 1]
      if 1 < num then
        s = s .. " x" .. num
      end
    end
  end
  return s
end

function getListOfRequiredResearches(requirements, all)
  local delimiter = "/"
  if all then
    delimiter = "+"
  end
  local s = ""
  local sz = requirements.size
  for i = 1, sz do
    local requirementResearch = requirements[i - 1].id
    if 1 < i then
      s = s .. " " .. delimiter .. " "
    end
    s = s .. researchNames[requirementResearch + 1]
  end
  return s
end

function updateCostRequirements(requirements)
  local nodes = interface.nodes
  local hasRequiredUnit = requirements.unit_size > 0
  local hasRequiredResearch = 0 < requirements.research_size
  if hasRequiredUnit or hasRequiredResearch then
    nodes[58].visible = true
    if hasRequiredUnit then
      nodes[60].visible = true
      nodes[61].widget_text = getListOfRequiredUnits(requirements.unit, requirements.unitsAll)
    else
      nodes[60].visible = false
    end
    if hasRequiredResearch then
      nodes[62].visible = true
      nodes[63].widget_setText = getListOfRequiredResearches(requirements.research, requirements.researchesAll)
    else
      nodes[62].visible = false
    end
  else
    nodes[58].visible = false
  end
end

function outCostDigit(showNode, digitNode, initCost, fullCost, hasRes, divider)
  showNode.visible = 0 < fullCost
  local w = digitNode.widget
  w.text = fullCost // divider
  if fullCost <= hasRes then
    w.font_textColor_value = 4294967295
  elseif initCost <= hasRes then
    w.font_textColor_value = 4278255615
  else
    w.font_textColor_value = 4278190335
  end
end

function findImage(images, name)
  local id = images.f_find(name)
  if id == nil then
    log("Can't find image for '" .. name .. "'")
    return nil
  end
  if images[id] == nil then
    log("interface." .. interfaceId .. ".content.image: No image with id=" .. id .. " (name=" .. name .. ")")
  end
  return id
end

function getBaseCenter()
  local factionId = root.session_visual_currentFaction
  local units = root.session_gameplay_gameplay.scene[0].units
  local unitsList = units.list
  local buildingList = units.f_findAll2(factionId, 4)
  local baseCenter = {0, 0}
  local sum = 0
  for _, id in ipairs(buildingList) do
    local unit = unitsList[id]
    if unit.state == 5 then
      baseCenter[1] = baseCenter[1] + unit.position_x
      baseCenter[2] = baseCenter[2] + unit.position_y
      sum = sum + 1
    end
  end
  return baseCenter[1] // sum, baseCenter[2] // sum
end

function autoPlacingHouse(factionId, planId)
  if annTask ~= nil then
    return
  end
  local baseX, baseY = getBaseCenter()
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local passMap = scene.landscape_passability
  local point = passMap.f_worldToPassCell(baseX, baseY)
  local left = point[1] - 63
  local top = point[2] - 63
  local right = point[1] + 64
  local bottom = point[2] + 64
  local leftTopW = passMap.f_passCellToWorld(left, top)
  local rightBottomW = passMap.f_passCellToWorld(right + 1, bottom + 1)
  rightBottomW[1] = rightBottomW[1] - 1
  rightBottomW[2] = rightBottomW[2] - 1
  local friendly = scene.relation.f_friendly(factionId)
  local enemies = scene.relation.f_enemies(factionId)
  local neutral = enemies ~ scene.relation.f_notFriendly(factionId)
  local mapData = passMap.f_dump(left, top, right, bottom, true)
  scene.units.f_dumpSpatial(left, top, right, bottom, friendly, enemies, neutral)
  annTask = {
    planId,
    root.ann.task.f_create(2, mapData, "unitsMap1"),
    leftTopW,
    rightBottomW,
    128,
    750
  }
end

function autoPlacingStorage(factionId, planId)
  if annTask ~= nil then
    return
  end
  local baseX, baseY = getBaseCenter()
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local passMap = scene.landscape_passability
  local point = passMap.f_worldToPassCell(baseX, baseY)
  local left = point[1] - 127
  local top = point[2] - 127
  local right = point[1] + 128
  local bottom = point[2] + 128
  local leftTopW = passMap.f_passCellToWorld(left, top)
  local rightBottomW = passMap.f_passCellToWorld(right + 1, bottom + 1)
  rightBottomW[1] = rightBottomW[1] - 1
  rightBottomW[2] = rightBottomW[2] - 1
  local friendly = scene.relation.f_friendly(factionId)
  local enemies = scene.relation.f_enemies(factionId)
  local neutral = enemies ~ scene.relation.f_notFriendly(factionId)
  local mapData = passMap.f_dump(left, top, right, bottom, true)
  scene.units.f_dumpSpatial(left, top, right, bottom, friendly, enemies, neutral)
  annTask = {
    planId,
    root.ann.task.f_create(3, mapData, "unitsMap1"),
    leftTopW,
    rightBottomW,
    256,
    1300
  }
end

function tryAutoPlacing(factionId, planId, plan)
  local gameplay = root.session_gameplay_gameplay
  local unitTypes = gameplay.unitType
  local unitTypeId = plan.unit
  local unitType = unitTypes[unitTypeId]
  if unitType.supply ~= nil and unitType.supply.takes > 0 and unitType.radius == 14000 then
    autoPlacingHouse(factionId, planId)
    return true
  end
  if 0 < unitType.storageMultiplier and unitType.radius == 24000 then
    autoPlacingStorage(factionId, planId)
    return true
  end
  return false
end

function startPlacing(planId)
  local vSession = root.session_visual
  local animation = vSession.build[planId].animation
  local gameplay = root.session_gameplay_gameplay
  local factionId = vSession.currentFaction
  local plan = gameplay.faction[factionId].build[planId]
  local locationEnvTags = plan.locationEnvTags_value
  if not plan.available then
    return false
  end
  if plan.wall then
    vSession.placer.f_wall(planId, animation, "interface=" .. interfaceId .. ",plan=" .. planId, 0, 0, 0, 4278255360, 4278255615, 4278190335, 1000)
  else
    vSession.placer.f_unit(plan.unit, animation, true, "interface=" .. interfaceId .. ",plan=" .. planId, 0, 0, 0, 4278255360, 4278190335, 1000, locationEnvTags, true)
  end
  if locationEnvTags == 0 then
    local pass = gameplay.unitType[plan.unit].passability
    local figure = pass.figure
    if figure == 3 then
      root.session_render_landscape_colorPassMap.f_show(150, pass.doubleCircle_first_block, 1056964863)
    elseif figure ~= 2 then
      root.session_render_landscape_colorPassMap.f_show(150, pass.levels_block, 1056964863)
    end
  end
  return true
end

unitIcons = {}
local images = interface.content_image
local ut = root.session_gameplay_gameplay_unitType
for i = 1, ut.size do
  unitIcons[i] = findImage(images, "unit" .. i - 1 .. ".png")
end
hotKeysResult = {
  id = interfaceId,
  name = localize("<*buildingPlansInterfaceName>"),
  hotKeys = {}
}
local list = fromJson("[" .. localize("<*buildingPlansHotKeysList>") .. "]")
if list ~= nil then
  for _, v in ipairs(list) do
    local name = localize("<*buildingPlansHotKeyName" .. v .. ">")
    table.insert(hotKeysResult.hotKeys, {v, name})
  end
end
hotKeysResult = toJson(hotKeysResult)
