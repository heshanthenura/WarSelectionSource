parentInterface = getParameter("parent")
generatorInterface = getParameter("generatorInterface")
local interfaceScale = interface.scaleWidgets
toolsInterface = root.interface.f_create("/project/Tools/tools", "mapEditorStartTools", interfaceScale, interfaceScale, "parent", interfaceId)
root.interface[toolsInterface].priority = 150
root.interface[toolsInterface].active = true
local nodes = interface.nodes
if generatorInterface ~= nil then
  local n = nodes[49]
  root.interface.f_create(generatorInterface, "mapEditorStartSettings", interfaceScale, interfaceScale, "parent", interfaceId, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
  root.interface_mapEditorStartSettings_priority = 120
end
nodes[39].visible = generatorInterface ~= nil
