local nodes = interface.nodes
if getParameter("player") == nil then
  nodes[65].visible = false
  return
end
local playerNum = tonumber(getParameter("player"))
local team = tonumber(getParameter("team"))
player = staticData.teams[team][playerNum].playerId
if not nodes[65].visible or complaintPlayer ~= player then
  showPlayerWindow(player)
else
  complaintPlayer = nil
  nodes[65].visible = false
end
