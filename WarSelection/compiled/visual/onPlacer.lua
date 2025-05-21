local interface = getParameter("interface")
local data = getParameters()
data.interface = nil
root.interface[interface].f_sendEvent("onPlacer", toJson(data))
