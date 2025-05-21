mapCode = getReplayMapCodeFromClipboard()
if mapCode == nil then
  mapCode = getCustomMapCodeFromClipboard()
end
local nodes = interface.nodes
if mapCode == nil then
  nodes[17].visible = true
else
  nodes[13].visible = false
  nodes[9].visible = true
end
