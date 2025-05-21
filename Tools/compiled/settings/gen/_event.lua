local eventName = getParameter("name")
if eventName == "getHotKeysResult" then
  local data = fromJson(getParameter("data"))
  itfData[data.name] = data
  local nodes = interface.nodes
  nodes[89].widget_lines.f_create(data.name)
end
if eventName == "graphicsChanged" then
  local nodes = interface.nodes
  nodes[62].visible = nodes[23].widget_value == 4
end
