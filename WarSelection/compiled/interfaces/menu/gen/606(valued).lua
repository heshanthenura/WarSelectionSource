local nodes = interface.nodes
nodes[781].visible = getParameter("value") == 1
if getParameter("value") == 1 then
  nodes[482].widget_text = localize("<*gameModeMultiTeam>")
else
  nodes[482].widget_text = localize("<*gameModeMultiFFA>")
end
