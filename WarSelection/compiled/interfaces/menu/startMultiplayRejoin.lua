local server = root.storage_sessionServer
local ticket = root.storage_sessionTicket
assert(server ~= nil)
assert(ticket ~= nil)
local nodes = interface.nodes
nodes[1158].disabled = true
log("Reconnect")
startMultiplay(server, ticket)
