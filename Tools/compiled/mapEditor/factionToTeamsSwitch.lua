local nodes = getNodes()
if nodes[218].widget_value == 0 then
  onFactionSelect(nodes[303].widget_currentLine + 1)
else
  onTeamSelect(nodes[289].widget_currentLine + 1)
end
