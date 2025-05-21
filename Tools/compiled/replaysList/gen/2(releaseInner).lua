local code = root.system_clipboard_get
local success = startLoadingReplay(code)
local nodes = interface.nodes
nodes[8].visible = success
nodes[9].visible = not success
