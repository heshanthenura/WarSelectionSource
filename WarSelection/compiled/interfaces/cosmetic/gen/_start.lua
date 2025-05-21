abilityDisableTime = {}
local gameplay = root.session_gameplay_gameplay
local factionId = root.session_visual_currentFaction
local abilities = gameplay.faction[factionId].abilities
local controlledPlayer = root.session_gameplay_controlledPlayer
local nodes = interface.nodes
nodes[4].visible = abilities[2]
nodes[61].visible = abilities[statueAbilities[1]]
nodes[31].visible = abilities[statueAbilities[2]]
nodes[64].visible = abilities[statueAbilities[3]]
nodes[62].visible = abilities[statueAbilities[4]]
nodes[65].visible = abilities[statueAbilities[5]]
nodes[16].visible = abilities[21]
nodes[60].visible = abilities[statueAbilities[6]]
nodes[19].visible = abilities[23]
nodes[66].visible = abilities[statueAbilities[7]]
nodes[28].visible = abilities[25]
nodes[69].visible = abilities[statueAbilities[8]]
nodes[2].visible = abilities[28]
nodes[9].visible = abilities[statueAbilities[9]]
statuesOnButtons = fromJson(root.storage_statues)
if statuesOnButtons == nil then
  statuesOnButtons = {}
end
updateStatueButtons()
nodes[133].visible = abilities[statueAbilities[1]] or abilities[statueAbilities[2]] or abilities[statueAbilities[3]] or abilities[statueAbilities[4]] or abilities[statueAbilities[5]] or abilities[statueAbilities[6]] or abilities[statueAbilities[7]] or abilities[statueAbilities[8]] or abilities[statueAbilities[9]]
local time = gameplay.time
local data = gameplay.dataStorage_abilityUses
local abilityUses = fromJson(data)
if abilityUses == nil then
  abilityUses = {}
end
for _, ab in ipairs(abilityUses) do
  if ab[1] == controlledPlayer then
    local at = ab[2]
    if at == 2 then
      abilityDisableTime[1] = ab[3]
      local b = time < abilityDisableTime[1] + 10000
      nodes[4].disabled = b
      nodes[6].visible = b
    elseif at == 3 then
      abilityDisableTime[2] = ab[3]
    elseif at == 16 then
      abilityDisableTime[3] = ab[3]
    elseif at == 17 then
      abilityDisableTime[4] = ab[3]
    elseif at == 19 then
      abilityDisableTime[5] = ab[3]
    elseif at == 20 then
      abilityDisableTime[6] = ab[3]
    elseif at == 21 then
      abilityDisableTime[7] = ab[3]
      local b = time < abilityDisableTime[7] + 10000
      nodes[16].disabled = b
      nodes[17].visible = b
    elseif at == 22 then
      abilityDisableTime[8] = ab[3]
    elseif at == 23 then
      abilityDisableTime[9] = ab[3]
      local b = time < abilityDisableTime[9] + 60000
      nodes[19].disabled = b
      nodes[23].visible = b
    elseif at == 24 then
      abilityDisableTime[10] = ab[3]
    elseif at == 25 then
      abilityDisableTime[11] = ab[3]
      local b = time < abilityDisableTime[11] + 30000
      nodes[28].disabled = b
      nodes[29].visible = b
    elseif at == 27 then
      abilityDisableTime[12] = ab[3]
    elseif at == 28 then
      abilityDisableTime[13] = ab[3]
      local b = time < abilityDisableTime[13] + 30000
      nodes[2].disabled = b
      nodes[3].visible = b
    else
      assert(false)
    end
  end
end
