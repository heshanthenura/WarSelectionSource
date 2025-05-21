local nodes = interface.nodes
local show = not nodes[132].visible
hideWindows()
if show then
  nodes[132].visible = true
  nodes[32].disabled = true
  startPlacerTexturing()
end
