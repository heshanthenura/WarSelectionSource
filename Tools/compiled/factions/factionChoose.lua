local faction = tonumber(getParameter("button")) - 1
assert(faction < 64)
setFaction(faction)
root.interface[parentInterface].f_sendEvent("onFactionChoose", tostring(faction))
