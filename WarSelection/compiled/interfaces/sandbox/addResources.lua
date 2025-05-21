local command = root.session_visual_commands
if command == nil then
  return
end
local faction = root.session_visual_currentFaction
command.f_specialCommand(0, "command", "resources", "faction", faction)
