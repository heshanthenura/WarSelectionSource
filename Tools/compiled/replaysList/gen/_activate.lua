local nodes = interface.nodes
if matchesListUpload == nil and mathcesList == nil and root.lobby.connected then
  matchesListUpload = createUpload("https://games-api.warselect.io/getUserGames")
  assert(type(root.lobby_ticket) == "string")
  createUploadPostParameter(matchesListUpload, "ticket", root.lobby_ticket)
  startUploading(matchesListUpload, "matches list")
  nodes[4].visible = false
  nodes[8].visible = true
else
  nodes[8].visible = false
end
nodes[9].visible = false
