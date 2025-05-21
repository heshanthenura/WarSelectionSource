local value = getParameter("value")
if value == 0 then
  interface.nodes[tonumber(getParameter("widget"))].widget_checked = true
else
  local parameter = getEditingModParameter()
  parameter.default = parameter.list[editingVariant][1]
  onParameterUpdated()
end
