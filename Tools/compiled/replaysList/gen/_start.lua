parentInterface = getParameter("parent")
lastReplayFile = getParameter("lastReplayFile")
local nodes = interface.nodes
nodes[3].visible = lastReplayFile ~= nil
if getParameter("x") ~= nil then
  local n = nodes[1]
  n.sizeX = getParameter("sx")
  n.sizeY = getParameter("sy")
  n.localLeft = getParameter("x")
  n.localTop = getParameter("y")
  n.horizontalAlign = getParameter("horizontalAlign")
  n.verticalAlign = getParameter("verticalAlign")
end
