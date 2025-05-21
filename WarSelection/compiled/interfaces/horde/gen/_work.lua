local vSession = root.session.visual
local nodes = interface.nodes
local gameplay = root.session.gameplay_gameplay
local vScene = vSession.scene[0]
local gScene = gameplay.scene[0]
local myFactionId = vSession.currentFaction
local gFaction = gameplay.faction[myFactionId]
local faction = gScene.faction[myFactionId]
local factionResources = faction.treasury_resources
local time = gameplay.time
local armyUnits = gFaction.f_calcUnitsByTags(16)
nodes[21].visible = 0 < armyUnits
nodes[79].widget_text = playersCount
local myUnitsSum = 0
local races = fromJson(gameplay.dataStorage_races)
if races == nil then
  races = {}
end
if myRace == nil then
  myRace = races[myFactionId]
  if myRace ~= nil then
    nodes[17].visible = false
  end
end
if myRace ~= nil then
  root.window_cursor = math.floor(myRace + 7)
  local myUnitTypes = racesUnits[myRace + 1]
  local unitStat = gameplay.faction[myFactionId].statistics_units
  local units1 = unitStat.f_liveConstructed(myUnitTypes[1])
  local units2 = unitStat.f_liveConstructed(myUnitTypes[2])
  local units3 = unitStat.f_liveConstructed(myUnitTypes[3])
  local units4 = unitStat.f_liveConstructed(myUnitTypes[4])
  local units5 = unitStat.f_liveConstructed(myUnitTypes[5])
  myUnitsSum = units1 + units2 + units3 + units4 + units5
  nodes[17].visible = true
  nodes[7].widget_text = units1
  nodes[8].widget_text = units2
  nodes[10].widget_text = units3
  nodes[12].widget_text = units4
  nodes[13].widget_text = units5
  nodes[91].widget_image = unitIcons[myUnitTypes[1] + 1]
  nodes[95].widget_image = unitIcons[myUnitTypes[2] + 1]
  nodes[96].widget_image = unitIcons[myUnitTypes[3] + 1]
  nodes[97].widget_image = unitIcons[myUnitTypes[4] + 1]
  nodes[98].widget_image = unitIcons[myUnitTypes[5] + 1]
  local myFactionV = vSession.faction[myFactionId]
  local w = nodes[42].widget
  w.text = getPlayerName(myFactionId - 1)
  w.font_textColor_value = myFactionV.maskColor_value
  w.font_strokeColor_value = myFactionV.minimapBorderColor_value
  local unitsMax = tonumber(gameplay.dataStorage_unitsMax)
  if unitsMax ~= nil then
    nodes[14].widget_text = myUnitsSum .. "/" .. unitsMax
    if 2 <= unitsMax - myUnitsSum and myUnitsSum > lastUnisSum then
      lastGrowTime = time
    end
    if myUnitsSum < lastUnisSum then
      lastGrowTime = nil
    end
    nodes[11].visible = lastGrowTime ~= nil and time - lastGrowTime < 2500
    lastUnisSum = myUnitsSum
  end
end
if not vScene.placer_on then
  vSession.placer.f_free(nil, 1, "interface=" .. interfaceId)
end
if 0 < armyUnits then
  local placer = vScene.placer_position
  if lastMovePos ~= nil then
    local dx = placer.x - lastMovePos[1]
    local dy = placer.y - lastMovePos[2]
    local r = dx * dx + dy * dy
    if 50000 < r then
      lastMovePos = nil
    end
  end
  if lastMovePos == nil then
    local commands = root.session_visual_commands
    if commands ~= nil and not interface.hotKeys.f_check(1) then
      lastMovePos = {
        placer.x,
        placer.y
      }
      commands.f_specialCommand(0, "command", "move", "x", math.floor(placer.x * 256), "y", math.floor(placer.y * 256))
    end
  end
end
local underCursor = vSession.f_underCursorAttackTarget(1, 0)
if underCursor ~= nil then
  local newFac = gScene.unit[underCursor].faction
  if 0 < newFac then
    lastTargetFaction = newFac
    lastTargetTime = os.time()
  end
end
if lastTargetFaction ~= nil and 8 >= os.time() - lastTargetTime then
  nodes[24].visible = true
  local race = races[lastTargetFaction]
  local unitTypes = racesUnits[race + 1]
  local unitStat = gameplay.faction[lastTargetFaction].statistics_units
  local units1 = unitStat.f_liveConstructed(unitTypes[1])
  local units2 = unitStat.f_liveConstructed(unitTypes[2])
  local units3 = unitStat.f_liveConstructed(unitTypes[3])
  local units4 = unitStat.f_liveConstructed(unitTypes[4])
  local units5 = unitStat.f_liveConstructed(unitTypes[5])
  nodes[25].widget_text = units1
  nodes[26].widget_text = units2
  nodes[28].widget_text = units3
  nodes[29].widget_text = units4
  nodes[30].widget_text = units5
  nodes[100].widget_image = unitIcons[unitTypes[1] + 1]
  nodes[101].widget_image = unitIcons[unitTypes[2] + 1]
  nodes[102].widget_image = unitIcons[unitTypes[3] + 1]
  nodes[103].widget_image = unitIcons[unitTypes[4] + 1]
  nodes[104].widget_image = unitIcons[unitTypes[5] + 1]
  local fact = vSession.faction[lastTargetFaction]
  local w = nodes[44].widget
  w.text = getPlayerName(lastTargetFaction - 1)
  w.font_textColor_value = fact.maskColor_value
  w.font_strokeColor_value = fact.minimapBorderColor_value
else
  lastTargetFaction = nil
  nodes[24].visible = false
end
runAway = fromJson(gameplay.dataStorage_runAway)
local actime = runAway[myFactionId] + runAwayPeriod
if time < actime then
  nodes[27].visible = true
  nodes[38].visible = false
  nodes[39].visible = false
  nodes[53].visible = true
  nodes[53].widget_current = math.floor((actime - time) / runAwayPeriod * 100)
else
  actime = actime + runAwayRestore
  if time >= actime then
    nodes[27].visible = false
    nodes[38].visible = false
    nodes[39].visible = true
    nodes[53].visible = false
  else
    nodes[27].visible = false
    nodes[38].visible = true
    nodes[39].visible = false
    nodes[53].visible = true
    nodes[53].widget_current = 100 - math.floor((actime - time) / runAwayRestore * 100)
  end
end
meteor = fromJson(gameplay.dataStorage_meteor)[myFactionId]
local c = meteor.count + (time - meteor.time) // meteorRestore
if c >= meteorsLimit then
  nodes[59].widget_text = meteorsLimit
  nodes[58].visible = false
else
  nodes[59].widget_text = math.floor(c)
  nodes[58].visible = true
  nodes[58].widget_current = math.floor((time - meteor.time) % meteorRestore / meteorRestore * 100)
end
nodes[55].visible = 1 <= c
nodes[51].visible = c < 1
if nodes[68].visible then
  local dt = raceChooseDuration - time
  if 0 < time then
    nodes[68].disabled = false
  end
  if 0 <= dt then
    nodes[31].widget_text = toTimeStr(dt // 1000)
  else
    nodes[68].visible = false
  end
end
