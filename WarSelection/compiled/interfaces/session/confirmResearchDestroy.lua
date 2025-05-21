local command = getCommands()
if command == nil then
  return
end
local nodes = interface.nodes
nodes[1218].visible = false
for _, v in ipairs(researchDestroyList) do
  command.f_selectTempByType(v)
  command.f_kill()
  sendAgeCommand = true
end
