parentInterface = getParameter("parent")
rightDirection = getParameter("rightDirection")
if rightDirection == nil then
  rightDirection = true
end
allFactionsAsMy = getParameter("allFactionsAsMy")
local nodes = interface.nodes
local id = unitsSelectionButtons[1]
local n = nodes[id].widget_top_set
unitsSelectionNotFramedNormal = n.normal
unitsSelectionNotFramedPressed = n.pressed
unitsSelectionNotFramedHovered = n.hovered
local id = unitsSelectionButtons[2]
local n = nodes[id].widget_top_set
unitsSelectionFramedNormal = n.normal
unitsSelectionFramedPressed = n.pressed
unitsSelectionFramedHovered = n.hovered
local id = typeSelectionButtons[1]
local n = nodes[id].widget_top_set
typesSelectionNotFramedNormal = n.normal
typesSelectionNotFramedPressed = n.pressed
typesSelectionNotFramedHovered = n.hovered
local id = typeSelectionButtons[2]
local n = nodes[id].widget_top_set
typesSelectionFramedNormal = n.normal
typesSelectionFramedPressed = n.pressed
typesSelectionFramedHovered = n.hovered
local n = nodes[123]
n.sizeX = getParameter("sx")
n.sizeY = getParameter("sy")
n.localLeft = getParameter("x")
n.localTop = getParameter("y")
n.horizontalAlign = getParameter("horizontalAlign")
n.verticalAlign = getParameter("verticalAlign")
if rightDirection then
  nodes[1].horizontalAlign = 1
  nodes[1].localLeft = 0
  nodes[2].horizontalAlign = 1
  nodes[2].localLeft = 0
end
unitsSelectionButtonsDir = {}
unitsSelectionHealthDir = {}
typeSelectionButtonsDir = {}
typeSelectionNumbersDir = {}
insertDir(unitsSelectionButtonsDir, unitsSelectionButtons)
insertDir(unitsSelectionHealthDir, unitsSelectionHealth)
insertDir(typeSelectionButtonsDir, typeSelectionButtons)
insertDir(typeSelectionNumbersDir, typeSelectionNumbers)
