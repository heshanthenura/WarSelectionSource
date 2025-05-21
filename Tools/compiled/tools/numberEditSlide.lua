local nodes = interface.nodes
numValue = getParameter("value") * numStep
nodes[42].widget_text_text = numValue
sendSliderValue(numValue)
