local currentPlayer = root.session_gameplay_controlledPlayer
if root.session_gameplay_gameplay_player[currentPlayer].eliminated then
  interface.nodes[2].visible = true
end
