local nodes = interface.nodes
local value = getParameter("value")
local json = {cmd = 7}
if 0 < value then
  assert(value <= #customMapData.factions)
  json.faction = value - 1
  setCurrentLineAndScroll(customMapData.factions[value].team)
else
  setCurrentLineAndScroll(0)
end
root.lobby.f_sendCommand(16, toJson(json))
