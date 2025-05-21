local nodes = interface.nodes
local vis = nodes[144].visible
clearChooseModeWindows()
if vis then
  nodes[144].visible = false
  return
end
nodes[305].disabled = false
nodes[116].visible = false
nodes[144].visible = true
nodes[77].widget_text_text = ""
nodes[80].disabled = false
