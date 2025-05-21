if root.lobby.f_sendCommand(7, "") then
  local nodes = interface.nodes
  nodes[46].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
