local nodes = interface.nodes
nodes[47].visible = false
if getParameter("apply") == nil then
  sendSliderValue(startNumValue)
end
