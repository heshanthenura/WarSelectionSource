local nodes = interface.nodes
local w = nodes[2].widget
if w.currentLine == nil then
  return
end
root.system.clipboard.f_set(w.lines[w.currentLine])
