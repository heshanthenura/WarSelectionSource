if not editingOwnFile then
  return
end
local p = string.find(editingFileName, "_")
assert(p ~= nil)
local code = string.sub(editingFileName, p - 11, p - 1)
local vers = string.sub(editingFileName, p + 1)
local prefix = string.sub(editingFileName, 1, p - 12)
local hex = root.functions_transcoding.f_toHex(root.functions_transcoding.f_fromBase62(code))
local file = "modsStorage/" .. prefix .. code .. "_" .. vers .. "-" .. hex .. ".lua"
data = {
  interface = interfaceId,
  data = toJson({
    modType = editingModType,
    modCode = editingModCode
  })
}
root.fileEditor.f_edit(file, toJson(data))
