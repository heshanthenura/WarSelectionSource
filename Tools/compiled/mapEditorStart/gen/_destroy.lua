root.interface.f_remove(toolsInterface)
local id = root.interface.f_getIndex("mapEditorStartSettings")
if id ~= nil then
  root.interface.f_remove(id)
end
