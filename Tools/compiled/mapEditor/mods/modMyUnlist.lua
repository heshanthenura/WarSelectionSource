local nodes = interface.nodes
if getParameter("confirm") == nil then
  nodes[208].visible = true
  return
end
nodes[208].visible = false
if not toBool(getParameter("confirm")) then
  return
end
createUploadMod("unlist")
createModUploadPostParameter("code", editingMyModCode)
startModUploading("Unlist mod")
for i, myModData in ipairs(myMods) do
  if myModData.code == editingMyModCode then
    table.remove(myMods, i)
    break
  end
end
updateMyModsLists()
