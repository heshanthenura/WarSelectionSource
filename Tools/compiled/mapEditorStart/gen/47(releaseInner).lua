local nodes = interface.nodes
local data = {
  mapSize = {
    tonumber(nodes[44].widget_text),
    tonumber(nodes[46].widget_text)
  }
}
data.generate = nodes[39].widget_checked
if data.generate and generatorData ~= nil then
  data.generatorParameters = generatorData.parameters
  data.symmetry = generatorData.symmetry
end
root.interface[parentInterface].f_sendEvent("mapEditorStartMap", toJson(data))
cannotRequestMaps = nil
