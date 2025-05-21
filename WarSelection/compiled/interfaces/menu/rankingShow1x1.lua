local nodes = interface.nodes
local open = getParameter("open") ~= nil and toBool(getParameter("open"))
local vis = nodes[151].visible and not open
clearChooseModeWindows()
if vis then
  nodes[151].visible = false
else
  nodes[151].visible = true
  getRankingsTable()
end
