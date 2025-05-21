if mapsMyListUpload ~= nil then
  assert(mapsPopListUpload ~= nil)
  local uploadMy = root.system_upload[mapsMyListUpload]
  local uploadPop = root.system_upload[mapsPopListUpload]
  if uploadMy.done and uploadPop.done then
    local j1 = uploadCheck(mapsMyListUpload, "Upload my maps list", localize("<*errorCantLoadMapsList>"))
    local j2 = uploadCheck(mapsPopListUpload, "Upload pop maps list", localize("<*errorCantLoadMapsList>"))
    mapsMyListUpload = nil
    mapsPopListUpload = nil
    local nodes = interface.nodes
    nodes[4].visible = false
    if j1 ~= nil and j1.list ~= nil and #j1.list > 0 then
      local lines = nodes[5].widget_lines
      lines.f_clear()
      for i = 1, #j1.list do
        local v = j1.list[i]
        lines.f_create("map-" .. v[1] .. " " .. v[2])
      end
    end
    if j2 ~= nil and j2.list ~= nil and #j2.list > 0 then
      local w = nodes[6].widget
      local lines = w.lines
      lines.f_clear()
      for i = 1, #j2.list do
        local v = j2.list[i]
        lines.f_create("map-" .. v[1] .. " " .. v[2])
      end
      w.f_showLine(0)
    end
  end
end
