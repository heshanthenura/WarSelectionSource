local nodes = interface.nodes
local show = not root.interface_settings_active and getParameter("finish") == nil
root.interface_settings_active = show
if root.session_gameplay_streamMode == 0 then
  nodes[8].visible = show
  if show then
    root.session_gameplay_tickController_tickTime = 10000000
  else
    root.session_gameplay_tickController_tickTime = 50
  end
end
