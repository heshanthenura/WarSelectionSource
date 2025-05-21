if root.lobby.f_sendCommand(11, "") then
  local nodes = interface.nodes
  nodes[89].disabled = true
  nodes[87].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
