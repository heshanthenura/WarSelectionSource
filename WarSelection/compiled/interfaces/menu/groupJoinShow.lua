local nodes = interface.nodes
local show = not nodes[608].visible
clearChooseModeWindows()
nodes[608].visible = show
nodes[586].visible = false
nodes[724].visible = false
nodes[476].disabled = false
nodes[737].disabled = false
