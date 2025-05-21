local nodes = interface.nodes
local dir = tonumber(getParameter("dir"))
nodes[893].disabled = true
nodes[892].disabled = true
local p = rankingTopPlace + dir * 15
if p < 0 then
  p = 0
end
if 80 < p then
  p = 80
end
local season = nodes[1191].widget_lines_size - nodes[1191].widget_value - 1
root.rankings.f_getByPlace(nodes[1635].widget_value, season, p, 20)
rankingOutOfList = false
