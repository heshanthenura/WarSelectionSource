local error = getParameter("error")
log("Server errCode: " .. error)
root.interface.f_sendEvent("serverError", tostring(error))
