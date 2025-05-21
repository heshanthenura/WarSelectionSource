if sessionInited == nil then
  return
end
if notificationEndTime ~= nil and notificationEndTime > 0 and os.time() > notificationEndTime then
  notifLerp = root.functions.interpolator.f_lerp("interface.session.nodes.575.color.a", 1, 200, 0, 500, "interface.session.nodes.575.visible", false)
  notificationEndTime = nil
end
local vSession = root.session_visual
local gameplay = root.session_gameplay_gameplay
local scene = gameplay.scene[0]
local myFactionId = vSession.currentFaction
local vScene = vSession.scene[0]
if showUnit ~= nil then
  local gUnit = scene.units_list[showUnit]
  if gUnit ~= nil then
    local unitType = gameplay.unitTypeModified[gUnit.typeModified]
    assert(unitType ~= nil)
    if canShowUnit(scene, gUnit, unitType, myFactionId) then
      local vUnit = vScene.unit[showUnit]
      vScene.f_cameraShowPosition(vUnit.position_x, vUnit.position_y, vUnit.position_z)
    end
  end
end
local nodes = interface.nodes
local gFaction = gameplay.faction[myFactionId]
local statistics = gFaction.statistics_units
if nodes[981].visible and killList ~= vScene.selection_units_asString then
  killList = ""
  nodes[981].visible = false
end
local time = gameplay.time
local actualTick = time // 50
if lastTickUpdate ~= actualTick then
  local myFactionG = gameplay.faction[myFactionId]
  local myFaction = scene.faction[myFactionId]
  local factionResources = myFaction.treasury_resources
  local r0 = factionResources[0]
  local r1 = factionResources[1]
  local r2 = factionResources[2]
  local r3 = factionResources[3]
  local r4 = factionResources[4]
  local supplySum = myFaction.supply_sum
  local supplyLimitMaximized = myFaction.supply_limitMaximized
  local supplyLimitMax = myFaction.supply_limitMax
  if sendAgeCommand then
    local command = getCommands()
    command.f_workAdd(researchDestroyUnit, researchDestroyWork)
    sendAgeCommand = false
  end
  nodes[57].visible = 0 < r0
  nodes[144].widget_text = r0 // 1000
  nodes[218].visible = 0 < r1
  nodes[145].widget_text = r1 // 1000
  nodes[121].visible = 0 < r2
  nodes[192].widget_text = r2 // 1000
  nodes[282].visible = 0 < r3
  nodes[283].widget_text = r3 // 1000
  nodes[281].visible = 0 < r4
  nodes[286].widget_text = r4 // 1000
  local noSupply = supplySum >= supplyLimitMaximized
  nodes[122].visible = 0 < supplyLimitMaximized + supplySum
  nodes[174].widget_text = math.ceil(supplySum / 10)
  nodes[41].visible = noSupply
  if noSupply then
    nodes[174].widget_font_textColor_value = 4284901119
  else
    nodes[174].widget_font_textColor_value = 4278255360
  end
  nodes[961].widget_text = supplyLimitMaximized // 10
  if supplyLimitMaximized >= supplyLimitMax then
    nodes[961].widget_font_textColor_value = 4284901119
  else
    nodes[961].widget_font_textColor_value = 4278255360
  end
  local armyUnits = myFactionG.f_calcUnitsByTags(16)
  nodes[137].widget_text = armyUnits
  nodes[21].visible = canControl and 0 < armyUnits
  local fleetUnits = myFactionG.f_calcUnitsByTags(128)
  nodes[636].widget_text = fleetUnits
  nodes[599].visible = canControl and 0 < fleetUnits
  local airUnits = myFactionG.f_calcUnitsByTags(16384)
  nodes[37].widget_text = airUnits
  nodes[4].visible = canControl and 0 < airUnits
  local specUnits = myFactionG.f_calcUnitsByTags(524288)
  nodes[1402].widget_text = specUnits
  nodes[1407].visible = canControl and 0 < specUnits
  nodes[196].visible = HQ.id ~= nil
  if HQ.id ~= nil then
    local unit = scene.units_list[HQ.id]
    nodes[151].visible = unit ~= nil and unit.work_queue_size == 0
  end
  local unitsTask = vScene.unitsDoings_task
  local unitsGather = vScene.unitsDoings_gather
  local unitsStats = myFactionG.statistics_units
  local idleAerodromes = unitsTask["297x255"] + unitsTask["332x255"] + unitsTask["331x255"] + unitsTask["331x0"] + (unitsTask["335x255"] + unitsTask["335x0"] + unitsTask["336x255"] + unitsTask["336x255"]) * 2
  local aeroplanes = unitsStats.f_liveConstructed(292) + unitsStats.f_liveConstructed(314) + unitsStats.f_liveConstructed(315) + unitsStats.f_liveConstructed(316) + unitsStats.f_liveConstructed(328) + unitsStats.f_liveConstructed(329) + unitsStats.f_liveConstructed(330) + unitsStats.f_liveConstructed(355) + unitsStats.f_liveConstructed(356) + unitsStats.f_liveConstructed(361) + unitsStats.f_liveConstructed(363) + unitsStats.f_liveConstructed(444) + unitsStats.f_liveConstructed(448)
  nodes[1386].visible = idleAerodromes < aeroplanes
  local idleGatherers = unitsTask["1x255"] + unitsTask["12x255"] + unitsTask["31x255"] + unitsTask["55x255"] + unitsTask["56x255"] + unitsTask["89x255"] + unitsTask["90x255"] + unitsTask["201x255"] + unitsTask["349x255"]
  nodes[239].visible = 0 < idleGatherers
  nodes[40].widget_text = strEventIdleWorkers1 .. idleGatherers .. strEventIdleWorkers2
  if nodes[873].visible and nodes[1451].visible then
    updateSendResourcesWindow()
  end
  local sentRes = gameplay.dataStorage_sentRes
  if sendResourcesData ~= sentRes then
    sendResourcesData = sentRes
    if sendResourcesData ~= "" then
      assert(sendResourcesData ~= nil)
      local myPlayer = getPlayerOfFaction(myFactionId)
      local nodes = interface.nodes
      local allData = fromJson(sendResourcesData)
      if allData ~= nil then
        for _, data in ipairs(allData) do
          if data.player == myPlayer then
            nodes[1579].disabled = false
            nodes[1275].visible = false
            if data.result == 0 then
              nodes[1274].visible = true
            else
              nodes[74].visible = true
            end
          end
          if data.result == 0 and data.toFaction == myFactionId then
            local node = nodes[1006]
            node.visible = true
            node.color_a = 200
            sendResNotificationEndTime = os.time() + 7
            if resNotifLerp ~= nil then
              root.functions.interpolator.f_remove(resNotifLerp)
              resNotifLerp = nil
            end
            writePlayerToWidget(data.player, nodes[1010].widget)
            local r0 = math.floor(data.r0 * data.percent // 100000)
            local r1 = math.floor(data.r1 * data.percent // 100000)
            local r2 = math.floor(data.r2 * data.percent // 100000)
            local r3 = math.floor(data.r3 * data.percent // 100000)
            local r4 = math.floor(data.r4 * data.percent // 100000)
            nodes[1011].visible = 0 < r0
            nodes[1014].widget_text = r0
            nodes[1012].visible = 0 < r1
            nodes[1015].widget_text = r1
            nodes[1013].visible = 0 < r2
            nodes[1016].widget_text = r2
            nodes[304].visible = 0 < r3
            nodes[325].widget_text = r3
            nodes[305].visible = 0 < r4
            nodes[331].widget_text = r4
          end
        end
      end
    end
  end
  if lastTickUpdate // 20 ~= actualTick // 20 then
    local storage = gameplay.dataStorage
    if storage.drawPeriod ~= nil then
      local drawMoment = tonumber(storage.drawMoment)
      if drawMoment == nil then
        drawMoment = 1000000000
      end
      local drawTime = drawMoment - time
      if gameIsEnded == nil and drawTime <= 300000 then
        if drawTime < 0 then
          drawTime = 0
        end
        nodes[89].visible = true
        nodes[90].widget_text = toTimeStr(drawTime // 1000)
      else
        nodes[89].visible = false
      end
    end
    
    function setWidgetTextColored(widgetId, value)
      local w = nodes[widgetId].widget
      w.text = value
      if 0 < value then
        w.font_textColor_value = 4278255360
      else
        w.font_textColor_value = 4286611584
      end
    end
    
    local allWorkers = unitsStats.f_liveConstructed(1) + unitsStats.f_liveConstructed(12) + unitsStats.f_liveConstructed(31) + unitsStats.f_liveConstructed(55) + unitsStats.f_liveConstructed(56) + unitsStats.f_liveConstructed(89) + unitsStats.f_liveConstructed(90) + unitsStats.f_liveConstructed(201) + unitsStats.f_liveConstructed(349)
    local buildWorkers = unitsTask["1x3"] + unitsTask["12x3"] + unitsTask["31x3"] + unitsTask["55x3"] + unitsTask["56x3"] + unitsTask["89x3"] + unitsTask["90x3"] + unitsTask["201x3"] + unitsTask["349x3"] + unitsTask["1x4"] + unitsTask["12x4"] + unitsTask["31x4"] + unitsTask["55x4"] + unitsTask["56x4"] + unitsTask["89x4"] + unitsTask["90x4"] + unitsTask["201x4"] + unitsTask["349x4"]
    local gatherWorkersBerry = unitsGather["1x1"] + unitsGather["12x1"] + unitsGather["31x1"] + unitsGather["55x1"] + unitsGather["56x1"] + unitsGather["89x1"] + unitsGather["90x1"] + unitsGather["201x1"] + unitsGather["349x1"]
    local gatherWorkersWood = unitsGather["1x2"] + unitsGather["12x2"] + unitsGather["31x2"] + unitsGather["55x2"] + unitsGather["56x2"] + unitsGather["89x2"] + unitsGather["90x2"] + unitsGather["201x2"] + unitsGather["349x2"]
    local gatherWorkersFish = unitsGather["1x4"] + unitsGather["12x4"] + unitsGather["31x4"] + unitsGather["55x4"] + unitsGather["56x4"] + unitsGather["89x4"] + unitsGather["90x4"] + unitsGather["201x4"] + unitsGather["349x4"]
    local gatherWorkersMetal = unitsGather["1x16"] + unitsGather["12x16"] + unitsGather["31x16"] + unitsGather["55x16"] + unitsGather["56x16"] + unitsGather["89x16"] + unitsGather["90x16"] + unitsGather["201x16"] + unitsGather["349x16"]
    local gatherWorkersMeat = unitsGather["1x32"] + unitsGather["12x32"] + unitsGather["31x32"] + unitsGather["55x32"] + unitsGather["56x32"] + unitsGather["89x32"] + unitsGather["90x32"] + unitsGather["201x32"] + unitsGather["349x32"]
    local gatherWorkersStone = unitsGather["1x64"] + unitsGather["12x64"] + unitsGather["31x64"] + unitsGather["55x64"] + unitsGather["56x64"] + unitsGather["89x64"] + unitsGather["90x64"] + unitsGather["201x64"] + unitsGather["349x64"]
    local gatherWorkersWheat = unitsGather["1x128"] + unitsGather["12x128"] + unitsGather["31x128"] + unitsGather["55x128"] + unitsGather["56x128"] + unitsGather["89x128"] + unitsGather["90x128"] + unitsGather["201x128"] + unitsGather["349x512"]
    local gatherWorkers = gatherWorkersBerry + gatherWorkersWood + gatherWorkersFish + gatherWorkersMetal + gatherWorkersMeat + gatherWorkersStone + gatherWorkersWheat
    setWidgetTextColored(834, allWorkers - buildWorkers - gatherWorkers)
    setWidgetTextColored(833, buildWorkers)
    setWidgetTextColored(832, gatherWorkers)
    setWidgetTextColored(823, gatherWorkersFish)
    setWidgetTextColored(824, gatherWorkersBerry)
    setWidgetTextColored(825, gatherWorkersMeat)
    setWidgetTextColored(826, gatherWorkersWheat)
    setWidgetTextColored(827, gatherWorkersWood)
    setWidgetTextColored(828, gatherWorkersStone)
    setWidgetTextColored(829, gatherWorkersMetal)
    local allBoats = unitsStats.f_liveConstructed(26) + unitsStats.f_liveConstructed(43) + unitsStats.f_liveConstructed(81) + unitsStats.f_liveConstructed(169) + unitsStats.f_liveConstructed(244) + unitsStats.f_liveConstructed(353)
    local buildBoats = unitsTask["244x3"] + unitsTask["244x4"]
    local gatherBoats = unitsGather["26x8"] + unitsGather["43x8"] + unitsGather["81x8"] + unitsGather["169x8"] + unitsGather["244x8"] + unitsGather["353x8"]
    setWidgetTextColored(835, allBoats - buildBoats - gatherBoats)
    setWidgetTextColored(836, buildBoats)
    setWidgetTextColored(837, gatherBoats)
    setWidgetTextColored(846, gatherBoats)
    local allMachines = unitsStats.f_liveConstructed(240)
    local gatherMachine = unitsGather["240x128"]
    setWidgetTextColored(847, allMachines - gatherMachine)
    setWidgetTextColored(849, gatherMachine)
    setWidgetTextColored(855, gatherMachine)
    workersAtWorkAdd = {0, 0}
    boatsAtWorkAdd = {0, 0}
    local unitTypesModified = gameplay.unitTypeModified
    local workers = scene.units.f_findAll2(myFactionId, 8)
    local unitsList = scene.units_list
    for _, workerId in ipairs(workers) do
      local unit = unitsList[workerId]
      local tasks = unit.task
      if tasks.size > 0 and tasks[0].type == 5 then
        local unitType = unitTypesModified[unit.typeModified]
        if unitType.tags[16] then
          boatsAtWorkAdd[1] = boatsAtWorkAdd[1] + 1
          if unit.actualActionType == 4 then
            boatsAtWorkAdd[2] = boatsAtWorkAdd[2] + 1
          end
        else
          workersAtWorkAdd[1] = workersAtWorkAdd[1] + 1
          if unit.actualActionType == 4 then
            workersAtWorkAdd[2] = workersAtWorkAdd[2] + 1
          end
        end
      end
    end
    workersAtWork[1] = workersAtWork[1] * 0.9 + workersAtWorkAdd[1]
    workersAtWork[2] = workersAtWork[2] * 0.9 + workersAtWorkAdd[2]
    boatsAtWork[1] = boatsAtWork[1] * 0.9 + boatsAtWorkAdd[1]
    boatsAtWork[2] = boatsAtWork[2] * 0.9 + boatsAtWorkAdd[2]
    if workersAtWorkAdd[1] > 0 and workersAtWork[1] > 0 then
      nodes[152].visible = true
      local v = math.floor(workersAtWork[2] * 100 // workersAtWork[1])
      nodes[152].widget_text = v
      nodes[107].widget_text = v
      if v < 50 then
        workersLowWorkCounter = workersLowWorkCounter + 1
        if v < 30 then
          workersWorstWorkCounter = workersWorstWorkCounter + 1
        else
          workersWorstWorkCounter = 0
        end
      else
        workersWorstWorkCounter = 0
        workersLowWorkCounter = 0
      end
    else
      nodes[152].visible = false
      workersWorstWorkCounter = 0
      workersLowWorkCounter = 0
    end
    if boatsAtWorkAdd[1] > 0 and boatsAtWork[1] > 0 then
      nodes[158].visible = true
      local v = math.floor(boatsAtWork[2] * 100 // boatsAtWork[1])
      nodes[158].widget_text = v
      nodes[131].widget_text = v
      if v < 15 then
        boatsLowWorkCounter = boatsLowWorkCounter + 1
        if v < 8 then
          boatsWorstWorkCounter = boatsWorstWorkCounter + 1
        else
          boatsWorstWorkCounter = 0
        end
      else
        boatsWorstWorkCounter = 0
        boatsLowWorkCounter = 0
      end
    else
      nodes[158].visible = false
      boatsWorstWorkCounter = 0
      boatsLowWorkCounter = 0
    end
    nodes[87].visible = 10 <= workersLowWorkCounter
    nodes[103].visible = 10 <= workersWorstWorkCounter
    nodes[63].visible = 10 > workersWorstWorkCounter
    nodes[55].visible = 10 <= boatsLowWorkCounter
    nodes[139].visible = 10 <= boatsWorstWorkCounter
    nodes[132].visible = 10 > boatsWorstWorkCounter
    if lastTickUpdate // 100 ~= actualTick // 100 then
      updateMinimapIcons()
    end
    if canPredict then
      local predictId = actualTick // (predictionsPeriod // 50)
      if lastPredictionId ~= predictId and predictId > 0 then
        addPrediction(predictId)
      end
      lastPredictionId = predictId
    end
    if nodes[1161].visible and time >= 60000 then
      local n = diagUpdatePeriod // 50
      if lastTickUpdate // n ~= actualTick // n then
        prepareTimeline()
        updateTimeline()
      end
      if nodes[303].visible and timeline ~= nil then
        interface.f_updateDiagram(0)
      end
    end
    HQ.id = searchUnit(scene.units, myFactionId, 512)
    if HQ.id == nil then
      HQ.id = searchUnit(scene.units, myFactionId, 32)
    end
    HQ.x = 0
    HQ.y = 0
    if HQ.id ~= nil then
      local unit = scene.units_list[HQ.id]
      if unit ~= nil then
        HQ.x = unit.position_x / 256
        HQ.y = unit.position_y / 256
      end
    end
    nodes[1116].widget_text = toTimeStr(time // 1000)
    local wwDataNew = storage.wonderWin
    if wwDataNew ~= wwData then
      wwData = wwDataNew
      if wwDataNew ~= "" then
        local json = fromJson(wwDataNew)
        if json ~= nil then
          nodes[942].visible = true
          wwWinFaction = json.faction
          nodes[942].widget_color_value = getFactionColor(wwWinFaction)[1]
          wwWinTime = json.finish
          local player = getPlayerOfFaction(wwWinFaction)
          if player ~= nil then
            local plnf = getPlayerNameFont(player)
            local w = nodes[1121].widget
            w.text = plnf[1]
            w.fontName = plnf[2]
          else
            nodes[942].visible = false
            wwWinTime = nil
            nodes[230].visible = false
          end
        else
          nodes[942].visible = false
          wwWinTime = nil
          nodes[230].visible = false
        end
        updateMinimapIcons()
      end
    end
    if wwWinTime ~= nil then
      if time <= wwWinTime then
        local tm = (wwWinTime - time) // 1000
        nodes[230].visible = tm < 60 and myFactionId ~= wwWinFaction
        nodes[943].widget_text = toTimeStr(tm)
      else
        nodes[943].widget_text = "0:00"
      end
    end
  end
  lastTickUpdate = actualTick
end
if predictionTask ~= nil then
  local v1, v2 = readPredictionResult(predictionTask[2], predictionTask[3])
  if v1 ~= nil then
    local id = predictionTask[1]
    predictionTask = nil
    victoryPredictions[id] = (v1 + v2) / 2
    if 1 < id then
      assert(victoryPredictions[1] ~= nil)
      local prevId = id - 1
      local prev = victoryPredictions[prevId]
      if prev == nil then
        while prev == nil do
          prevId = prevId - 1
          assert(1 <= prevId)
          prev = victoryPredictions[prevId]
        end
        local d = id - prevId
        local cur = victoryPredictions[id]
        for i = prevId + 1, id - 1 do
          victoryPredictions[i] = lerp(prev, cur, (i - prevId) / d)
        end
      end
    end
  end
end
if leavePredTasks ~= nil then
  if leaveV1 == nil then
    leaveV1, leaveV2 = readPredictionResult(leavePredTasks[1][1], leavePredTasks[1][2])
  end
  if leaveV1f == nil then
    leaveV1f, leaveV2f = readPredictionResult(leavePredTasks[2][1], leavePredTasks[2][2])
  end
  if leaveV1 ~= nil and leaveV1f ~= nil then
    local v1 = 1 - (leaveV1 + leaveV2) / 2
    local v2 = 1 - (leaveV1f + leaveV2f) / 2
    local loss = v1 - v2
    local proportion = 0.5 / leavePredTasks[3]
    local v = loss / proportion
    log("Leave prognosis:", v1, "-", v2, "=", loss, proportion, v)
    nodes[182].visible = iSurrendered
    nodes[226].visible = false
    nodes[233].visible = not teamSurrendered and v1 > 0.2 and 1 < leavePredTasks[3] and v > 0.12
    leaveV1 = nil
    leaveV1f = nil
    leavePredTasks = nil
  end
end
nodes[1133].visible = false
nodes[1134].visible = false
local canTransform = {}
local liveConstructedList = statistics.liveConstructedList
for i = 1, #liveConstructedList do
  local unitTypeId = liveConstructedList[i]
  if canControl then
    if unitTypeId == 184 or unitTypeId == 188 or unitTypeId == 214 or unitTypeId == 219 or unitTypeId == 224 or unitTypeId == 229 then
      nodes[1133].visible = true
    end
    if unitTypeId == 198 or unitTypeId == 199 or unitTypeId == 215 or unitTypeId == 220 or unitTypeId == 225 or unitTypeId == 230 then
      nodes[1134].visible = true
    end
  end
  local unitWork = unitsExtraData[unitTypeId]
  if unitWork ~= nil and unitWork.work ~= nil then
    local workData = unitWork.work[11]
    if workData ~= nil then
      local unitType = gameplay.unitType[unitTypeId]
      for _, wData in ipairs(workData) do
        if wData < unitType.ability_work_size then
          local work = unitType.ability_work[wData]
          local ability = unitType.ability_ability[work.ability]
          local abilityType = ability.type
          local nextUnit
          if abilityType == 2 and work.enabled then
            nextUnit = ability.data_unit
            if not haveRequiredAll(ability.requirements, statistics, gFaction.researchState) then
              nextUnit = nil
            end
          end
          if nextUnit ~= nil and canTransform[unitTypeId] == nil then
            canTransform[unitTypeId] = {nextUnit, wData}
          end
        end
      end
    end
  end
end
massUpdate = {}
nodes[537].visible = false
local count = 0
for unitTypeId, data in pairs(canTransform) do
  if count == #transformationButton then
    break
  end
  local liveConstructed = statistics.f_liveConstructed(unitTypeId)
  local underTransformation = statistics.f_underTransformation(unitTypeId)
  if liveConstructed ~= underTransformation then
    if count == 0 then
      nodes[537].visible = true
    end
    count = count + 1
    local node = nodes[transformationButton[count]]
    node.visible = true
    node.widget_middle_set_normal = unitIcons[unitTypeId + 1]
    local num = liveConstructed - underTransformation
    nodes[transformationNumber[count]].widget_text = num
    massUpdate[count] = {
      unitTypeId,
      data[2],
      num
    }
  end
end
for i = count + 1, #transformationButton do
  nodes[transformationButton[i]].visible = false
end
nodes[68].visible = false
nodes[384].visible = false
nodes[47].visible = false
nodes[184].visible = false
nodes[197].visible = false
nodes[202].visible = false
nodes[58].visible = false
nodes[735].visible = false
nodes[736].visible = false
nodes[1326].visible = false
nodes[737].visible = false
nodes[738].visible = false
nodes[739].visible = false
nodes[546].visible = false
nodes[1119].visible = false
nodes[740].visible = false
nodes[484].visible = false
nodes[676].visible = false
nodes[677].visible = false
local age = getAgeFaction(myFactionId)
local actualEra = age[1]
local actualNation = age[2]
nodes[643].widget_text = ageNames[actualEra + 1]
if actualEra == 0 then
  nodes[644].widget_text = ""
  buildPlansId = 1
  nodes[47].visible = true
else
  nodes[644].widget_text = getNationName(actualNation, actualEra % 2 == 1)
  nodes[47].visible = false
  buildPlansId = actualNation
  if actualEra == 1 then
    nodes[184].visible = true
  elseif actualEra == 2 then
    nodes[197].visible = true
  elseif actualEra == 3 then
    nodes[202].visible = true
  elseif actualEra == 4 then
    nodes[676].visible = true
  elseif actualEra == 5 then
    nodes[677].visible = true
  end
end
updateSelection(statistics)
updateMassTransformationWindowInfo(nodes, gFaction, statistics, actualEra % 2 == 1)
updateAttackWarnings()
nodes[177].widget_current = 0
if HQ.id ~= nil then
  local unit = scene.units_list[HQ.id]
  if unit ~= nil then
    local unitType = gameplay.unitTypeModified[unit.typeModified]
    local queue = unit.work_queue
    if queue.size > 0 then
      local work = unitType.ability_work[queue[0].work]
      local ability = unitType.ability_ability[work.ability]
      if ability.type == 1 and isAgeUpgrade(ability.data_research) then
        nodes[177].widget_current = unit.work_progress * 1000 // work.makeTime
      end
    end
  end
end
nodes[175].visible = math.abs(vScene.camera_state_yaw) > 0.01
if sendResNotificationEndTime ~= nil and sendResNotificationEndTime > 0 and os.time() > sendResNotificationEndTime then
  resNotifLerp = root.functions.interpolator.f_lerp("interface.session.nodes.1006.color.a", 1, 255, 10, 500, "interface.session.nodes.1006.visible", false)
  sendResNotificationEndTime = 0
end
local b = nodes[303].visible and nodes[1150].visible and not nodes[873].visible
root.interface_bigminimap_active = b
vScene.minimap_updateObjectsBig = b
if lastCurFac ~= myFactionId then
  lastCurFac = myFactionId
  updateFactionsColors()
end
if gameIsEnded ~= nil then
  if gameIsEnded == 1 then
    nodes[1439].visible = true
    nodes[230].visible = false
  elseif gameIsEnded == 0 then
    nodes[1439].visible = false
    nodes[230].visible = true
  end
end
if leaveSession ~= nil then
  if leaveSession == 0 then
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    root.session.f_break()
    leaveSession = nil
  else
    leaveSession = leaveSession - 1
  end
end
