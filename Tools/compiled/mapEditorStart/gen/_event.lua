local eventName = getParameter("name")
if eventName == "toolsOnNumber" then
  local value = tonumber(getParameter("data"))
  local nodes = interface.nodes
  local editingNumberWidget
  if editingSliderName == "mapX" then
    editingNumberWidget = 44
  else
    editingNumberWidget = 46
  end
  nodes[editingNumberWidget].widget_text = value
  nodes[38].widget_value = 6
  return
end
if eventName == "generatorData" then
  generatorData = fromJson(getParameter("data"))
  return
end
