local nodes = interface.nodes
local value = nodes[101].widget_current
assert(value ~= nil)
setInterfaceScaleW(value)
