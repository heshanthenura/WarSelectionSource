local nodes = interface.nodes
local enter = toBool(getParameter("enter"))
nodes[33].visible = enter
nodes[253].visible = enter
nodes[490].visible = not enter
