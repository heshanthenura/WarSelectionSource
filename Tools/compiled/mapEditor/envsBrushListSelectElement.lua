local nodes = interface.nodes
local val = getParameter("value")
if val == nil then
  nodes[36].visible = false
  nodes[46].widget_text_text = ""
  nodes[125].widget_text = "-"
  nodes[126].widget_text = "-"
else
  nodes[36].visible = true
  updateProb()
end
