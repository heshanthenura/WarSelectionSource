local nodes = interface.nodes
if nodes[39].widget_current > nodes[39].widget_max / 2 then
  nodes[39].widget_max = nodes[39].widget_current * 2
end
