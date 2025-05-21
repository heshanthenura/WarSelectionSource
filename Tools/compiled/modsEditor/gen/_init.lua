local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end

function extractCode(s)
  local startPos, endPos = string.find(s, "/")
  if startPos then
    s = string.sub(s, endPos + 1)
  end
  return string.sub(s, 1, 11)
end

function updateModsLists(onlyOwn)
  local nodes = interface.nodes
  local mapData = root.session_gameplay_gameplay_scene[0].mapData
  local modsGameplay = mapData.modsGameplay
  local modsVisual = mapData.modsVisual
  local initModesList = function(node, mods)
    local lines = node.lines
    lines.f_clear()
    node.hideEmptyLines = true
    for i = 0, mods.size - 1 do
      local file = mods[i].file
      local code = extractCode(file)
      local mod = modsList[code]
      local str = "mod-" .. code .. " " .. mod.name
      if mod.draft then
        lines.f_create("* " .. str)
      elseif not onlyOwn then
        lines.f_create(str)
      else
        lines.f_create()
      end
    end
  end
  initModesList(nodes[12].widget, modsGameplay)
  initModesList(nodes[8].widget, modsVisual)
end

function setCanSave(modCode)
  local nodes = interface.nodes
  local mod = modsList[modCode]
  if not mod.canSave then
    mod.canSave = true
    if mod.draft then
      canSaveSum = canSaveSum + 1
      nodes[57].visible = true
    end
  end
  if editingModCode == modCode then
    nodes[53].visible = true
  end
  nodes[18].visible = true
  nodes[35].visible = false
end

function onParameterUpdated()
  getEditingMod().parametersUpdated = true
  setCanSave(editingModCode)
end

function editParameterVariant(parameter)
  local var = parameter.list[editingVariant]
  local nodes = interface.nodes
  nodes[94].widget_text_text = var[1]
  nodes[118].widget_text_text = var[2]
  nodes[96].widget_checked = var[1] == parameter.default
end

function toBool(v)
  if type(v) == "boolean" then
    return v
  end
  if type(v) == "number" then
    return v ~= 0
  end
  if type(v) == "string" then
    if v == "true" then
      return true
    end
    local n = tonumber(v)
    return n ~= nil and n ~= 0
  end
  return false
end

function editParameterData(parameter)
  local nodes = interface.nodes
  nodes[95].visible = false
  nodes[107].visible = false
  nodes[106].visible = false
  nodes[87].visible = false
  if parameter.type == 0 then
    nodes[95].visible = true
    local lines = nodes[117].widget_lines
    lines.f_clear()
    for _, var in ipairs(parameter.list) do
      lines.f_create(var[2])
    end
    nodes[117].widget_value = 0
    editingVariant = 1
    editParameterVariant(parameter)
    nodes[86].visible = #parameter.list > 1
  elseif parameter.type == 1 then
    nodes[107].visible = true
    nodes[81].widget_text_text = parameter.min
    nodes[82].widget_text_text = parameter.max
    nodes[79].widget_text_text = parameter.default
  elseif parameter.type == 2 then
    nodes[106].visible = true
    nodes[89].widget_text_text = parameter.min
    nodes[85].widget_text_text = parameter.max
    nodes[80].widget_text_text = parameter.default
  elseif parameter.type == 3 then
    nodes[87].visible = true
    nodes[99].widget_checked = toBool(parameter.default)
  end
end

function updateModParameters(mod)
  local nodes = interface.nodes
  local lines = nodes[92].widget_lines
  lines.f_clear()
  for _, parameter in ipairs(mod.parameters) do
    lines.f_create(parameter.name)
  end
  nodes[122].visible = false
end

function getEditingMod()
  return modsList[editingModCode]
end

function getEditingModParameter()
  return getEditingMod().parameters[editingParameterId]
end

function modShow(modName, fileName, modType)
  editingModName = modName
  editingFileName = fileName
  editingModCode = extractCode(fileName)
  local mod = getEditingMod()
  editingOwnFile = mod.draft
  editingModType = modType
  local nodes = interface.nodes
  nodes[13].visible = true
  nodes[19].visible = editingOwnFile
  nodes[14].visible = not editingOwnFile
  nodes[66].widget_text = mod.version
  if editingOwnFile then
    nodes[22].widget_text_text = mod.name
    nodes[23].widget_text_text = mod.description
    if mod.newName ~= nil then
      nodes[22].widget_text_text = mod.newName
    end
    if mod.newDescription ~= nil then
      nodes[23].widget_text_text = mod.newDescription
    end
    nodes[53].visible = false
    nodes[54].visible = false
    nodes[34].visible = false
    nodes[36].visible = false
    if mod.canSave then
      nodes[53].visible = true
      nodes[35].visible = false
    elseif mod.canRelease then
      nodes[54].visible = true
      nodes[33].visible = false
    end
    updateModParameters(mod)
  else
    nodes[16].widget_text = mod.name
    nodes[15].widget_text = mod.description
    nodes[18].visible = mod.canSave
  end
end

function createUploadPostParameter(name, value, compressed)
  assert(currentUpload ~= nil)
  local post = root.system_upload[currentUpload].postParams
  local p = post[post.f_create()]
  p.name = name
  p.value = value
  if compressed then
    p.compressionLevel = 1
  end
end

function createUpload(command, info)
  local nodes = interface.nodes
  nodes[37].visible = true
  assert(currentUpload == nil)
  currentUpload = root.system_upload.f_add("https://mods-api.warselect.io/" .. command, 60)
  createUploadPostParameter("accountKey", root.lobby.f_makeAccountKey(1))
  currentUploadInfo = info
end

function startUploading()
  assert(currentUpload ~= nil)
  root.system_upload[currentUpload].f_start()
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
        log(logProcessStr .. " error")
        log(upload.result)
        if outErrorText ~= nil then
          showError(outErrorText .. ": " .. upload.result)
        end
      end
    else
      log(logProcessStr .. " result format error")
      log(upload.result)
      if outErrorText ~= nil then
        showError(outErrorText .. ": " .. upload.result)
      end
    end
  else
    log(logProcessStr .. " request failed")
    if outErrorText ~= nil then
      showError(outErrorText .. ": " .. "the request failed")
    end
  end
  root.system_upload.f_remove(uploadId)
  return res
end

function loadModsInfo()
  local codes = {}
  local addCodes = function(container, modType)
    for i = 0, container.size - 1 do
      local item = container[i].file
      local code
      local draft = string.sub(item, 1, 6) == "draft/"
      if draft then
        code = string.sub(item, 7, 17)
      else
        code = string.sub(item, 1, 11)
      end
      table.insert(codes, code)
      if modsList[code] ~= nil and modsList[code].draft then
        draft = true
      end
      modsList[code] = {
        draft = draft,
        name = code,
        description = "",
        type = modType
      }
    end
  end
  addCodes(root.session_gameplay_gameplay_scene[0].mapData_modsGameplay, 0)
  addCodes(root.session_gameplay_gameplay_scene[0].mapData_modsVisual, 1)
  createUpload("listByCodes", "Mods info")
  createUploadPostParameter("ids", toJson(codes))
  startUploading()
end
