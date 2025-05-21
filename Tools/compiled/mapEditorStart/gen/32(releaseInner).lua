local nodes = interface.nodes
local id = nodes[33].widget_currentLine
if id == nil then
  return
end
nodes[24].widget_text = nodes[33].widget_lines[id]
nodes[23].visible = true
