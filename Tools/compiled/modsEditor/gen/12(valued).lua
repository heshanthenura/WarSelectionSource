local nodes = interface.nodes
nodes[8].widget_currentLine = nil
local modsGameplay = root.session_gameplay_gameplay_scene[0].mapData_modsGameplay
local id = getParameter("value")
modShow(nodes[12].widget_lines[id], modsGameplay[id].file, "gameplay")
