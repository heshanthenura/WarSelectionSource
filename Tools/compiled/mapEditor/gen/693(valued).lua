local nodes = interface.nodes
editingParameter = getParameter("value") + 1
local mod = getEditingMod()
local parameter = mod.parameters[editingParameter]
nodes[690].visible = true
nodes[722].visible = false
nodes[721].visible = false
nodes[727].visible = false
nodes[595].visible = false
local desc = parameter.desc
if desc == nil then
  desc = ""
end
nodes[97].widget.f_setText(desc)
local parameterValue
if mod.parametersParsed ~= nil then
  parameterValue = mod.parametersParsed[parameter.name]
end
if parameterValue == nil then
  parameterValue = parameter.default
end
if parameter.type == 0 then
  nodes[722].visible = true
  local w = nodes[724].widget
  local lines = w.lines
  lines.f_clear()
  for _, p in ipairs(parameter.list) do
    lines.f_create(p[2])
  end
  w.value = tonumber(parameterValue)
elseif parameter.type == 1 then
  nodes[721].visible = true
  nodes[766].widget_text_text = parameterValue
  nodes[768].widget_text = parameter.min
  nodes[769].widget_text = parameter.max
elseif parameter.type == 2 then
  nodes[727].visible = true
  nodes[738].widget_text_text = parameterValue
  nodes[760].widget_text = parameter.min
  nodes[758].widget_text = parameter.max
elseif parameter.type == 3 then
  nodes[595].visible = true
  nodes[263].widget_checked = toBool(parameterValue)
end
