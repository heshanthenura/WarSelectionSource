local nodes = interface.nodes
nodes[24].visible = not nodes[24].visible
local n = nodes[25]
local sx = n.sizeX / texturesCount
local sy = n.sizeY / texturesCount
nodes[26].localLeft = math.floor(choosenTexture % texturesCount * sx)
nodes[26].localTop = math.floor(choosenTexture // texturesCount * sy)
