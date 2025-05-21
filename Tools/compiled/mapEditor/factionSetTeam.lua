local nodes = interface.nodes
local factionId = nodes[303].widget_currentLine + 1
local value = getParameter("value") + 1
assert(0 < value)
assert(value <= #teamsList)
factionsList[factionId].team = value
markMapNotSaved()
