local text = getParameter("text")
if text == "" then
  return
end
local nodes = interface.nodes
local parameter = getEditingModParameter()
parameter.desc = text
onParameterUpdated()
