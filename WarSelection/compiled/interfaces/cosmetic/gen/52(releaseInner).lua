local nodes = interface.nodes
nodes[53].visible = not nodes[53].visible
for _, id in ipairs(markerStatueChanged) do
  nodes[id].visible = false
end
nodes[57].visible = false
statuesOnButtonsTemp = {
  statuesOnButtons[1],
  statuesOnButtons[2],
  statuesOnButtons[3]
}
updateStatueButtonsTemp()
