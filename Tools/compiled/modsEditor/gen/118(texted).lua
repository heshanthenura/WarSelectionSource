local parameter = getEditingModParameter()
local txt = getParameter("text")
parameter.list[editingVariant][2] = txt
interface.nodes[117].widget_lines[editingVariant - 1] = txt
local x = interface.nodes[117].widget_lines[editingVariant - 1]
onParameterUpdated()
