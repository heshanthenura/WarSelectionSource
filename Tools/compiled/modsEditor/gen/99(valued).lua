local value = getParameter("value") > 0
parameter = getEditingModParameter()
parameter.default = value
onParameterUpdated()
