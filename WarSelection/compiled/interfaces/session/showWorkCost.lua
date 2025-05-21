local nodes = interface.nodes
local buttonId = tonumber(getParameter("button"))
local enter = toBool(getParameter("enter"))
local parentWidgetId = getParameter("widget")
local x = getParameter("x")
local y = getParameter("y")
if not enter then
  nodes[50].visible = false
  return
end
if currentSelectionUnitType == nil then
  return
end
local sel = currentSelectionUnitTypes[currentSelectionUnitType]
if root.session_visual_scene[0].selection_units_list_size == 0 then
  return
end
local gameplay = root.session_gameplay_gameplay
local unitType = gameplay.unitTypeModified[currentSelectionUnitType]
if unitType == nil then
  return
end
local state = workButtonsState[buttonId]
if not (state.workId ~= nil and state.show) or unitType.ability == nil or state.workId >= unitType.ability_work_size then
  return
end
showWorkCost(sel[1], unitType, state.workId, x, y)
