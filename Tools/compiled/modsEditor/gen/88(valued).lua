local parameter = getEditingModParameter()
parameter.type = getParameter("value")
parameter.min = nil
parameter.max = nil
parameter.default = nil
parameter.list = nil
if parameter.type == 0 then
  parameter.list = {
    {
      "one",
      "The only option"
    }
  }
  parameter.default = "one"
elseif parameter.type == 1 then
  parameter.min = 0
  parameter.max = 1000000000
  parameter.default = 0
elseif parameter.type == 2 then
  parameter.min = 0
  parameter.max = 100
  parameter.default = ""
elseif parameter.type == 3 then
  parameter.default = true
end
editParameterData(parameter)
onParameterUpdated()
