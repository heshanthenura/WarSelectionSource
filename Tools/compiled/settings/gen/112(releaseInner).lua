local nodes = interface.nodes
local line = nodes[89].widget_value
local name = nodes[89].widget_lines[line]
local data = itfData[name]
root.interface[data.id].f_restoreHotKeysDefaults()
root.interface.f_saveUsersHotKeys()
updateHotKeysList(data.id, data.hotKeys)
nodes[90].visible = false
nodes[92].visible = false
nodes[111].visible = false
