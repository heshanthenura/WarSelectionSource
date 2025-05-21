local nodes = interface.nodes
local value = nodes[265].widget_current
nodes[275].widget_text = value
root.session_visual_placer.f_turnOff()
startPlacerUnitsRemove()
