local command = getCommands()
if command == nil then
  return
end
local clearTasks = not interface.hotKeys.f_check(addTaskHotKey)
command.f_gatherLastTask(clearTasks)
