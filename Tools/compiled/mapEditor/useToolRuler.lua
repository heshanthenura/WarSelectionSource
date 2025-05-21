local nodes = interface.nodes
local show = not nodes[177].visible
hideWindows()
if show then
  nodes[177].visible = true
  nodes[114].disabled = true
  startPlacerRuler()
end
