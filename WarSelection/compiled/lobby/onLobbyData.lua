local data = fromJson(getParameter("data"))
local code = data.dataCode
if code == nil then
  code = 0
end
data.dataCode = nil
local d = {data = data, code = code}
root.interface.f_sendEvent("lobbyData", toJson(d))
