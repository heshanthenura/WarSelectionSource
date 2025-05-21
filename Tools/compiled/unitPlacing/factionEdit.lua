local faction = tonumber(interface.nodes[10].widget_text)
root.interface[factionsInterface].active = true
root.interface[factionsInterface].f_sendEvent("setFaction", tostring(faction))
root.interface[unitTypesInterface].active = false
root.interface[toolsInterface].f_sendEvent("cancel", "")
