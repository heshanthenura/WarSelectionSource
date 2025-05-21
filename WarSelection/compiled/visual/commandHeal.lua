local command = root.session_visual_commands
if command == nil then
  return
end
local vSession = root.session_visual
local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
local gameplay = root.session_gameplay_gameplay
local targetId = getParameter("target")
local scene = gameplay.scene[0]
local unit = scene.units_list[targetId]
command.f_heal(clearTasks, targetId)
local kRadius = 65535 / gameplay.unitTypeModified[unit.typeModified].radius
local radius = 4.7 / kRadius
local xg = unit.position_x
local yg = unit.position_y
local x = vSession.f_coordinateToVisual2(xg)
local y = vSession.f_coordinateToVisual2(yg)
local zg = scene.landscape.f_getHeight(xg, yg)
local onWater = zg ~= nil and underWater(zg)
vSession.f_createEmitters(0, 1642, radius, true, x, y, 0, 0, 0, 0, "", 0, onWater)
