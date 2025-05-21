local value = getParameter("value")
root.storage.f_set("bordersScroll", value)
root.interface.f_sendEvent("setBordersScroll", tostring(value))
