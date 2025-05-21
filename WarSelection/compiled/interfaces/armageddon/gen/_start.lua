local nodes = interface.nodes
local myFactionId = root.session_visual_currentFaction
nodes[2].widget_color_value = getFactionColor(myFactionId)
