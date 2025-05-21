local eventName = getParameter("name")
if eventName == "setBordersScroll" then
  bordersScroll = getParameter("data") == "1"
  return
end
if eventName == "setCameraFastMove" then
  fastMove = tonumber(getParameter("data"))
  return
end
if eventName == "getHotKeysRequest" then
  local requester = tonumber(getParameter("data"))
  root.interface[requester].f_sendEvent("getHotKeysResult", hotKeysResult)
end
