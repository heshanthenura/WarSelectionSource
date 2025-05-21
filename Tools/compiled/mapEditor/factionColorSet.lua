local nodes = interface.nodes
local factionId = nodes[303].widget_currentLine + 1
local faction = factionsList[factionId]
faction.color = tonumber(getParameter("color"))
nodes[425].widget_color_value = factionsColors[faction.color][1]
nodes[299].widget_color_value = factionsColors[faction.color][1]
nodes[237].visible = false
updateFactionsList()
markMapNotSaved()
