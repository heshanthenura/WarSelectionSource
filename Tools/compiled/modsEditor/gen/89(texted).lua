local parameter = getEditingModParameter()
parameter.min = tonumber(getParameter("text"))
if parameter.min > parameter.max then
  parameter.min = parameter.max
end
onParameterUpdated()
