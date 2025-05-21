local nodes = interface.nodes
if nodes[12].widget_checked then
  startSinglePrivateData.make.devMode = true
end
local privateGameName = root.storage_privateGameName
if privateGameName == nil then
  privateGameName = localize("<*defaultMatchName>")
end
startSinglePrivateData.make.name = privateGameName
if root.lobby.f_sendCommand(16, toJson(startSinglePrivateData)) then
  disablePanel()
else
  showError(localize("<*menuErrorNoLobby>"))
end
