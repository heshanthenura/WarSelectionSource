local nodes = interface.nodes
local id = nodes[83].widget_value
if id == nil then
  return
end
local envTag = nodes[83].widget_lines[id]
if envTag == nil then
  return
end
local p = envTag:find("-")
if p == nil then
  return
end
local envId = tonumber(envTag:sub(1, p - 2))
local envName = envTag:sub(p + 2)
nodes[18].widget_lines.f_create("100p " .. envTag)
table.insert(envsList, {
  envId,
  envName,
  100
})
nodes[116].visible = false
updateProb()
