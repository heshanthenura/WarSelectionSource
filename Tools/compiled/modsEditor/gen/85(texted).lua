local parameter = getEditingModParameter()
parameter.max = tonumber(getParameter("text"))
if parameter.max < parameter.min then
  parameter.max = parameter.min
end
onParameterUpdated()
