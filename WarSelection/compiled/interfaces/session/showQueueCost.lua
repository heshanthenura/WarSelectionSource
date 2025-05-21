local vSession = root.session_visual
local nodes = interface.nodes
if not toBool(getParameter("enter")) then
  nodes[50].visible = false
  return
end
if currentSelectionUnitType == nil then
  return
end
local vScene = vSession.scene[0]
if vScene.selection_units_list_size == 0 then
  return
end
local myFactionId = vSession.currentFaction
local gameplay = root.session_gameplay_gameplay
local id = vScene.selection_units_list[0]
if id == nil then
  return
end
local gUnit = gameplay.scene[0].units_list[id]
assert(gUnit ~= nil)
if gUnit.work == nil then
  return
end
if gUnit.faction ~= myFactionId then
  return
end
local unitType = gameplay.unitTypeModified[gUnit.typeModified]
local queueId = tonumber(getParameter("queue"))
local queue = gUnit.work_queue
assert(queue ~= nil)
if queueId > queue.size then
  return
end
local ability = queue[queueId - 1].work
if ability >= unitType.ability_work_size then
  return
end
showWorkCost(gUnit.type, unitType, ability, getParameter("x"), getParameter("y"))
