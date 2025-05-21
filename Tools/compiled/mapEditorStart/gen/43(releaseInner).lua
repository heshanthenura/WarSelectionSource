local nodes = interface.nodes
editingSliderName = getParameter("name")
local data = {
  value = nodes[getParameter("text")].widget_text,
  step = 1,
  min = 100,
  max = 1000,
  minVisual = 100,
  maxVisual = 1000,
  interface = interfaceId
}
root.interface[toolsInterface].f_sendEvent("numberStart", toJson(data))
