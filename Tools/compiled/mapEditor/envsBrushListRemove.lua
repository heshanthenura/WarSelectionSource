local nodes = interface.nodes
local w = nodes[18].widget
local id = w.currentLine
if id == nil then
  return
end
w.lines_remove = id
table.remove(envsList, id + 1)
if w.lines_size > 0 then
  if id == w.lines_size then
    id = id - 1
  end
  w.currentLine = id
  updateProb()
else
  nodes[36].visible = false
  nodes[116].visible = true
end
