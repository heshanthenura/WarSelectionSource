local text = getParameter("text")
if text == "" then
  return
end
local nodes = interface.nodes
local parameter = getEditingModParameter()
parameter.name = text
local mod = getEditingMod()
updateModParameters(mod)
nodes[92].widget_currentLine = editingParameterId - 1
nodes[122].visible = true
onParameterUpdated()
