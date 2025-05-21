local nodes = interface.nodes
local factionId = nodes[303].widget_currentLine
if getParameter("confirm") == nil then
  nodes[743].visible = true
  local hasUnits = false
  local units = root.session_gameplay_gameplay_faction[factionId].statistics_units
  for j = 0, units.size - 1 do
    local unit = units[j]
    if 0 < unit.live then
      hasUnits = true
      break
    end
  end
  nodes[751].visible = hasUnits
  writeFactionName(nodes[742].widget, factionId + 1)
  return
end
nodes[743].visible = false
if not toBool(getParameter("confirm")) then
  return
end
assert(1 < #factionsList)
table.remove(factionsList, factionId + 1)
local scene = root.session_gameplay_gameplay_scene[0]
local units = scene.units
local unitsList = units.list
local uc = unitsList.size
local i = 0
while uc > i do
  local id = unitsList.f_getCombinedId(i)
  if id == nil then
    uc = uc + 1
  else
    local unit = unitsList[id]
    if unit.faction == factionId then
      units.f_remove(id)
    elseif factionId < unit.faction then
      units.operation.f_changeFaction(id, unit.faction - 1)
    end
  end
  i = i + 1
end
for i = 1, #factionsList - 1 do
  for j = factionId + 2, 64 do
    if factionsList[i].relations[j] ~= nil then
      factionsList[i].relations[j - 1] = factionsList[i].relations[j]
      factionsList[i].relations[j] = nil
    end
  end
end
nodes[303].widget_currentLine = 0
updateFactionsList()
onFactionSelect(1)
markMapNotSaved()
