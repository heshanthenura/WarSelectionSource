mapCode = getReplayMapCodeFromClipboard()
local nodes = interface.nodes
if mapCode == nil then
  nodes[1264].visible = false
  nodes[1461].visible = true
else
  nodes[1264].visible = true
  nodes[1461].visible = false
end
