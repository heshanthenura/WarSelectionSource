local nodes = interface.nodes
if root.lobby.f_sendCommand(11, "") then
  nodes[550].disabled = true
  nodes[585].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
