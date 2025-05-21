local json = {
  version = getVersionArray()
}
if root.lobby.f_sendCommand(8, toJson(json)) then
  local nodes = interface.nodes
  nodes[61].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
