local nodes = interface.nodes
if nodes[65].visible then
  resetPanels()
else
  hideAllWindows()
  nodes[65].visible = true
  nodes[61].disabled = false
end
