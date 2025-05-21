local nodes = interface.nodes
placing = {}
local n = nodes[1]
n.localLeft = getParameter("x")
n.localTop = getParameter("y")
n.horizontalAlign = getParameter("horizontalAlign")
n.verticalAlign = getParameter("verticalAlign")
placingCursor = getParameter("cursor")
for n = 1, #buttons do
  local text = getParameter("text" .. n)
  nodes[buttons[n]].visible = text ~= nil
  nodes[texts[n]].widget_text = text
  local pl = getParameterBool("placing" .. n, true)
  table.insert(placing, pl)
end
