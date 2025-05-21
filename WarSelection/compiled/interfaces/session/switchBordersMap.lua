if not root.interface_minimap_scripts_ready then
  return
end
if not root.interface_bigminimap_scripts_ready then
  return
end
borderMapState = not borderMapState
local data = {
  on = borderMapState,
  layer = "factions"
}
root.interface.f_sendEvent("minimapLayer", toJson(data))
if borderMapState then
  root.session_visual_scene[0].factionsMap.f_update(100)
end
root.storage.f_set("minimapShowFactions", borderMapState)
