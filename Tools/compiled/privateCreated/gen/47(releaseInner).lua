if root.lobby.f_sendCommand(16, toJson({cmd = 4})) then
  local nodes = interface.nodes
  nodes[47].disabled = true
  nodes[49].disabled = true
end
