if getParameter("extraData") == nil then
  return
end
local data = fromJson(getParameter("extraData"))
if data.interface ~= nil then
  local ifData = fromJson(data.data)
  if ifData == nil then
    ifData = {}
  end
  ifData.content = getParameter("content")
  root.interface[data.interface].f_sendEvent("fileEdited", toJson(ifData))
end
