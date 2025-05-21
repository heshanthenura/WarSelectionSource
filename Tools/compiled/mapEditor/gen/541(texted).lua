local nodes = interface.nodes
local factionId = nodes[303].widget_currentLine + 1
local text = getParameter("text")
if text == "" then
  factionsList[factionId].externalData = nil
else
  factionsList[factionId].externalData = text
end
markMapNotSaved()
