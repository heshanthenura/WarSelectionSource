local nodes = interface.nodes
if saveTime ~= nil then
  if os.time() >= saveTime then
    saveTime = nil
    nodes[22].disabled = false
    nodes[271].visible = false
  else
    nodes[271].widget_text = saveTime - os.time()
  end
end
local vScene = root.session_visual_scene[0]
if nodes[182].visible then
  local placer = vScene.placer_positionActual
  local x = math.floor(placer.x * 256)
  local y = math.floor(placer.y * 256)
  local landscape = root.session_gameplay_gameplay_scene[0].landscape
  if landscape.f_inRange(x, y) then
    nodes[186].widget_text = vScene.landscape.f_getTexture(x, y)
    nodes[184].widget_text = vScene.landscape.f_getAngle(x, y)
    nodes[188].widget_text = landscape.f_getHeight(x, y) // 256
  end
end
if modUpload ~= nil then
  local upload = root.system_upload[modUpload]
  if upload.done then
    log("Uploading '" .. currentModsUploadInfo .. "' done")
    nodes[435].visible = false
    if upload.success then
      local data = fromJson(upload.result)
      root.system_upload.f_remove(modUpload)
      modUpload = nil
      if data == nil then
        log("Mod upload error:")
        log(upload.result)
        showError(upload.result)
      elseif data.error == 0 then
        if currentModsUploadInfo == "Mod info" then
          assert(modsTable[data.code] == nil)
          if data.releaseData ~= nil or data.author == root.lobby.accountLocalId then
            if data.releaseData == nil then
              notReleasedAttached = notReleasedAttached + 1
              nodes[470].visible = true
            end
            local mods, lines
            if data.type == 0 then
              mods = modsG
              lines = nodes[92].widget_lines
            else
              mods = modsV
              lines = nodes[8].widget_lines
            end
            nodes[306].visible = false
            markMapNotSaved()
            if data.releaseData == nil then
              modsTable[data.code] = {
                parametersStr = "",
                parameters = fromJson(data.parameters),
                name = data.name,
                description = data.description,
                type = data.type,
                version = data.version
              }
              table.insert(mods, {
                data.code .. "_0",
                ""
              })
            else
              modsTable[data.code] = {
                parametersStr = "",
                parameters = fromJson(data.releaseData.parameters),
                name = data.name,
                description = data.description,
                type = data.type,
                releaseVersion = data.releaseData.version,
                version = data.version
              }
              table.insert(mods, {
                data.code .. "_" .. data.releaseData.version,
                ""
              })
            end
            lines.f_create("mod-" .. data.code .. " " .. modsTable[data.code].name)
            nodes[504].visible = true
            nodes[501].widget_text = modsTable[data.code].name
            nodes[502].widget_text = modsTable[data.code].description
            nodes[330].visible = false
            nodes[210].visible = true
          else
            showError(localize("<*modAlertNotPublished>"))
          end
        elseif currentModsUploadInfo == "Create mod" then
          nodes[434].visible = false
          startMyModsListUpload()
        elseif currentModsUploadInfo == "Attached mods" then
          hasModNewVersion = 0
          for _, data in ipairs(data.list) do
            local mod = modsTable[data.code]
            assert(mod ~= nil)
            mod.type = data.type
            if data.releaseData ~= nil then
              mod.name = data.releaseData.name
              mod.description = data.releaseData.description
              mod.parameters = fromJson(data.releaseData.parameters)
              mod.releaseVersion = data.releaseData.version
              if mod.version ~= mod.releaseVersion then
                hasModNewVersion = hasModNewVersion + 1
              end
            else
              mod.name = data.name
              mod.description = data.description
              mod.parameters = fromJson(data.parameters)
              notReleasedAttached = notReleasedAttached + 1
              nodes[470].visible = true
            end
          end
          nodes[536].visible = 0 < hasModNewVersion
          local linesG = nodes[92].widget_lines
          local linesV = nodes[8].widget_lines
          local addCodes = function(container, lines, mustType)
            lines.f_clear()
            for i, modData in ipairs(container) do
              local code = string.sub(modData[1], 1, 11)
              local mod = modsTable[code]
              if mod.name == nil or mod.type ~= mustType then
                table.remove(container, i)
                return false
              end
              lines.f_create("mod-" .. code .. " " .. mod.name)
            end
            return true
          end
          while not addCodes(modsG, linesG, 0) do
          end
          while not addCodes(modsV, linesV, 1) do
          end
          startMyModsListUpload()
        elseif currentModsUploadInfo == "My mods" then
          nodes[416].visible = false
          nodes[534].visible = false
          myMods = {}
          if data ~= nil and data.list ~= nil and 0 < #data.list then
            for i = 1, #data.list do
              local v = data.list[i]
              local m = {
                code = v.code,
                name = v.name,
                description = v.description,
                type = v.type,
                released = v.releaseData ~= nil
              }
              table.insert(myMods, m)
            end
          end
          updateMyModsLists()
        end
      elseif data.error == 2 then
        showError(localize("<*modAlertDoesNotExist>"))
      else
        showError(data.error .. " - " .. data.description)
      end
    else
      showError("Mod uploading: " .. upload.result)
      root.system_upload.f_remove(modUpload)
      modUpload = nil
      if currentModsUploadInfo == "My mods" then
        nodes[534].visible = true
        nodes[439].visible = false
        nodes[469].visible = true
      end
    end
  end
end
if currentUpload ~= nil then
  local upload = root.system_upload[currentUpload]
  if upload.done then
    root.interface_settings_active = setAct
    if upload.success then
      local result = upload.result
      local data = fromJson(result)
      finishUpload()
      if data ~= nil then
        if currentUploadTask == "create" then
          if data.error == 0 then
            workingMapCode = data.code
            nodes[67].visible = true
            nodes[50].widget_text_text = "map-" .. workingMapCode
            nodes[68].visible = false
            nodes[161].disabled = false
            nodes[69].visible = false
            log("Map created with name " .. workingMapCode)
            saveMap()
          elseif data.error == 13 then
            log("Map editor err 13")
            showError(localize("<*errorMapsLimit>"))
            showConnectionError(false)
          else
            showError("Create map error: " .. data.description)
            log("Map create: " .. result)
            showConnectionError(false)
          end
        elseif currentUploadTask == "save" then
          if data.error == 0 then
            markMapSaved()
            log("Map saved with name " .. workingMapCode)
          else
            showError("Save map error: " .. data.description)
            log("Map save: " .. result)
            showConnectionError(false)
          end
        elseif currentUploadTask == "getShort" then
          nodes[161].widget_text_text = data.name
          if data.error == 0 then
            if data.access then
              log("Map '" .. workingMapCode .. "' access checked positive")
              nodes[68].visible = false
              nodes[161].disabled = false
            else
              log("Map '" .. workingMapCode .. "' access checked negative")
              nodes[68].visible = true
              nodes[161].disabled = true
            end
          else
            log("Get short error")
            log(result)
            showConnectionError(true)
          end
        elseif currentUploadTask == "release" then
          if data.error == 0 then
            nodes[69].visible = false
            log("Release done")
          else
            showError("Map release error: " .. data.description)
            log("Map release: " .. result)
            showConnectionError(false)
          end
        end
      else
        log("Map editor unknown err")
        showError(localize("<*errorUnknown/0>") .. result .. localize("<*errorUnknown/1>"))
      end
    else
      finishUpload()
      log("Upload result is unsuccess")
      showConnectionError(false)
    end
  end
end
nodes[250].visible = math.abs(vScene.camera_state_yaw) > 0.01
if nodes[19].visible and not root.interface_settings_active then
  nodes[19].visible = false
  updateVeil()
end
