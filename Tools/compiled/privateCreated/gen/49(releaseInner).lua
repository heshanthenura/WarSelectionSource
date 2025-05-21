local json
if iCreator then
  json = {cmd = 1}
else
  json = {cmd = 3}
end
if root.lobby.f_sendCommand(16, toJson(json)) then
  local nodes = interface.nodes
  nodes[47].disabled = true
  nodes[49].disabled = true
end
