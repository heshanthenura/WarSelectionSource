if getParameter("parent") ~= nil then
  parentInterface = getParameter("parent")
end

function createUploadPostParameter(uploading, name, value)
  assert(uploading ~= nil)
  local post = root.system_upload[uploading].postParams
  local p = post[post.f_create()]
  p.name = name
  p.value = value
end

function createUpload(url)
  return root.system.upload.f_add(url, 60)
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

function getCustomMapCodeFromClipboard()
  local code = root.system_clipboard_get
  local a = string.find(code, "map-")
  if a == nil then
    return nil
  end
  code = string.sub(code, a + 4)
  if #code ~= 8 then
    return nil
  end
  for i = 1, 8 do
    local ch = string.byte(code, i)
    if (not (97 <= ch) or not (ch <= 102)) and (not (65 <= ch) or not (ch <= 70)) and (not (48 <= ch) or not (ch <= 57)) then
      return nil
    end
  end
  return code
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

function showError(text)
  root.interface.f_sendEvent("showError", text)
end
