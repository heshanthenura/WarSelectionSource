local nodes = interface.nodes
nodes[111].visible = true
local line = nodes[89].widget_value
local name = nodes[89].widget_lines[line]
local data = itfData[name]
nodes[116].widget_text = data.name
