local nodes = interface.nodes
if getParameter("confirm") ~= nil then
  nodes[405].visible = false
  local command = getCommands()
  if command == nil then
    return
  end
  local faction = root.session_visual_currentFaction
  command.f_specialCommand(0, "command", "kick", "kickPlayer", complaintPlayer)
else
  nodes[405].visible = not nodes[405].visible
end
