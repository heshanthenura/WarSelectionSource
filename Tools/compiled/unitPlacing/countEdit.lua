local data = {
  value = tonumber(interface.nodes[7].widget_text),
  step = 1,
  min = 1,
  max = 100
}
root.interface[toolsInterface].f_sendEvent("numberStart", toJson(data))
root.interface[factionsInterface].active = false
root.interface[unitTypesInterface].active = false
