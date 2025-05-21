if matchesListUpload ~= nil then
  local upload = root.system_upload[matchesListUpload]
  if upload.done then
    local j = uploadCheck(matchesListUpload, "Upload matches list", localize("<*errorCantLoadMatchesList>"))
    local version = root.f_version()
    version = string.sub(version, 1, string.find(version, "_") - 1)
    matchesListUpload = nil
    local nodes = interface.nodes
    nodes[8].visible = false
    if j ~= nil then
      mathcesList = {}
      nodes[4].visible = true
      nodes[7].visible = false
      local json = {}
      local lines = nodes[5].widget_lines
      lines.f_clear()
      if j.data ~= nil and #j.data > 0 then
        for _, o in ipairs(j.data) do
          local ver = ""
          if o.version ~= nil then
            local p = string.find(o.version, "_")
            if p ~= nil then
              ver = string.sub(o.version, 1, p - 1)
            end
          end
          o.actualVersion = ver == version
          table.insert(mathcesList, o)
          local j = fromJson(o.matchData)
          local duration = 0
          local mode
          if j ~= nil then
            if j.duration ~= nil then
              duration = j.duration
            end
            if j.mode ~= nil then
              mode = j.mode
            end
          end
          if mode == nil then
            mode = modeNamePrivate
          else
            mode = modeNames[mode + 1]
          end
          lines.f_create(tagReplayListString[1] .. "rep-" .. o.replay .. tagReplayListString[2] .. root.system.f_timeToStr(o.start) .. tagReplayListString[3] .. mode .. tagReplayListString[4] .. o.players .. tagReplayListString[5] .. toTimeStr(duration) .. tagReplayListString[6])
          table.insert(json, {
            "rep-" .. o.replay
          })
        end
        if sendReplaysAddr ~= nil then
          replaysListUpload = createUpload(sendReplaysAddr)
          createUploadPostParameter(replaysListUpload, "data", toJson(j.data))
          startUploading(replaysListUpload, "Replays list sending")
        end
      end
    end
  end
end
if replayLoading ~= nil and root.system_loader.f_check(replayLoading) then
  replayLoading = nil
  root.interface[parentInterface].f_sendEvent("enablePanel", "")
  interface.nodes[8].visible = false
  root.interface[parentInterface].f_sendEvent("replayChoosen", toJson({
    file = "loadings/replays/" .. loadingReplayFile,
    code = loadingReplayCode
  }))
end
