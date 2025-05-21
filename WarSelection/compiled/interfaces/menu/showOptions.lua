local nodes = interface.nodes
local vis = nodes[325].visible
clearChooseModeWindows()
nodes[325].visible = not vis
nodes[870].visible = false
