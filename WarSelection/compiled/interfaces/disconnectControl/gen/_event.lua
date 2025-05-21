local eventName = getParameter("name")
if eventName == "sessionDisconnect" then
  disconnectTime = os.time()
  local nodes = interface.nodes
  nodes[1].visible = true
  return
end
if eventName == "sessionConnect" then
  disconnectTime = nil
  local nodes = interface.nodes
  nodes[1].visible = false
  return
end
