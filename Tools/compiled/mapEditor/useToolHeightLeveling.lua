local nodes = interface.nodes
local shown = nodes[40].visible
hideWindows()
if not shown then
  nodes[40].visible = true
  nodes[30].disabled = true
  startPlacerLeveling()
end
