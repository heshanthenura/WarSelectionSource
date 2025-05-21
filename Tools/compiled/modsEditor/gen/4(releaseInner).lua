local nodes = interface.nodes
local mod = getEditingMod()
assert(mod.canSave)
createUpload("save?code=" .. editingModCode, "Save mod")
if mod.newContent ~= nil then
  createUploadPostParameter("script", mod.newContent, true)
end
if mod.newName ~= nil then
  createUploadPostParameter("name", mod.newName)
end
if mod.newDescription ~= nil then
  createUploadPostParameter("description", mod.newDescription)
end
if mod.parametersUpdated then
  local j = toJson(mod.parameters)
  if j == nil then
    j = ""
  end
  createUploadPostParameter("parameters", j)
  mod.parametersUpdated = false
end
startUploading()
saveTime = os.time() + 60
nodes[4].disabled = true
nodes[47].visible = true
nodes[35].visible = false
nodes[36].visible = false
