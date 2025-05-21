local button = tonumber(getParameter("button"))
local command = root.session_visual_commands
if command == nil then
  return
end
local units = getMyCulture().units
if button > #units then
  return
end
local unitTypeId = units[button][1]
local count = 1
if interface.hotKeys.f_check(1) then
  count = 5
end
command.f_specialCommand(0, "command", "sellUnit", "unit", unitTypeId, "count", count)
