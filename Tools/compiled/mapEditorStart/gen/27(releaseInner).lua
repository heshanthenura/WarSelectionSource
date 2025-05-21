local nodes = interface.nodes
local id = nodes[33].widget_currentLine
if id == nil then
  return
end
local code = nodes[33].widget_lines[id]
code = string.sub(code, 5, 12)
unlistMapUpload = createUpload("https://map-upload.warselect.io/unlistMap?code=" .. code)
createUploadPostParameter(unlistMapUpload, "ticket", root.lobby_ticket)
startUploading(unlistMapUpload, "unlist map")
nodes[23].disabled = true
nodes[34].visible = false
nodes[32].visible = false
