local nodes = interface.nodes
local shown = nodes[81].visible
hideWindows()
if not shown then
  nodes[81].visible = true
  nodes[52].disabled = true
  startPlacerEnvsAdd()
end
