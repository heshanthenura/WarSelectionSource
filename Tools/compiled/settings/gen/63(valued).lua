local value = getParameter("value")
root.storage.f_set("notVolFow", 1 - value)
local nodes = interface.nodes
root.interface.f_sendEvent("changeGraphics", tostring(nodes[23].widget_value))
