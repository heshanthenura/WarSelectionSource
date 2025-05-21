local value = getParameter("value")
if value == 0 then
  value = 255
else
  value = value - 1
end
local json = {cmd = 5, team = value}
root.lobby.f_sendCommand(16, toJson(json))
