local nodes = interface.nodes
nodes[505].visible = false
local mci = root.interface_customMapChoosing
mci.active = not mci.active
nodes[624].visible = mci.active
