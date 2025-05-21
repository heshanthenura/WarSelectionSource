mapCode = getCustomMapCodeFromClipboard()
local nodes = interface.nodes
if mapCode == nil then
  nodes[3].visible = true
else
  root.interface.f_sendEvent("mapChoosen", mapCode)
end
