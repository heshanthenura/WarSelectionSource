local unitsList = root.session_visual_scene[0].selection_units_list
local selFac
local units = root.session_gameplay_gameplay_scene[0].unit
for i = 0, unitsList.size - 1 do
  local uid = unitsList[i]
  if uid ~= nil then
    local gUnit = units[uid]
    if gUnit ~= nil then
      selFac = gUnit.faction
      break
    end
  end
end
if selFac == nil then
  return
end
local nodes = interface.nodes
if not root.session_visual_controlledFactions[selFac] then
  return
end
if getParameter("forced") == nil then
  local hasMain = false
  local unitsCount = 0
  local unitTypes = root.session_gameplay_gameplay_unitTypeModified
  for unitTypeModifiedId, typeCount in pairs(currentSelectionUnitTypes) do
    assert(unitTypeModifiedId ~= nil)
    if unitTypes[unitTypeModifiedId] ~= nil then
      unitsCount = unitsCount + typeCount[2]
      hasMain = hasMain or unitTypes[unitTypeModifiedId].tags[5]
    end
  end
  if hasMain then
    return
  end
  if 3 < unitsCount then
    killList = root.session_visual_scene[0].selection_units_asString
    nodes[981].visible = true
    return
  end
end
nodes[981].visible = false
local command = getCommands()
if command == nil then
  return
end
command.f_kill()
