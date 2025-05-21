local scripts = root.interface[unitTypesInterface].scripts
if scripts == nil or not scripts.ready then
  return
end
root.interface[factionsInterface].active = false
root.interface[unitTypesInterface].f_sendEvent("editUnitType", "")
root.interface[toolsInterface].f_sendEvent("cancel", "")
