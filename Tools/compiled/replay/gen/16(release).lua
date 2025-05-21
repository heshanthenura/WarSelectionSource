scrollPressed = false
local nodes = interface.nodes
nodes[42].visible = false
if getParameter("inner") then
  local dumps = root.session_gameplay_replayProcess_dumps
  local w16 = nodes[16].widget
  local setTime = math.floor((w16.current - w16.min) * replayDuration / (w16.max - w16.min))
  if setTime < 100 then
    setTime = 100
  end
  root.session.f_deployDumpReplay(setTime)
  root.interface.f_sendEvent("replayRewind", tostring(setTime))
end
