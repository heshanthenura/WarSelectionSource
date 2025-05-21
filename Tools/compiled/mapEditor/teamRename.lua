local nodes = interface.nodes
local teamId = nodes[289].widget_currentLine + 1
teamsList[teamId].name = getParameter("text")
updateTeamsList()
markMapNotSaved()
