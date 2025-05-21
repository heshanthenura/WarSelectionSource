local nodes = interface.nodes
if getParameter("finish") ~= nil then
  nodes[19].visible = false
  updateVeil()
  return
end
root.interface_settings_active = true
