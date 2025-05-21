local nodes = interface.nodes
local shown = nodes[41].visible
hideWindows()
if not shown then
  nodes[41].visible = true
  nodes[29].disabled = true
  startPlacerHeightChange()
end
