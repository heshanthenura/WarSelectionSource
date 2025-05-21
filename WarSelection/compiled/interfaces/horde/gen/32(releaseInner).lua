local commands = root.session_visual_commands
if commands == nil then
  return
end
local race = getParameter("race")
commands.f_specialCommand(0, "command", "race", "race", race)
interface.nodes[68].visible = false
