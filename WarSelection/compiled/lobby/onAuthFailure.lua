local reason = tonumber(getParameter("reason"))
log("Auth problem reason " .. reason)
root.interface.f_sendEvent("lobbyAuthFailure", tostring(reason))
