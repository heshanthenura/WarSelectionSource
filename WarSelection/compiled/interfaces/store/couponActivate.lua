local nodes = interface.nodes
local code = nodes[122].widget_text
if root.lobby.f_sendCommand(0, "\"" .. code .. "\"") then
  nodes[126].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
