local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end
unitsSelectionButtons = {
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
  17,
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
  32
}
unitsSelectionHealth = {
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42,
  43,
  44,
  45,
  46,
  47,
  48,
  49,
  50,
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  58,
  59,
  60,
  61,
  62
}
typeSelectionButtons = {
  63,
  64,
  65,
  66,
  67,
  68,
  69,
  70,
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  78,
  79,
  80,
  81,
  82,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  90,
  91,
  92
}
typeSelectionNumbers = {
  93,
  94,
  95,
  96,
  97,
  98,
  99,
  100,
  101,
  102,
  103,
  104,
  105,
  106,
  107,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  116,
  117,
  118,
  119,
  120,
  121,
  122
}

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

function setCurrentSelectionUnitType(value)
  if currentSelectionUnitType == value then
    return
  end
  currentSelectionUnitType = value
  if parentInterface == nil then
    return
  end
  if value == nil then
    value = ""
  end
  root.interface[parentInterface].f_sendEvent("onUnitsSelection", tostring(value))
end

function outUnitsGroup(unitsList, canBeNotOnScene)
  local nodes = interface.nodes
  local firstPos = nodes[unitsSelectionButtons[1]].localLeft
  local blockSize = nodes[unitsSelectionButtons[3]].localLeft - firstPos
  local blocksSize = nodes[123].sizeX
  local blocksPerColumn = 2
  local maxBlocks = blocksSize // blockSize * blocksPerColumn
  local blocks = #unitsSelectionButtons
  local gameplay = root.session_gameplay_gameplay
  local units = gameplay.scene[0].unit
  local factions = gameplay.faction
  local unitsListSize = unitsList.size
  local myFactionId = root.session_visual_currentFaction
  local notFramedAny = true
  currentSelectionButtonsTypes = {}
  local faction
  if blocks >= unitsListSize and maxBlocks >= unitsListSize then
    nodes[1].visible = true
    currentSelectionUnits = {}
    local unitsCount = 0
    for i = 1, unitsListSize do
      local selUnitId = unitsList[i - 1]
      if selUnitId ~= nil then
        local gUnit = units[selUnitId]
        if gUnit ~= nil and 3 <= gUnit.state and (canBeNotOnScene or gUnit.presence ~= 2) then
          unitsCount = unitsCount + 1
          if faction == nil or gUnit.faction == faction then
            faction = gUnit.faction
            local isMyFaction = faction == myFactionId or allFactionsAsMy
            local unitTypeId = gUnit.type
            local unitTypeModifiedId = gUnit.typeModified
            currentSelectionButtonsTypes[i] = unitTypeModifiedId
            currentSelectionUnits[i] = selUnitId.value
            local unitType = gameplay.unitTypeModified[gUnit.typeModified]
            local w = nodes[unitsSelectionButtonsDir[i]].widget
            w.middle_set_normal = unitIcons[unitTypeId + 1]
            local wTop = w.top_set
            if unitTypeModifiedId == currentSelectionUnitType then
              wTop.normal = unitsSelectionFramedNormal
              wTop.pressed = unitsSelectionFramedPressed
              wTop.hovered = unitsSelectionFramedHovered
              notFramedAny = false
            else
              wTop.normal = unitsSelectionNotFramedNormal
              wTop.pressed = unitsSelectionNotFramedPressed
              wTop.hovered = unitsSelectionNotFramedHovered
            end
            nodes[unitsSelectionButtonsDir[i]].visible = true
            local n = nodes[unitsSelectionHealthDir[i]]
            if unitType.deathability ~= nil then
              n.visible = true
              n.widget_current = gUnit.deathability_health * 100 // unitType.deathability_health
            else
              n.visible = false
            end
            local a = currentSelectionUnitTypes[unitTypeModifiedId]
            if a == nil then
              currentSelectionUnitTypes[unitTypeModifiedId] = {unitTypeId, 1}
            else
              a[2] = a[2] + 1
            end
          end
        else
          nodes[unitsSelectionButtonsDir[i]].visible = false
        end
      else
        nodes[unitsSelectionButtonsDir[i]].visible = false
      end
    end
    for i = unitsListSize + 1, blocks do
      nodes[unitsSelectionButtonsDir[i]].visible = false
    end
    if unitsCount == 0 then
      currentSelectionUnitType = nil
    end
    if notFramedAny then
      currentSelectionUnitType = nil
      for k, v in pairs(currentSelectionButtonsTypes) do
        currentSelectionUnitType = v
        break
      end
    end
  else
    nodes[2].visible = true
    local unitTypes = {}
    for i = 0, unitsListSize - 1 do
      local selUnitId = unitsList[i]
      if selUnitId ~= nil then
        local gUnit = units[selUnitId]
        if gUnit ~= nil and gUnit.state >= 4 and (canBeNotOnScene or gUnit.presence ~= 2) then
          local unitTypeModifiedId = gUnit.typeModified
          local unitType = unitTypes[unitTypeModifiedId]
          if unitType == nil then
            faction = gUnit.faction
            unitType = gameplay.unitTypeModified[unitTypeModifiedId]
            unitTypes[unitTypeModifiedId] = unitType
          end
          local a = currentSelectionUnitTypes[unitTypeModifiedId]
          if a == nil then
            currentSelectionUnitTypes[unitTypeModifiedId] = {
              gUnit.type,
              1
            }
          else
            a[2] = a[2] + 1
          end
        end
      end
    end
    local i = 1
    for unitTypeModifiedId, typeCount in pairs(currentSelectionUnitTypes) do
      currentSelectionButtonsTypes[i] = unitTypeModifiedId
      local isMyFaction = faction == myFactionId or allFactionsAsMy
      local unitType = unitTypes[unitTypeModifiedId]
      if i <= #typeSelectionButtonsDir then
        local id = typeSelectionButtonsDir[i]
        nodes[id].visible = maxBlocks >= i
        local w = nodes[id].widget
        w.middle_set_normal = unitIcons[typeCount[1] + 1]
        local wTop = w.top_set
        if unitTypeModifiedId == currentSelectionUnitType then
          wTop.normal = typesSelectionFramedNormal
          wTop.pressed = typesSelectionFramedPressed
          wTop.hovered = typesSelectionFramedHovered
          notFramedAny = false
        else
          wTop.normal = typesSelectionNotFramedNormal
          wTop.pressed = typesSelectionNotFramedPressed
          wTop.hovered = typesSelectionNotFramedHovered
        end
        nodes[typeSelectionNumbersDir[i]].widget_text = typeCount[2]
      end
      i = i + 1
    end
    for j = i, #typeSelectionButtonsDir do
      nodes[typeSelectionButtonsDir[j]].visible = false
    end
    if notFramedAny then
      currentSelectionUnitType = currentSelectionButtonsTypes[1]
    end
  end
end

function getRelation(relations, fromFaction, toFaction)
  return relations[fromFaction][toFaction].value
end

function canShowUnit(scene, unit, unitType, myFaction)
  if not root.session_visual_scene[0].hideInFogOfWar then
    return true
  end
  local rel = getRelation(scene.relation, myFaction, unit.faction)
  if rel == 1 then
    return true
  end
  return scene.f_checkFow(unit.position_x, unit.position_y, myFaction, unitType.hiddenInFows_value)
end

function insertDir(array, baseArray)
  for i = 1, #baseArray do
    if rightDirection then
      table.insert(array, baseArray[i])
    else
      table.insert(array, baseArray[#baseArray - i + 1])
    end
  end
end

unitIcons = {}
local images = interface.content_image
local ut = root.session_gameplay_gameplay_unitType
for i = 1, ut.size do
  unitIcons[i] = findImage(images, "unit" .. i - 1 .. ".png")
end
