if not isModeNetwork then
  return
end
local player = tonumber(getParameter("player"))
local show = getParameter("event") == 7 and player ~= root.session_gameplay_controlledPlayer
local nodes = interface.nodes
nodes[playersComplaintButton[player + 1]].visible = show
