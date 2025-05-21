local parameter = getEditingModParameter()
local num = tonumber(getParameter("text"))
if num == nil then
  return
end
parameter.max = num
if parameter.max <= parameter.min then
  parameter.max = parameter.min + 1
end
onParameterUpdated()
