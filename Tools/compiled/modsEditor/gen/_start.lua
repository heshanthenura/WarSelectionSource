modsDeveloper = tonumber(getParameter("developer"))
assert(modsDeveloper ~= nil)
iAmDeveloper = root.session_gameplay_controlledPlayer == modsDeveloper
modsList = {}
canSaveSum = 0
canReleaseSum = 0
logMesagesG = {totalCount = 0}
logMesagesV = {totalCount = 0}
local playerNames = fromJson(root.session_visual_dataStorage_playerNames)
local nodes = interface.nodes
nodes[41].widget_text = playerNames[modsDeveloper + 1]
nodes[1].visible = iAmDeveloper
if iAmDeveloper then
  nodes[53].visible = false
  nodes[77].visible = true
  loadModsInfo()
  updateModsLists(false)
end
