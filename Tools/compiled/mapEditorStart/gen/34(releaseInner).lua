local nodes = interface.nodes
local w = nodes[33].widget
local id = w.currentLine
if id == nil then
  return
end
mapCode = string.sub(w.lines[id], 5, 12)
startMapEditorFromCode()
