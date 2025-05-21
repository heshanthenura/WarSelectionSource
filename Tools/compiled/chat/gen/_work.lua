if chatFocused then
  local nodes = interface.nodes
  if not nodes[22].isFocused then
    nodes[28].visible = false
    chatFocused = false
    nodes[1].visible = false
  end
else
  local dt = os.time() - chatLastTime
  if 10 < dt then
    local nodes = interface.nodes
    nodes[1].visible = false
  end
end
local tm = root.session_gameplay_gameplay_time
if tm < lastTime or tm > lastTime + 50000 then
  chatLog = {}
  chatLastTime = 0
  updateChat()
end
lastTime = tm
