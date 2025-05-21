if useVeil then
  interface.nodes[1].visible = false
end
if root.session_gameplay_streamMode == 0 and stoppedTime ~= nil then
  root.session_gameplay_tickController_tickTime = stoppedTime
  stoppedTime = nil
end
