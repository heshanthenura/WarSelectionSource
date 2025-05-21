local nodes = interface.nodes
editingParameterId = getParameter("value") + 1
local parameter = getEditingModParameter()
nodes[122].visible = true
nodes[78].widget_text_text = parameter.name
nodes[124].widget_text_text = parameter.desc
nodes[88].widget_value = parameter.type
editParameterData(parameter)
