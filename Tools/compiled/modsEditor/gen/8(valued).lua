local nodes = interface.nodes
nodes[12].widget_currentLine = nil
local modsVisual = root.session_gameplay_gameplay_scene[0].mapData_modsVisual
local id = getParameter("value")
modShow(nodes[8].widget_lines[id], modsVisual[id].file, "visual")
