local command = root.session_visual_commands
if command == nil then
  return
end
local vSession = root.session_visual
local gameplay = root.session_gameplay_gameplay
local unitId = tonumber(getParameter("unit"))
local unit = gameplay.scene[0].units_list[unitId]
command.f_rallyPointRemove(unitId)
local kRadius = 65535 / gameplay.unitTypeModified[unit.typeModified].radius
local radius = 8 / kRadius
local x = vSession.f_coordinateToVisual2(unit.position_x)
local y = vSession.f_coordinateToVisual2(unit.position_y)
vSession.f_createEmitters(0, 4, radius, true, x, y)
