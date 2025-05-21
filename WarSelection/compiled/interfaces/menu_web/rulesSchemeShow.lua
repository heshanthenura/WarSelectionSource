local nodes = interface.nodes
local w = {
  175,
  177,
  176
}
local id = w[tonumber(getParameter("rule"))]
nodes[id].visible = getParameter("event") == 7
