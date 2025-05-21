interfaceScale = interface.scaleWidgets
defaultDir = 0
placeInterface = getParameter("placeInterface")
assert(placeInterface ~= nil)
local data = fromJson(getParameter("data"))
if data ~= nil then
  nationNames = data.nationNames
  unitNames = data.unitNames
  unitNations = data.unitNations
  nationsAccess = data.nationsAccess
end
local nodes = interface.nodes
if getParameter("x") ~= nil then
  local n = nodes[1]
  n.horizontalAlign = getParameter("horizontalAlign")
  n.verticalAlign = getParameter("verticalAlign")
  n.sizeX = getParameter("sx")
  n.sizeY = getParameter("sy")
  n.localLeft = getParameter("x")
  n.localTop = getParameter("y")
end
local selfClose = getParameter("selfClose")
if selfClose == nil then
  selfClose = true
end
nodes[2].visible = selfClose
local changeFactions = getParameter("changeFactions")
if changeFactions == nil then
  changeFactions = true
end
nodes[8].visible = changeFactions
local changeAmount = getParameter("changeAmount")
if changeAmount == nil then
  changeAmount = true
end
nodes[13].visible = changeAmount
local data = {
  nationNames = nationNames,
  unitNames = unitNames,
  unitNations = unitNations
}
unitTypesInterface = root.interface.f_create("/project/Tools/unitTypes", interfaceName .. "-unitTypes", interfaceScale, interfaceScale, "parent", interfaceId, "data", toJson(data))
root.interface[unitTypesInterface].priority = 150
toolsInterface = root.interface.f_create("/project/Tools/tools", interfaceName .. "-tools", interfaceScale, interfaceScale, "parent", interfaceId)
root.interface[toolsInterface].active = true
root.interface[toolsInterface].priority = 150
factionsInterface = root.interface.f_create("/project/Tools/factions", interfaceName .. "-factions", interfaceScale, interfaceScale, "parent", interfaceId)
root.interface[factionsInterface].priority = 160
nodes[7].widget_text = "1"
setFactionOnUnitsAdd(root.session_visual_currentFaction)
