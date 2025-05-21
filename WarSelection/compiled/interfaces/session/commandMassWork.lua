local command = getCommands()
if command == nil then
  return
end
command.selectTempByTags = tonumber(getParameter("tags"))
command.f_workAdd(65535, 0, 500)
