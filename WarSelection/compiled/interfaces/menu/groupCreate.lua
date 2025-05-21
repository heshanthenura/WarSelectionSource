local json = {
  version = getVersionArray()
}
if root.lobby.f_sendCommand(8, toJson(json)) then
  disablePanel(11)
else
  showError(localize("<*menuErrorNoLobby>"))
end
