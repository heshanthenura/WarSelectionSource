if getParameter("pressed") then
  return
end
local nodes = interface.nodes
local n = nodes[25]
local sx = n.sizeX / texturesCount
local sy = n.sizeY / texturesCount
local x = getParameter("x")
local y = getParameter("y")
choosenTexture = math.floor(x // sx + y // sy * texturesCount)
nodes[24].visible = false
