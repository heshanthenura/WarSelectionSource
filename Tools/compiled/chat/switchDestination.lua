local nodes = interface.nodes
local all = getParameter("destination") == "all"
nodes[23].visible = all
nodes[24].visible = not all
interface.setFocus = 22
