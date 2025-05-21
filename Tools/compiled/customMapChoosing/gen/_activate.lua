if cannotRequestMaps then
  return
end
cannotRequestMaps = true
local nodes = interface.nodes
nodes[5].widget_lines.f_clear()
nodes[6].widget_lines.f_clear()
nodes[7].visible = false
nodes[4].visible = true
nodes[3].visible = false
mapsMyListUpload = createUpload("https://map-upload.warselect.io/list")
createUploadPostParameter(mapsMyListUpload, "ticket", root.lobby_ticket)
startUploading(mapsMyListUpload, "maps my list")
mapsPopListUpload = createUpload("https://map-upload.warselect.io/top100")
createUploadPostParameter(mapsPopListUpload, "ticket", "")
startUploading(mapsPopListUpload, "maps pop list")
