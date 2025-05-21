local parameter = getEditingModParameter()
local val = tonumber(getParameter("text"))
parameter.default = val
if val ~= nil then
  if parameter.default < parameter.min then
    parameter.default = parameter.min
  end
  if parameter.default > parameter.max then
    parameter.default = parameter.max
  end
end
onParameterUpdated()
