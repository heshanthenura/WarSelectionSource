local command = getCommands()
if command == nil then
  return
end
local f = tonumber(getParameter("f"))
local nodes = interface.nodes
if f == 0 then
  nodes[1319].visible = false
  nodes[1389].visible = true
  command.f_setFormation(3, 7680)
else
  nodes[1319].visible = true
  nodes[1389].visible = false
  command.f_setFormation(3, 15000)
end
