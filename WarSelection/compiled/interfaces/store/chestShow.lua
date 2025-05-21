local nodes = interface.nodes
if nodes[338].visible then
  nodes[338].visible = false
else
  closeAllWindows()
  nodes[338].visible = true
  nodes[341].widget_checked = false
  updateChestChecker()
end
