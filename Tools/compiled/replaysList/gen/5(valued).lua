local nodes = interface.nodes
local value = getParameter("value")
local match = mathcesList[value + 1]
local canRun = match.actualVersion or editorMode
nodes[7].visible = true
nodes[7].disabled = not canRun
nodes[6].visible = not canRun
