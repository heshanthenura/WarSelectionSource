local nodes = interface.nodes
local vis = not nodes[239].visible
clearChooseModeWindows()
if vis then
  nodes[239].visible = true
  root.interface_replaysList_active = true
end
