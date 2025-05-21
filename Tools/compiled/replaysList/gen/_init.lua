editorMode = root.project ~= nil
tagReplayListString = {
  localize("<*replayListString/0>"),
  localize("<*replayListString/1>"),
  localize("<*replayListString/2>"),
  localize("<*replayListString/3>"),
  localize("<*replayListString/4>"),
  localize("<*replayListString/5>")
}
strTimeH0 = localize("<*timerHour/0>")
strTimeH1 = localize("<*timerHour/1>")
strTimeH2 = localize("<*timerHour/2>")
strTimeD0 = localize("<*timerDay/0>")
strTimeD1 = localize("<*timerDay/1>")
strTimeD2 = localize("<*timerDay/2>")
strTimeD3 = localize("<*timerDay/3>")
strTimeL0 = localize("<*timerLong/0>")
strTimeL1 = localize("<*timerLong/1>")
strTimeL2 = localize("<*timerLong/2>")
modeNamePrivate = localize("<*gameModePrivate>")
modeNames = {
  localize("<*gameModeMultiFFA>"),
  localize("<*gameModeMultiTeam>"),
  "",
  localize("<*gameModeSurvival>"),
  localize("<*gameModeMultyRate1x1>"),
  localize("<*gameModeMultyRate2x2>"),
  localize("<*gameModeSandbox>"),
  localize("<*gameModeTugOfWar>"),
  localize("<*gameModeCustomMap>"),
  "???"
}

function toTimeStr(value)
  if value < 3600 then
    local min = value // 60
    local sec = value % 60
    return string.format(strTimeH0 .. "%u" .. strTimeH1 .. "%02d" .. strTimeH2, min, sec)
  end
  if value < 86400 then
    local hour = value // 3600
    local min = value % 3600 // 60
    local sec = value % 60
    return string.format(strTimeD0 .. "%u" .. strTimeD1 .. "%02d" .. strTimeD2 .. "%02d" .. strTimeD3, hour, min, sec)
  end
  local day = value // 86400
  local hour = value % 86400 // 3600
  return string.format(strTimeL0 .. "%u" .. strTimeL1 .. "%02d" .. strTimeL2, day, hour)
end

function createUpload(url)
  return root.system.upload.f_add(url, 60)
end

function createUploadPostParameter(uploading, name, value)
  assert(uploading ~= nil)
  local post = root.system_upload[uploading].postParams
  local p = post[post.f_create()]
  p.name = name
  p.value = value
end

function startUploading(uploading, logText)
  assert(uploading ~= nil)
  root.system_upload[uploading].f_start()
  if logText == nil then
    log("Start request")
  else
    log("Start request \"" .. logText .. "\"")
  end
end

function showError(text)
  root.interface.f_sendEvent("showError", text)
end

function uploadCheck(uploadId, logProcessStr, outErrorText)
  assert(uploadId ~= nil)
  local upload = root.system_upload[uploadId]
  local res
  if upload.success then
    local data = fromJson(upload.result)
    if data ~= nil then
      if data.error == 0 then
        res = data
      else
        log(logProcessStr .. " er_ror")
        log(upload.result.description)
        if outErrorText ~= nil then
          showError(outErrorText .. upload.result)
        end
      end
    else
      log(logProcessStr .. " result format er_ror")
      log(upload.result)
      if outErrorText ~= nil then
        showError(outErrorText .. upload.result)
      end
    end
  else
    log(logProcessStr .. " request failed")
    if outErrorText ~= nil then
      showError(outErrorText .. "the request failed")
    end
  end
  root.system_upload.f_remove(uploadId)
  return res
end

function startLoadingReplay(replayCode)
  local a = string.find(replayCode, "rep-")
  if a == nil then
    return false
  end
  local code, file
  if 12 <= #replayCode and #replayCode <= 14 then
    code = string.sub(replayCode, a + 4, a + 11)
    file = code .. ".rep"
  else
    code = string.sub(replayCode, a + 4, a + 14)
    if not isValidBase62(code) then
      return false
    end
    local hex = root.functions_transcoding.f_toHex(root.functions_transcoding.f_fromBase62(code))
    file = hex .. ".rep"
  end
  if #code ~= 8 and #code ~= 11 then
    return false
  end
  loadingReplayFile = file
  loadingReplayCode = code
  replayLoading = root.system_loader.f_add("https://replay-files.warselect.io/" .. loadingReplayFile, "loadings/replays/" .. loadingReplayFile, false, 0, 0, false)
  root.interface[parentInterface].f_sendEvent("disablePanel", "")
  return true
end

function isValidBase62(str)
  if str == nil or str == "" then
    return false
  end
  for i = 1, #str do
    local char = str:sub(i, i)
    if not char:match("[0-9]") and not char:match("[a-z]") and not char:match("[A-Z]") then
      return false
    end
  end
  return true
end
