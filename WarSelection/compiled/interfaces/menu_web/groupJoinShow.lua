local nodes = interface.nodes
if nodes[54].visible then
  resetPanels()
else
  hideAllWindows()
  nodes[54].visible = true
  nodes[111].visible = false
  nodes[58].disabled = false
  nodes[56].disabled = false
  nodes[53].widget_text_text = ""
end
