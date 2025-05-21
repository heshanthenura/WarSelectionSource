local nodes = interface.nodes
local sy = nodes[5].sizeY
local x = nodes[6].localLeft + nodes[6].sizeX // 2
local y = math.floor(sy * getParameter("value") / 255)
onPalleteChangePosition(x, y)
