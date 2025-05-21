local command = getCommands()
if command == nil then
  return
end
local button = tonumber(getParameter("button"))
local data = massUpdate[button]
if data == nil then
  return
end
local amount = data[3]
if 500 < amount then
  amount = 500
end
command.f_workAdd(data[1], data[2], amount, false)
