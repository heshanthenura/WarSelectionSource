local nodes = interface.nodes
nodes[39].visible = false
if nodes[46].visible then
  nodes[46].visible = false
else
  nodes[46].visible = true
  if nodes[77].visible then
    nodes[64].visible = false
    haveNewMessagesG = false
  else
    nodes[63].visible = false
    haveNewMessagesV = false
  end
  nodes[73].visible = haveNewMessagesG or haveNewMessagesV
end
