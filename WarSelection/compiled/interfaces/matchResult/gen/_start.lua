local gSes = root.session_gameplay
local controlledPlayer = gSes.controlledPlayer
if gSes.gameplay_player[controlledPlayer].eliminated then
  local nodes = interface.nodes
  nodes[2].visible = true
end
