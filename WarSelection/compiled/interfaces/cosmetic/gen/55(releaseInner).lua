local nodes = interface.nodes
nodes[53].visible = false
statuesOnButtons = {
  statuesOnButtonsTemp[1],
  statuesOnButtonsTemp[2],
  statuesOnButtonsTemp[3]
}
root.storage.f_set("statues", toJson(statuesOnButtons))
updateStatueButtons()
