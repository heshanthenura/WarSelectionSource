local nodes = interface.nodes
local time = root.session_gameplay_gameplay_time
if abilityDisableTime[1] ~= nil then
  if time >= abilityDisableTime[1] + 10000 then
    abilityDisableTime[1] = nil
    nodes[4].disabled = false
    nodes[6].visible = false
  else
    nodes[6].widget_current = math.floor((time - abilityDisableTime[1]) / 100)
  end
end
for i = 1, 3 do
  local statueId = statuesOnButtons[i]
  if statueId ~= nil then
    local ability = statueAbilities[statueId]
    local abilityId = statueAbilitiesId[statueId]
    nodes[statueProgress[i]].visible = false
    nodes[statueButtons[i]].disabled = false
    if abilityDisableTime[abilityId] ~= nil then
      if time >= abilityDisableTime[abilityId] + 60000 then
        abilityDisableTime[abilityId] = nil
      else
        nodes[statueButtons[i]].disabled = true
        nodes[statueProgress[i]].visible = true
        nodes[statueProgress[i]].widget_current = math.floor((time - abilityDisableTime[abilityId]) / 600)
      end
    end
  end
end
if abilityDisableTime[7] ~= nil then
  if time >= abilityDisableTime[7] + 10000 then
    abilityDisableTime[7] = nil
    nodes[16].disabled = false
    nodes[17].visible = false
  else
    nodes[17].widget_current = math.floor((time - abilityDisableTime[7]) / 100)
  end
end
if abilityDisableTime[9] ~= nil then
  if time >= abilityDisableTime[9] + 60000 then
    abilityDisableTime[9] = nil
    nodes[19].disabled = false
    nodes[23].visible = false
  else
    nodes[23].widget_current = math.floor((time - abilityDisableTime[9]) / 600)
  end
end
if abilityDisableTime[11] ~= nil then
  if time >= abilityDisableTime[11] + 30000 then
    abilityDisableTime[11] = nil
    nodes[28].disabled = false
    nodes[29].visible = false
  else
    nodes[29].widget_current = math.floor((time - abilityDisableTime[11]) / 300)
  end
end
if abilityDisableTime[13] ~= nil then
  if time >= abilityDisableTime[13] + 30000 then
    abilityDisableTime[13] = nil
    nodes[2].disabled = false
    nodes[3].visible = false
  else
    nodes[3].widget_current = math.floor((time - abilityDisableTime[13]) / 300)
  end
end
