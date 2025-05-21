playingDefaultMusic = false
currencyName = "???"
regionCoef = 1
techPoints = 0
connectServerTime = 0
connectLocalTime = 0
local nodes = interface.nodes
nodes[38].visible = not getParameter("hideSpecialModes")
hideCosmetics = getParameter("hideCosmetics")
nodes[48].visible = not hideCosmetics and currentDecorSale ~= nil
if getParameter("x") ~= nil then
  local n = nodes[1]
  n.sizeX = getParameter("sx")
  n.sizeY = getParameter("sy")
  n.localLeft = getParameter("x")
  n.localTop = getParameter("y")
  n.horizontalAlign = getParameter("horizontalAlign")
  n.verticalAlign = getParameter("verticalAlign")
end
