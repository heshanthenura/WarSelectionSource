local parameter = getEditingModParameter()
table.insert(parameter.list, {"optionName", "New option"})
editParameterData(parameter)
onParameterUpdated()
editingVariant = #parameter.list
interface.nodes[117].widget_value = editingVariant - 1
editParameterVariant(parameter)
