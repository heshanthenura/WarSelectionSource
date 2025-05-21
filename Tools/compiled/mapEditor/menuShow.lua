local nodes = interface.nodes
if nodes[19].visible then
  nodes[19].visible = false
  root.interface_settings_active = false
else
  nodes[276].visible = false
  local teamCounters = {}
  for i = 1, #teamsList do
    teamCounters[i] = 0
  end
  for i = 1, #factionsList do
    teamCounters[factionsList[i].team] = teamCounters[factionsList[i].team] + 1
  end
  for i = 1, #teamCounters do
    if teamCounters[i] == 0 then
      nodes[276].visible = true
    end
  end
  nodes[19].visible = true
  root.interface_settings_active = true
end
updateVeil()
