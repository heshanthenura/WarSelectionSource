local nodes = interface.nodes
if nodes[237].visible then
  nodes[237].visible = false
else
  nodes[237].visible = true
  for i = 1, 64 do
    local id = 330 + i
    nodes[id].widget_color_a = 255
    nodes[id].disabled = false
  end
  for i = 1, #factionsList do
    local id = 330 + factionsList[i].color
    nodes[id].widget_color_a = 127
    nodes[id].disabled = true
  end
  local w = nodes[764]
  local factionId = nodes[303].widget_currentLine + 1
  local id = 330 + factionsList[factionId].color
  local ww = nodes[id]
  w.localLeft = ww.screenLeft - (w.sizeX - ww.sizeX) // 2
  w.localTop = ww.screenTop - (w.sizeY - ww.sizeY) // 2
end
