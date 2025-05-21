local nodes = interface.nodes
local curDuration = root.session_gameplay_gameplay_time
nodes[2].widget_text = toTimeStr(curDuration // 1000)
nodes[10].visible = curDuration > replayDuration
if scrollPressed then
  updateDumpTimeChange()
else
  local w16 = nodes[16].widget
  local p = curDuration / replayDuration
  if 1 < p then
    p = 1
  end
  w16.current = math.floor(w16.min + (w16.max - w16.min) * p)
end
