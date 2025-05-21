local nodes = interface.nodes
local line = nodes[367].widget_currentLine
root.lobby.f_sendCommand(14, toJson(line))
