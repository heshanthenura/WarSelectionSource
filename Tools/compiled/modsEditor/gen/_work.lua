if saveTime ~= nil then
  local nodes = interface.nodes
  if os.time() >= saveTime then
    saveTime = nil
    nodes[4].disabled = false
    nodes[47].visible = false
    nodes[35].visible = false
    nodes[36].visible = false
  else
    nodes[47].widget_text = saveTime - os.time()
  end
end
if currentUpload ~= nil then
  local upload = root.system_upload[currentUpload]
  if upload.done then
    local j = uploadCheck(currentUpload, currentUploadInfo)
    currentUpload = nil
    local nodes = interface.nodes
    nodes[37].visible = false
    if currentUploadInfo == "Save mod" then
      if j ~= nil and j.error == 0 then
        log("mod-" .. editingModCode .. " saved")
        local mod = getEditingMod()
        nodes[53].visible = false
        nodes[36].visible = true
        nodes[54].visible = true
        mod.canSave = nil
        if mod.draft then
          canSaveSum = canSaveSum - 1
          nodes[57].visible = 0 < canSaveSum
        end
        mod.canRelease = true
        mod.version = mod.version + 1
        canReleaseSum = canReleaseSum + 1
        nodes[56].visible = true
        nodes[66].widget_text = mod.version
      else
        nodes[35].visible = true
      end
    elseif currentUploadInfo == "Release mod" then
      if j ~= nil and j.error == 0 then
        log("mod-" .. editingModCode .. " released")
        nodes[54].visible = false
        nodes[34].visible = true
        getEditingMod().canRelease = nil
        canReleaseSum = canReleaseSum - 1
        nodes[56].visible = 0 < canReleaseSum
      else
        nodes[33].visible = true
      end
    elseif currentUploadInfo == "Mods info" and j ~= nil and j.error == 0 then
      for _, modData in ipairs(j.list) do
        local mod = modsList[modData.code]
        mod.type = modData.type
        mod.canRelease = mod.draft and modData.releaseData ~= nil and modData.version ~= modData.releaseData.version
        mod.version = modData.version
        if mod.canRelease then
          canReleaseSum = canReleaseSum + 1
          nodes[56].visible = true
        end
        if mod.draft then
          mod.name = modData.name
          mod.description = modData.description
          mod.parameters = fromJson(modData.parameters)
        else
          mod.name = modData.releaseData.name
          mod.description = modData.releaseData.description
          mod.parameters = fromJson(modData.parameters)
        end
        if mod.parameters == nil then
          mod.parameters = {}
        end
      end
      updateModsLists(false)
    end
  end
end
if iAmDeveloper then
  local processLog = function(messages, data, lines)
    local list = messages.list
    local newSize = list.size
    if newSize == 0 then
      return false
    end
    local newTotalCount = messages.totalCount
    local added = newTotalCount - data.totalCount
    if added > messages.maxMessages then
      added = messages.maxMessages
    end
    local newCount = list[newSize - 1].count
    if added == 0 and newCount == data.count then
      return false
    end
    
    function makeText(message)
      if message.count == 1 then
        return message.text
      else
        return "[" .. message.count .. "] " .. message.text
      end
    end
    
    local startId = newSize - added
    if 0 < startId then
      local m = list[startId - 1]
      local s = makeText(m)
      if lines.size == 0 then
        if 1 < m.count then
          data.lastMessagePos = 0
          lines.f_create(s)
        end
      else
        lines[data.lastMessagePos] = s
      end
    end
    if 0 < added then
      for i = startId, newSize - 1 do
        data.lastMessagePos = lines.size
        lines.f_create(makeText(list[i]))
      end
    end
    data.totalCount = newTotalCount
    data.count = newCount
    return true
  end
  local nodes = interface.nodes
  if processLog(root.session.gameplay.gameplay.scripts.scripts.messages, logMesagesG, nodes[50].widget.lines) and (not nodes[46].visible or not nodes[77].visible) then
    haveNewMessagesG = true
    nodes[73].visible = true
    nodes[65].visible = true
  end
  if processLog(root.session.visual.script.scripts.messages, logMesagesV, nodes[26].widget.lines) and (not nodes[46].visible or not nodes[71].visible) then
    haveNewMessagesV = true
    nodes[73].visible = true
    nodes[63].visible = true
  end
end
