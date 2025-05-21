local parameter = getEditingModParameter()
local val = tonumber(getParameter("text"))
if val == nil then
  return
end
parameter.min = val
if parameter.min >= parameter.max then
  parameter.min = parameter.max - 1
end
onParameterUpdated()
