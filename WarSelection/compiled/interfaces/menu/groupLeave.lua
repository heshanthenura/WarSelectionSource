if root.lobby.f_sendCommand(10, "") then
  local nodes = interface.nodes
  nodes[730].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
