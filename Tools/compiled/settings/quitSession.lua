if parentInterface ~= nil then
  root.interface[parentInterface].f_sendEvent("quitSessionRequest", "")
  interface.active = false
  return
end
local nodes = interface.nodes
if getParameter("confirmation") == nil then
  nodes[59].visible = true
elseif toBool(getParameter("confirmation")) then
  local streamMode = root.session_gameplay_streamMode
  if streamMode ~= 2 then
    root.session_gameplay_command.f_specialCommand(0, "command", "leave")
  end
  leaveSession = 3
else
  nodes[59].visible = false
end
