local nodes = interface.nodes
local show = not nodes[873].visible
if getParameter("player") == nil then
  nodes[873].visible = false
  nodes[405].visible = false
  return
end
local but = tonumber(getParameter("player")) + 1
local player
for pl, pos in pairs(playersListPosition) do
  if pos == but then
    player = pl - 1
  end
end
if show or complaintPlayer ~= player then
  showPlayerWindow(player)
else
  complaintPlayer = nil
  nodes[873].visible = false
  nodes[405].visible = false
end
