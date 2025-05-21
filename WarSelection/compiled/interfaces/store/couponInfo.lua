local nodes = interface.nodes
local code = nodes[43].widget_text_text
if root.lobby.f_sendCommand(1, "\"" .. code .. "\"") then
  nodes[44].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
