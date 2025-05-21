local parameter = getEditingModParameter()
parameter.list[editingVariant][1] = getParameter("text")
onParameterUpdated()
