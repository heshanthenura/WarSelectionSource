if sessionInited == nil then
  return
end
local vSession = root.session_visual
local gameplay = root.session_gameplay_gameplay
local vScene = vSession.scene[0]
local nodes = interface.nodes
local gFaction = gameplay.faction[myFactionId]
local statistics = gFaction.statistics_units
local time = gameplay.time
nodes[175].visible = math.abs(vScene.camera_state_yaw) > 0.01
dynamicData = fromJson(root.session_gameplay_gameplay_dataStorage_dynamic)
if not dynamicData.play then
  return
end
local timer = (staticData.wavePeriod - time % staticData.wavePeriod + 800) // 1000
for teamNum, teamData in ipairs(dynamicData.teams) do
  local turn = teamData.lastTurn
  repeat
    turn = turn + 1
    if turn > #teamData.players then
      turn = 1
    end
  until teamData.players[turn].active
  for plId = 1, #teamData.players do
    local pl = teamData.players[plId]
    local itf = playerInterfaces[teamNum][plId]
    nodes[itf.wave].visible = plId == turn
    local id = itf.timer
    nodes[id].visible = plId == turn
    nodes[id].widget_text = toTimeStr(timer)
  end
end
local staticMyFaction = staticData.factions[myFactionNum]
local myTeamPlayerD = getMyDinamic()
local myCultureS = getMyCulture()
local myArmy = myTeamPlayerD.army
if myArmy == nil then
  myArmy = {}
end
local myMoney = myTeamPlayerD.money + (time - myTeamPlayerD.updateTime) * myTeamPlayerD.income // 1000
nodes[43].widget_text = myMoney // 1000
nodes[171].widget_text = "+" .. myTeamPlayerD.income * 60 // 1000
nodes[165].visible = dynamicData.midControl == 1
nodes[160].visible = dynamicData.midControl == 2
local armySell = deepcopy(myArmy)
for i = 1, #unitsButtons do
  local n = nodes[unitsButtons[i]]
  if myCultureS.units ~= nil and i <= #myCultureS.units then
    local unitTypeId = myCultureS.units[i][1]
    local price = myCultureS.units[i][2]
    n.visible = true
    n.widget_middle_set_normal = unitIcons[unitTypeId + 1]
    local count = 0
    if myArmy[unitTypeId] ~= nil and myArmy[unitTypeId][price] ~= nil then
      count = myArmy[unitTypeId][price].count
      armySell[unitTypeId][price] = nil
    end
    nodes[unitsCounters[i]].widget_text = count
  else
    n.visible = false
  end
end
local sellSum = 0
for unitTypeId, arr in pairs(armySell) do
  for price, object in pairs(arr) do
    sellSum = sellSum + price * object.count * staticData.sellPercent // 100
  end
end
nodes[157].visible = 0 < sellSum
nodes[150].widget_text = sellSum // 1000
nodes[110].visible = 0 < myTeamPlayerD.tower and myCultureS.tower ~= nil
if nodes[110].visible then
  nodes[173].widget_middle_set_normal = unitIcons[myCultureS.tower[1] + 1]
end
nodes[168].visible = 0 < canBuildHouse() and myCultureS.house ~= nil
if nodes[168].visible then
  nodes[169].widget_middle_set_normal = unitIcons[myCultureS.house[1] + 1]
  local b = time < myTeamPlayerD.houseTime
  nodes[169].disabled = b
  nodes[191].visible = b
  if b then
    nodes[191].widget_text = toTimeStr((myTeamPlayerD.houseTime - time) // 1000)
  end
end
nodes[84].widget_text = cultureNames[myTeamPlayerD.culture]
if myCultureS.nextCultures == nil then
  nodes[52].visible = false
  nodes[188].visible = true
  nodes[196].widget_text = myTeamPlayerD.damageUpgrade
else
  nodes[52].visible = true
  nodes[188].visible = false
  for i = 1, #nextCultureButtons do
    local n = nodes[nextCultureButtons[i]]
    if i > #myCultureS.nextCultures then
      n.visible = false
    else
      n.visible = true
      local cc = myCultureS.nextCultures[i]
      n.disabled = cc[4] ~= nil and not staticMyFaction.countries[cc[4]]
      n.widget_middle_set_normal = cultureIcons[cc[1]]
    end
  end
end
