local nodes = interface.nodes
local factionId = nodes[303].widget_currentLine + 1
factionsList[factionId].name = getParameter("text")
updateFactionsList()
markMapNotSaved()
