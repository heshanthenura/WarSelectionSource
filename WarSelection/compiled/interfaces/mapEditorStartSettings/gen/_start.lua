parentInterface = getParameter("parent")
if getParameter("x") ~= nil then
  local nodes = interface.nodes
  local n = nodes[1]
  n.sizeX = getParameter("sx")
  n.sizeY = getParameter("sy")
  n.localLeft = getParameter("x")
  n.localTop = getParameter("y")
  n.horizontalAlign = getParameter("horizontalAlign")
  n.verticalAlign = getParameter("verticalAlign")
end
