local value = getParameter("value")
local nodes = interface.nodes
nodes[5].widget_color_value = getColor(value, value, value)
updateEditingColorFromPalete()
updateWhite()
updateColor()
