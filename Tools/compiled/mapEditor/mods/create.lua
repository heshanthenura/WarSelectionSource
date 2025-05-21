local nodes = interface.nodes
local modName = nodes[442].widget_text_text
local modDesc = nodes[437].widget_text_text
if modName == "" then
  return
end
createUploadMod("create")
createModUploadPostParameter("name", modName)
createModUploadPostParameter("description", modDesc)
if creatingModType == "gameplay" then
  createModUploadPostParameter("type", "0")
else
  createModUploadPostParameter("type", "1")
end
startModUploading("Create mod")
