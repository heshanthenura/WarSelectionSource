local nodes = interface.nodes
local shown = nodes[754].visible
hideWindows()
if not shown then
  nodes[42].visible = true
  nodes[754].visible = true
  nodes[53].disabled = true
  local factionId = nodes[303].widget_currentLine
  local faction = factionsList[factionId + 1]
  nodes[756].widget_color_value = factionsColors[faction.color][1]
  nodes[757].widget.text = faction.name
  nodes[275].widget_text = nodes[265].widget_current
  root.interface[unitPlacingInterface].active = true
  root.interface[unitPlacingInterface].f_sendEvent("onFactionChoose", tostring(factionId))
  startPlacerUnitsRemove()
end
