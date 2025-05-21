local command = getCommands()
if command == nil then
  return
end
command.attackPriorityChange = tonumber(getParameter("priority"))
