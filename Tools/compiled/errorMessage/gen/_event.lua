local eventName = getParameter("name")
if eventName == "showError" then
  local text = getParameter("data")
  local nodes = interface.nodes
  interface.active = true
  nodes[2].widget_text = text
end
