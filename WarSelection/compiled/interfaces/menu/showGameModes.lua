local nodes = interface.nodes
local v = nodes[116].visible
clearChooseModeWindows()
if not v then
  nodes[116].visible = true
end
