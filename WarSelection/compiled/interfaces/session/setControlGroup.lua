local command = getCommands()
if command == nil then
  return
end
command.f_controlGroup(tonumber(getParameter("group")), false)
