local command = root.session_visual_commands
if command == nil then
  return
end
local vSession = root.session_visual
local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
local targetId = getParameter("target")
local gameplay = root.session_gameplay_gameplay
local scene = gameplay.scene[0]
local target = scene.units_list[targetId]
command.f_load(clearTasks, targetId)
local kRadius = 65535 / gameplay.unitTypeModified[target.typeModified].radius
local radius = 4.7 / kRadius
local gx = target.position_x
local gy = target.position_y
local x = vSession.f_coordinateToVisual2(gx)
local y = vSession.f_coordinateToVisual2(gy)
local zg = scene.landscape.f_getHeight(gx, gy)
local onWater = zg ~= nil and underWater(zg)
vSession.f_createEmitters(0, 1643, radius, true, x, y, 0, 0, 0, 0, "", 0, onWater)
