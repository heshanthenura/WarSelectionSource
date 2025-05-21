if mapsMyListUpload ~= nil then
  local uploadMy = root.system_upload[mapsMyListUpload]
  if uploadMy.done then
    local j = uploadCheck(mapsMyListUpload, "Upload my maps list", localize("<*errorCantLoadMapsList>"))
    mapsMyListUpload = nil
    local nodes = interface.nodes
    nodes[20].visible = false
    nodes[23].disabled = false
    if j ~= nil and j.list ~= nil and #j.list > 0 then
      nodes[36].visible = true
      nodes[34].visible = false
      nodes[32].visible = false
      local lines = nodes[33].widget_lines
      lines.f_clear()
      for i = 1, #j.list do
        local v = j.list[i]
        lines.f_create("map-" .. v[1] .. " " .. v[2])
      end
    end
  end
end
if unlistMapUpload ~= nil then
  local upload = root.system_upload[unlistMapUpload]
  if upload.done then
    local nodes = interface.nodes
    local j = uploadCheck(unlistMapUpload, "Unload map", localize("<*errorCantUnloadMap>"))
    unlistMapUpload = nil
    cannotRequestMaps = false
    startMapsListUpload()
    nodes[23].visible = false
    nodes[23].disabled = false
  end
end
