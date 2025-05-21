local command = root.session_visual_commands
if command == nil then
  return
end
local vSession = root.session_visual
local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
local targetId = getParameter("target")
local gameplay = root.session_gameplay_gameplay
local target = gameplay.scene[0].units_list[targetId]
command.f_sendResources(clearTasks, targetId)
command.f_heal(false, targetId)
local kRadius = 65535 / gameplay.unitTypeModified[target.typeModified].radius
local radius = 8 / kRadius
local x = vSession.f_coordinateToVisual2(target.position_x)
local y = vSession.f_coordinateToVisual2(target.position_y)
vSession.f_createEmitters(0, 4, radius, true, x, y)
