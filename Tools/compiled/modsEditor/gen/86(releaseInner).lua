local parameter = getEditingModParameter()
table.remove(parameter.list, editingVariant)
editParameterData(parameter)
onParameterUpdated()
