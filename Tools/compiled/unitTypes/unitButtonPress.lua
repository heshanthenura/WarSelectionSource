local nodes = interface.nodes
nodes[191].widget_value = buttonsUnits[getParameter("widget")]
assert(nodes[191].widget_value ~= nil)
onUnitChoose()
nodes[192].visible = false
