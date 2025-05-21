local line = getParameter("value")
local nodes = interface.nodes
local name = nodes[89].widget_lines[line]
local data = itfData[name]
local itfHk = root.interface[data.id].hotKeys_list
updateHotKeysList(data.id, data.hotKeys)
nodes[90].visible = false
nodes[92].visible = false
nodes[125].visible = true
