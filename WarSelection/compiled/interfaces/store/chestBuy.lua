if root.lobby.f_sendCommand(13, "") then
  local nodes = interface.nodes
  nodes[342].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
