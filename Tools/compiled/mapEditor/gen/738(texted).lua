local nodes = interface.nodes
local val = tonumber(getParameter("text"))
if val == nil then
  return
end
local mod = getEditingMod()
local parameter = mod.parameters[editingParameter]
local len = string.len(val)
if len < parameter.min then
  return
end
if len > parameter.max then
  return
end
setParameter(val)
