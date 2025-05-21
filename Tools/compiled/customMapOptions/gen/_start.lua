if getParameter("x") ~= nil then
  local n = interface.nodes[1]
  n.sizeX = getParameter("sx")
  n.sizeY = getParameter("sy")
  n.localLeft = getParameter("x")
  n.localTop = getParameter("y")
  n.horizontalAlign = getParameter("horizontalAlign")
  n.verticalAlign = getParameter("verticalAlign")
end
