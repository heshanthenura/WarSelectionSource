local data = {
  reason = getParameter("reason"),
  text = getParameter("text")
}
log("Session closed with reason " .. data.reason)
root.interface.f_sendEvent("sessionClose", toJson(data))
