local nodes = interface.nodes
local w = nodes[5].widget
local id = w.currentLine
if id == nil then
  w = nodes[6].widget
  id = w.currentLine
end
if id == nil then
  return
end
mapCode = string.sub(w.lines[id], 5, 12)
root.interface.f_sendEvent("mapChoosen", mapCode)
