local command = getCommands()
if command == nil then
  return
end
local amount = 1
if getParameter("amount") ~= nil then
  amount = tonumber(getParameter("amount"))
end
if interface.hotKeys.f_check(addWorkMassHotKey1) then
  amount = amount * 5
end
if interface.hotKeys.f_check(addWorkMassHotKey2) then
  amount = amount * 5
end
local button = tonumber(getParameter("button"))
local state = workButtonsState[button]
local gameplay = root.session_gameplay_gameplay
local unitType = gameplay.unitTypeModified[currentSelectionUnitType]
if unitType == nil then
  return
end
if unitType.ability == nil then
  return
end
local work = unitType.ability_work[state.workId]
if work == nil then
  return
end
local ability = unitType.ability_ability[work.ability]
local requirements = ability.requirements_unit
local requirementsSize = requirements.size
local names = ""
researchDestroyList = {}
if 0 < requirementsSize then
  local myFactionId = root.session_visual_currentFaction
  local factionUnits = gameplay.faction[myFactionId].statistics_units
  for reqId = 0, requirementsSize - 1 do
    local req = requirements[reqId]
    if req.min == 0 then
      local typeId = req.type
      local have = factionUnits[typeId].live
      if 0 < have then
        if #researchDestroyList > 0 then
          names = names .. ", "
        end
        names = names .. localize("<*requirementUnitAmount/0>") .. unitNames[typeId + 1] .. localize("<*requirementUnitAmount/1>") .. have .. localize("<*requirementUnitAmount/2>")
        table.insert(researchDestroyList, typeId)
        hasDestroy = true
      end
    end
  end
end
if #researchDestroyList > 0 then
  researchDestroyUnit = currentSelectionUnitTypes[currentSelectionUnitType][1]
  researchDestroyWork = state.workId
  local nodes = interface.nodes
  nodes[1218].visible = true
  nodes[707].widget_text = names
  return
end
if ability.type == 7 and ability.data_placing then
  local unitTypeId = currentSelectionUnitTypes[currentSelectionUnitType][1]
  local ue = unitsExtraData[unitTypeId]
  if ue ~= nil and ue.customAbility ~= nil then
    root.window_cursor = ue.customAbility[work.ability][1]
  end
  local abilityN = getCustomAbilityName(ability.data_parameters)
  if abilityN == "useWeapon" then
    root.session_visual_placer.f_free(nil, 1, "interface=" .. interfaceId .. ",type=specialAbility,workId=" .. state.workId .. ",amount=" .. amount .. "," .. ability.data_parameters .. ",attackerType=" .. unitTypeId)
  end
  return
end
if button == 11 then
  amount = currentSelectionUnitTypes[currentSelectionUnitType][2]
end
if ability.type == 0 and ability.data_mustBeSent then
  root.session_visual_placer.f_free(nil, 1, "interface=" .. interfaceId .. ",type=commandWorkAddWithRallyPoint,unitType=" .. currentSelectionUnitTypes[currentSelectionUnitType][1] .. ",work=" .. state.workId .. ",amount=" .. amount)
  root.window_cursor = 6
  return
end
command.f_workAdd(currentSelectionUnitTypes[currentSelectionUnitType][1], state.workId, amount, true, 1 < amount)
