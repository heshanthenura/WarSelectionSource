local reason = tonumber(getParameter("reason"))
log("Disconnect from lobby. Reason: " .. reason)
if reason == 0 then
  log("Auth failed")
  root.f_exit()
end
root.interface.f_sendEvent("lobbyDisconnect", tostring(reason))
