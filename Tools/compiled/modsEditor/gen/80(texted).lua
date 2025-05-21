local parameter = getEditingModParameter()
local txt = getParameter("text")
local l = string.len(txt)
if l < parameter.min then
  return
end
if l > parameter.max then
  return
end
parameter.default = txt
onParameterUpdated()
