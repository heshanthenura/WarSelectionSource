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

function startLoadingPrivateConfigDraft(code, version)
  loadingConfigDraft = true
  assert(mapConfigLoading == nil)
  local filename = code .. ".cfg"
  local filenameStore = code .. "_" .. version .. ".cfg"
  mapConfigLoading = root.system_loader.f_add("https://map-download.warselect.io/" .. filename, "maps/" .. filenameStore, false, 0, 0, false)
  privateDraftMode = true
  log("Start request \"map config\", draftmode")
end

function startLoadingPrivateConfigRelease(code, version)
  loadingConfigDraft = false
  assert(mapConfigLoading == nil)
  local filename = "release/" .. code .. "_" .. version .. ".cfg"
  mapConfigLoading = root.system_loader.f_add("https://map-download.warselect.io/" .. filename, "maps/" .. filename, false, 0, 0, false)
  privateDraftMode = false
  log("Start request \"map config\", releasemode")
end

function disablePanel()
  local nodes = interface.nodes
  root.interface[parentInterface].f_sendEvent("disablePanel", "")
  nodes[1].disabled = true
end

function enablePanel()
  local nodes = interface.nodes
  nodes[1].disabled = false
  root.interface[parentInterface].f_sendEvent("enablePanel", "")
end

function startUploadModsInfo()
  local codes = {}
  local addCodes = function(container)
    for i = 1, #container do
      local item = container[i]
      if type(item) == "table" then
        table.insert(codes, string.sub(item[1], 1, 11))
      elseif type(item) == "string" then
        table.insert(codes, string.sub(item, 1, 11))
      end
    end
  end
  addCodes(startSinglePrivateData.make.scriptsG)
  addCodes(startSinglePrivateData.make.scriptsV)
  modsListUpload = createUpload("https://mods-api.warselect.io/listByCodes")
  createUploadPostParameter(modsListUpload, "ids", toJson(codes))
  startUploading(modsListUpload, "mods list")
end

function showError(text)
  root.interface.f_sendEvent("showError", text)
end

function splitString(inputstr, sep)
  if sep == nil then
    sep = ","
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

function getVersionArray()
  local v = splitString(root.f_version(false))
  return {
    tonumber(v[1]),
    v[6],
    tonumber(v[2]),
    tonumber(v[3]),
    v[4],
    tonumber(v[5])
  }
end
