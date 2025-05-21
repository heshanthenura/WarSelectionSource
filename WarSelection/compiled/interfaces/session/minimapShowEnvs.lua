if not root.interface_minimap_scripts_ready then
  return
end
if not root.interface_bigminimap_scripts_ready then
  return
end
minimapShowEnvs = not minimapShowEnvs
local data = {
  on = minimapShowEnvs,
  layer = "envs"
}
root.interface.f_sendEvent("minimapLayer", toJson(data))
root.storage.f_set("minimapShowEnvs", minimapShowEnvs)
