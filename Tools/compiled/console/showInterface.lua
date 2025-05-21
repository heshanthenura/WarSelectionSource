local nodes = interface.nodes
local v = not nodes[1].visible
nodes[1].visible = v
if v then
  interface.setFocus = 3
end
