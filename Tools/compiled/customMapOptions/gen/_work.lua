if mapMetaLoading ~= nil then
  local upload = root.system_upload[mapMetaLoading]
  if upload.done then
    local j = uploadCheck(mapMetaLoading, "Loading map data")
    mapMetaLoading = nil
    local nodes = interface.nodes
    if j == nil then
      nodes[14].visible = true
      nodes[13].visible = false
    else
      createPrivateOnlyDraft = j.releaseData == nil
      createPrivateOwnMap = root.lobby_accountLocalId == j.author
      if createPrivateOnlyDraft and not createPrivateOwnMap then
        showError(localize("<*menuErrorPrivateMapNotReleased>"))
        nodes[13].visible = false
      else
        mapAuthorLoading = createUpload("https://resolve-account.warselect.io/resolveLocal")
        createUploadPostParameter(mapAuthorLoading, "account", j.author)
        createUploadPostParameter(mapAuthorLoading, "key", root.lobby.f_makeAccountKey(4))
        startUploading(mapAuthorLoading, "map author")
        nodes[9].widget_text = "..."
        nodes[10].widget_text = j.name
        log("Map issues: " .. j.issues)
        nodes[4].visible = j.issues < 0.02
        nodes[5].visible = j.issues >= 0.02 and j.issues < 0.06
        nodes[6].visible = j.issues >= 0.06 and j.issues < 0.15
        nodes[7].visible = j.issues >= 0.15 and j.issues < 0.4
        nodes[8].visible = j.issues >= 0.4
        nodes[11].visible = false
        nodes[12].widget_checked = false
        openingPrivateMapCode = j.code
        if createPrivateOnlyDraft then
          openingPrivateVersionRelease = nil
        else
          openingPrivateVersionRelease = j.releaseData.version
        end
        openingPrivateVersionDraft = j.version
        startLoadingPrivateConfigDraft(openingPrivateMapCode, openingPrivateVersionDraft)
      end
    end
  end
end
if mapAuthorLoading ~= nil then
  local upload = root.system_upload[mapAuthorLoading]
  if upload.done then
    local j = uploadCheck(mapAuthorLoading, "Author map data")
    mapAuthorLoading = nil
    if j ~= nil then
      local nodes = interface.nodes
      nodes[9].widget_text = j.data.name
    end
  end
end
if mapConfigLoading ~= nil and root.system_loader.f_check(mapConfigLoading) then
  local upload = fromJson(root.system_loader.f_get(mapConfigLoading))
  mapConfigLoading = nil
  local json = {
    cmd = 0,
    version = getVersionArray(),
    make = {
      mapCode = mapCode
    }
  }
  json.make.scriptsV = {}
  table.insert(json.make.scriptsV, "dKsZBCbnhVf_6")
  table.insert(json.make.scriptsV, "i6wtqtGBgid_0")
  table.insert(json.make.scriptsV, "Jb6UqUD3x97_0")
  json.make.scriptsG = {}
  table.insert(json.make.scriptsG, "JnHcuvqS6ga_10")
  table.insert(json.make.scriptsG, "sicpCjwFVT9_8")
  table.insert(json.make.scriptsG, "QdmFm6WcJGj_1")
  if upload == nil then
    table.insert(json.make.scriptsG, "6gqH17D5rDl_3")
    table.insert(json.make.scriptsG, "t0RdMqvHcB9_14")
    table.insert(json.make.scriptsG, "PqR6QgyQlHb_4")
    table.insert(json.make.scriptsG, {
      "KgbndOUtoob_10",
      "res0=100,res1=250,res2=0"
    })
    table.insert(json.make.scriptsG, {
      "fIoO5t44ONj_8",
      "limit=100"
    })
    table.insert(json.make.scriptsG, "Rgi6rNgLAmd_5")
    table.insert(json.make.scriptsG, {
      "BkorbliOBbj_2",
      "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
    })
    table.insert(json.make.scriptsG, {
      "osemAL0QGYe_7",
      "waitingTime=180"
    })
    table.insert(json.make.scriptsG, "X6OqsoSYnB2_7")
    table.insert(json.make.scriptsG, "6OzC814a3Re_2")
    table.insert(json.make.scriptsG, "lFMtjJTcyml_11")
    table.insert(json.make.scriptsG, {
      "jz0EOdJFAug_6",
      "smallAmount=10,bigAmount=10"
    })
    table.insert(json.make.scriptsG, "Am5eQZtzjYd_8")
    table.insert(json.make.scriptsG, "vUzAsp5omY9_11")
    table.insert(json.make.scriptsV, "BPoKSILDqIl_3")
    table.insert(json.make.scriptsV, "AfAIhxPztX1_7")
    table.insert(json.make.scriptsV, "uKeGCLnotPg_3")
    table.insert(json.make.scriptsV, {
      "mCpWa2x0F7i_8",
      "height=1724,borders=350"
    })
    table.insert(json.make.scriptsV, {
      "mkrXH0nVJC7_5",
      "unitTags=32"
    })
    table.insert(json.make.scriptsV, "fBB0HwHlfzd_19")
    table.insert(json.make.scriptsV, {
      "up48OkgDf4d_2",
      "factions=1"
    })
  else
    if upload.modsG ~= nil then
      for _, mod in pairs(upload.modsG) do
        if mod[2] == "" then
          table.insert(json.make.scriptsG, mod[1])
        else
          table.insert(json.make.scriptsG, mod)
        end
      end
    end
    if upload.modsV ~= nil then
      for _, mod in pairs(upload.modsV) do
        if mod[2] == "" then
          table.insert(json.make.scriptsV, mod[1])
        else
          table.insert(json.make.scriptsV, mod)
        end
      end
    end
  end
  table.insert(json.make.scriptsV, "JDGR2Xa7qt5_1")
  startSinglePrivateData = json
  if createPrivateOwnMap then
    startUploadModsInfo()
  else
    local nodes = interface.nodes
    nodes[2].visible = true
    nodes[13].visible = false
    enablePanel()
  end
end
if modsListUpload ~= nil then
  local upload = root.system_upload[modsListUpload]
  if upload.done then
    local j = uploadCheck(modsListUpload, "Mods list")
    modsListUpload = nil
    local nodes = interface.nodes
    nodes[2].visible = true
    nodes[13].visible = false
    enablePanel()
    if j ~= nil then
      local myAcc = root.lobby_accountId
      local hasMyMod = false
      local findModAddDraft = function(array, code, draftVersion)
        for i, item in ipairs(array) do
          if type(item) == "table" then
            if string.sub(item[1], 1, 11) == code then
              item[1] = "draft/" .. code .. "_" .. draftVersion
            end
          elseif type(item) == "string" and string.sub(item, 1, 11) == code then
            array[i] = "draft/" .. code .. "_" .. draftVersion
          end
        end
      end
      local findModRemoveDraft = function(array, code, version)
        for i, item in ipairs(array) do
          if type(item) == "table" then
            if string.sub(item[1], 1, 11) == code then
              item[1] = code .. "_" .. version
            end
          elseif type(item) == "string" and string.sub(item, 1, 11) == code then
            array[i] = code .. "_" .. version
          end
        end
      end
      if privateDraftMode then
        for _, modData in ipairs(j.list) do
          if modData.author == myAcc then
            hasMyMod = true
            if modData.type == 0 then
              findModAddDraft(startSinglePrivateData.make.scriptsG, modData.code, modData.version)
            else
              findModAddDraft(startSinglePrivateData.make.scriptsV, modData.code, modData.version)
            end
          end
        end
      else
        for _, modData in ipairs(j.list) do
          if modData.author == myAcc then
            hasMyMod = true
            if modData.type == 0 then
              findModRemoveDraft(startSinglePrivateData.make.scriptsG, modData.code, modData.version)
            else
              findModRemoveDraft(startSinglePrivateData.make.scriptsV, modData.code, modData.version)
            end
          end
        end
      end
      nodes[11].visible = hasMyMod and createPrivateOwnMap
      nodes[12].widget_checked = loadingConfigDraft and nodes[11].visible
    end
  end
end
