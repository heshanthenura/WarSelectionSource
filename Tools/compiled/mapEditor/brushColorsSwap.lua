local nodes = interface.nodes
local c = nodes[5].widget_color_value
nodes[5].widget_color_value = nodes[13].widget_color_value
nodes[13].widget_color_value = c
