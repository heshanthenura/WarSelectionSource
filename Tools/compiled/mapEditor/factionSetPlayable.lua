local nodes = interface.nodes
local factionId = nodes[303].widget_currentLine + 1
if getParameter("value") == 1 then
  factionsList[factionId].notPlayable = nil
else
  factionsList[factionId].notPlayable = true
end
markMapNotSaved()
