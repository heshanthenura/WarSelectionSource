local nodes = interface.nodes
local val = tonumber(getParameter("text"))
if val == nil then
  return
end
local mod = getEditingMod()
local parameter = mod.parameters[editingParameter]
if val < parameter.min then
  return
end
if val > parameter.max then
  return
end
setParameter(val)
