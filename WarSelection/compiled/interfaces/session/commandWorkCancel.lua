local command = getCommands()
if command == nil then
  return
end
local amount = 1
if interface.hotKeys.f_check(removeWorkMassHotKey) or getParameter("max") ~= nil then
  amount = 0
end
command.f_workCancel(currentSelectionUnitTypes[currentSelectionUnitType][1], tonumber(getParameter("queuePos")), amount)
