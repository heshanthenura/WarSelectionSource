local eventName = getParameter("name")
if eventName == "serverError" then
  local error = tonumber(getParameter("data"))
  log("Server er_ror " .. error)
  root.storage.f_set("sessionStartTime", "")
  root.storage.f_set("sessionServer", "")
  root.storage.f_set("sessionTicket", "")
  local nodes = interface.nodes
  nodes[1158].visible = false
  enablePanel(1)
  if error == 0 then
    showError("Server errCode 'protocolFailure'")
  elseif error == 1 then
    showError(localize("<*menuErrorNoSession>"))
  elseif error == 2 then
    showError("Server errCode 'wrongProtocol'")
  elseif error == 3 then
    showError(localize("<*menuErrorSessionWrongVersion>"))
  elseif error == 4 then
    showError(localize("<*menuErrorSessionUnavailable>"))
  else
    showError("Unknown server errCode: " .. error)
  end
  root.session.f_break()
  return
end
if eventName == "lobbyDisconnect" then
  onDisconnect()
  return
end
if eventName == "lobbyAuthFailure" then
  showError(localize("<*menuErrorAuthFailure>"))
  return
end
if eventName == "joinGroup" then
  if root.storage_sessionServer == nil or root.storage_sessionServer == "" then
    local code = getParameter("data")
    joinGroup(code)
  end
  return
end
if eventName == "joinPrivate" then
  if root.storage_sessionServer == nil or root.storage_sessionServer == "" then
    local code = getParameter("data")
    joinPrivate(code)
  end
  return
end
if eventName == "lobbyAccountData" then
  local data = fromJson(getParameter("data"))
  account.name = data.name
  account.seasons1v1 = data.seasons1v1
  account.seasons2v2 = data.seasons2v2
  account.techPoints = data.techpointsAvailable
  account.techPointsTotal = data.techPointsTotal
  account.lastMatchResult = data.lastMatchResult
  account.totalDonations = data.totalDonations
  account.availableDonations = data.availableDonations
  account.bans = data.bans
  account.specialRights = data.specialRights
  account.couponActions = data.couponActions
  account.props = data.props
  account.coupons = data.coupons
  if account.techPointsTotal == nil then
    account.techPointsTotal = 0
  end
  if account.seasons1v1 == nil then
    account.seasons1v1 = {}
  end
  if account.seasons2v2 == nil then
    account.seasons2v2 = {}
  end
  if account.techPoints == nil then
    account.techPoints = 0
  end
  if account.specialRights == nil then
    account.specialRights = 0
  end
  if account.couponActions == nil then
    account.couponActions = ""
  end
  if account.props == nil then
    account.props = {}
  end
  if account.coupons == nil then
    account.coupons = {}
  end
  local accPlayDay = data.playDay
  rewards = {}
  for mode, data in pairs(playDay.rewards) do
    rewards[mode] = data
  end
  local accPlayDay = data.playDay
  if accPlayDay ~= nil and accPlayDay.number == playDay.number then
    for mode, data in pairs(rewards) do
      am = accPlayDay.activity[mode]
      if am ~= nil then
        data.count = data.count - am
      end
    end
  end
  local nodes = interface.nodes
  for mode, data in pairs(tpRates) do
    local v = rewards[mode] ~= nil and 0 < rewards[mode].count
    nodes[data[1]].visible = v
    if v then
      if 1 < rewards[mode].count then
        nodes[data[2]].widget_text = rewards[mode].value .. " (" .. rewards[mode].count .. ")"
      else
        nodes[data[2]].widget_text = rewards[mode].value
      end
    end
  end
  if editorMode then
    account.props = {}
    for i = 0, 50 do
      table.insert(account.props, {i, 1})
    end
  end
  account.specialRights = math.floor(account.specialRights)
  account.noExp = account.techPointsTotal < 1000 and #account.props == 0
  account.propValues = {}
  for i = 1, #account.props do
    account.propValues[account.props[i][1]] = account.props[i][2]
  end
  updateAccount()
  return
end
if eventName == "lobbyData" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  local code = data.code
  local data = data.data
  if code == 0 and data.sessionId == nil then
    onServerInit(data)
  elseif code == 0 and data.sessionId ~= nil then
    local sessionId = data.sessionId
    local server = data.server
    local ticket = data.ticket
    log("Lobby session " .. sessionId .. " start")
    assert(server ~= nil)
    assert(ticket ~= nil)
    root.storage.f_set("sessionStartTime", os.time())
    root.storage.f_set("sessionServer", server)
    root.storage.f_set("sessionTicket", ticket)
    startMultiplay(server, ticket)
  elseif code == 1 then
    onGroupCreated(data.code)
  elseif code == 2 then
    joinedPrivate()
  elseif code == 3 then
    privateLeft()
  elseif code == 4 then
    local error = data.error
    if error == nil or error == 0 then
      joinedPrivate()
    else
      log("Private join er_ror: " .. error)
      if error == 1 or error == 6 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorNoPrivate>"))
        enablePanel(2)
      elseif error == 2 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorPrivateBadVersion>"))
        enablePanel(3)
      elseif error == 3 then
        nodes[80].disabled = false
        showError("ERROR 0")
        enablePanel(4)
      elseif error == 4 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorPrivatePaidCoop>"))
        enablePanel(5)
      elseif error == 7 then
        nodes[80].disabled = false
        showError(localize("<*menuKickedFromPrivate>"))
        enablePanel(6)
      elseif error == 10 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorPrivateMapNotReleased>"))
        enablePanel(7)
      elseif error == 11 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorPrivateNoStartPositions>"))
        enablePanel(8)
      elseif error == 12 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorPrivateMapDoesntExist>"))
        enablePanel(9)
      elseif error == 13 then
        nodes[80].disabled = false
        showError(localize("<*menuErrorPrivateMapObsolete>"))
        enablePanel(10)
      elseif error == 5 then
      elseif error == 6 then
      elseif error == 8 then
      elseif error == 9 then
      elseif error == 14 then
      else
        log("Unknown private join error: " .. error)
        enablePanel(11)
      end
    end
  elseif code == 6 then
    log("Can not cancel private")
  elseif code == 7 then
    local errorCode = math.floor(tonumber(data.error))
    local nodes = interface.nodes
    nodes[476].disabled = false
    nodes[737].disabled = false
    if errorCode == 0 then
      gameMode = 1
      mode = 1
      clearChooseModeWindows()
      nodes[586].visible = true
      nodes[730].disabled = false
    elseif errorCode == 1 then
      nodes[724].visible = false
      nodes[586].visible = false
      enablePanel(16)
    elseif errorCode == 2 or errorCode == 9 then
      showError(localize("<*menuErrorNoGroup>"))
      enablePanel(17)
    elseif errorCode == 3 then
      showError(localize("<*menuErrorGroupBadVersion>"))
      enablePanel(18)
    elseif errorCode == 4 then
      showError(localize("<*menuErrorGroupIsFull>"))
      enablePanel(19)
    elseif errorCode == 5 then
    elseif errorCode == 7 then
      local banEnd = tonumber(data.banPeriod)
      showError(localize("<*matchfindingBan/0>" .. toTimeStr(banEnd) .. "<*matchfindingBan/1>"))
      enablePanel(20)
    else
      log("onGroupOperationResult " .. errorCode)
    end
  elseif code == 8 then
    log("Can not leave private")
  elseif code == 10 then
    privateLeft()
  elseif code == 11 then
    log("Can not create private")
  elseif code == 14 then
    onStartMatchFinding(data ~= nil and data.outdated ~= nil and data.outdated)
  elseif code == 15 then
    onMatchFindingLeft(data.reason)
  elseif code == 16 then
    updateGroupPlayers(data.players)
  elseif code == 17 then
    log("Match finding is disabled")
    enablePanel(12)
    showError(localize("<*menuErrorModeTemporaryDisabled>"))
  elseif code == 18 then
    log("Multiplayer is off")
    enablePanel(13)
    nodes[63].disabled = false
    nodes[491].disabled = false
    nodes[47].disabled = false
    showError(localize("<*multiplayIsOff>"))
  elseif code == 19 then
    log("Price list received")
    regionCoef = tonumber(data.coeff)
    priceListInited = true
    updateAccount()
    nodes[232].disabled = false
    nodes[489].disabled = false
  elseif code == 20 then
    nodes[142].disabled = false
  elseif code == 25 then
    log("Can not leave the queue")
  elseif code == 28 then
    log("Multiplayer is off")
    privateLeft()
    showError(localize("<*menuKickedFromPrivate>"))
  elseif code == 32 then
    log("No access to kick from private")
  elseif code == 33 then
    log("Can't self kick")
  elseif code == 34 then
    log("No this player in the private")
  elseif code == 37 then
    if data.mode == 4 then
      enablePanel(14)
    else
      onStartMatchFinding(false)
    end
  elseif code == 38 then
    log("Match finding is temporary banned for " .. data.period .. " seconds")
    enablePanel(15)
    showError(localize("<*matchfindingBan/0>" .. toTimeStr(data.period) .. "<*matchfindingBan/1>"))
  elseif code == 39 then
    nodes[142].disabled = false
    if nodes[142].visible then
      startMusic()
    end
    nodes[142].visible = false
  elseif code == 41 then
    log("Can not change team")
  elseif code == 200 and data.operation == 0 and data.key == "anonym" then
    interface.nodes[121].disabled = false
  end
  return
end
if eventName == "sessionClose" then
  assert(sessionWork)
  sessionWork = false
  local data = fromJson(getParameter("data"))
  local clearRejoin = function()
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    local nodes = interface.nodes
    nodes[1158].visible = false
    enablePanel(27)
  end
  if data.reason == 1 then
    showError(localize("<*menuErrorObsoleteDump>"))
  elseif data.reason == 2 then
    showError(localize("<*menuErrorCorruptedDump>"))
  elseif data.reason == 3 then
    showError(localize("<*menuErrorSessionWrongVersion>"))
    clearRejoin()
  elseif data.reason == 4 then
    showError(localize("<*menuErrorSessionCorruptedLandscape/0>") .. data.text .. localize("<*menuErrorSessionCorruptedLandscape/1>"))
  elseif data.reason == 5 then
    showError(localize("<*menuErrorObsoleteUnitsDump>"))
  elseif data.reason == 6 then
    showError(localize("<*menuErrorObsoleteLandscape>"))
  elseif data.reason == 9 then
    showError(localize("<*menuErrorScriptTooManyEditors>"))
  elseif data.reason == 10 then
    showError(localize("<*menuErrorSessionWrongState/0>") .. data.text .. localize("<*menuErrorSessionWrongState/1>"))
  end
  if 0 < data.reason or not demoSessionWork then
    demoSessionWork = false
    reinitDemoAndMusic()
  end
  interface.active = true
  return
end
if eventName == "mapEditorStartMap" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  mapCode = data.code
  if mapCode == nil then
    local mapSizeX = data.mapSize[1]
    local mapSizeY = data.mapSize[2]
    local passSizeX = (mapSizeX - 1) * 4
    local passSizeY = (mapSizeY - 1) * 4
    local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
    local json = {
      factions = 64,
      player = 0,
      players = {1},
      seed = 0,
      scriptParameters = parameters,
      scriptsG = {
        "JnHcuvqS6ga_10",
        "sicpCjwFVT9_8",
        "8L44LdxKptb_0"
      },
      scriptsV = {
        "dKsZBCbnhVf_6",
        "i6wtqtGBgid_0",
        "EFJt276ZLEf_4",
        {
          "mCpWa2x0F7i_8",
          "height=1724,borders=350,maxHeight=10000,heightSpeed=6000"
        },
        "JDGR2Xa7qt5_1"
      },
      parametersUrlG = "project/WarSelection/scenes/defaultG.json",
      parametersUrlV = "project/WarSelection/scenes/defaultV.json",
      generatorData = {
        size = {
          cellsize = 16384,
          passability = {
            cellsize = 16,
            offset = nil,
            size = {x = passSizeX, y = passSizeY}
          },
          size = {x = mapSizeX, y = mapSizeY}
        },
        mapParameters = {
          seed = os.time(),
          startPositions = 1
        }
      }
    }
    if data.generatorParameters ~= nil then
      json.generatorData.mapParameters = {
        startPositions = 0,
        script = {
          name = "T1KvZeyfjb0_9",
          parameters = data.generatorParameters
        },
        style = 5,
        symmetry = data.symmetry
      }
      log("Add task to start session map editor - gen")
    else
      json.generatorData.mapParameters = {
        startPositions = 0,
        script = {
          name = "m0oXdWSxqP1_4",
          parameters = "height=600"
        },
        style = 5
      }
      log("Add task to start session map editor - blank")
    end
    addStartSessionTask("startSingle", toJson(json), "")
  else
    local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
    local json = {
      factions = 64,
      player = 0,
      players = {1},
      seed = 0,
      scriptParameters = parameters,
      scriptsG = {
        "JnHcuvqS6ga_10",
        "sicpCjwFVT9_8",
        "8L44LdxKptb_0"
      },
      scriptsV = {
        "dKsZBCbnhVf_6",
        "i6wtqtGBgid_0",
        {
          "mCpWa2x0F7i_8",
          "height=1724,borders=350,maxHeight=5000,heightSpeed=3000"
        },
        "JDGR2Xa7qt5_1"
      },
      parametersUrlG = "project/WarSelection/scenes/defaultG.json",
      parametersUrlV = "project/WarSelection/scenes/defaultV.json"
    }
    assert(type(mapCode) == "string")
    if #mapCode == 8 then
      json.loadData = {
        mapCode = mapCode,
        releaseData = false
      }
      table.insert(json.scriptsV, {
        "EFJt276ZLEf_4",
        "mapCode=" .. mapCode
      })
    else
      json.mapCode = mapCode
      table.insert(json.scriptsV, "EFJt276ZLEf_4")
    end
    log("Add task to start session map editor - code " .. mapCode)
    addStartSessionTask("startSingle", toJson(json), "")
  end
  cannotRequestMaps = nil
  return
end
if eventName == "mapChoosen" then
  mapCode = getParameter("data")
  hideCustomMapChoosing()
  local nodes = interface.nodes
  nodes[491].visible = true
  root.interface_customMapOptions_active = true
  return
end
if eventName == "disablePanel" then
  disablePanel(100)
  return
end
if eventName == "enablePanel" then
  enablePanel(100)
  return
end
if eventName == "rankingData" then
  local data = fromJson(getParameter("data"))
  local nodes = interface.nodes
  nodes[217].visible = true
  nodes[97].visible = false
  nodes[596].visible = false
  local list = fromJson(data.list)
  if list == nil then
    list = {}
  end
  local myAccId = root.lobby_accountId
  rankingTopPlace = data.topPlace
  if rankingTopPlace == 0 and #list == 3 then
    for i = 1, #list do
      rankingsUpdateTop(i, list[i], myAccId)
    end
    return
  end
  if #list == 0 and rankingTopPlace == nil then
    local season = nodes[1191].widget_lines_size - nodes[1191].widget_value - 1
    root.rankings.f_getByPlace(nodes[1635].widget_value, season, 0, 20)
    return
  end
  nodes[893].disabled = rankingTopPlace == 0
  nodes[892].disabled = 80 <= rankingTopPlace
  for i = 1, #list do
    rankingsUpdatePos(i, rankingTopPlace + i, list[i], myAccId)
  end
  if rankingOutOfList then
    rankingsClearPos(19)
    local w = nodes[rateName[20]].widget
    w.text = account.name
    assert(account.name ~= "")
    w.fontName = getFontName(account.name)
    local myRanking = account.seasons1v1
    if data.service == 1 then
      myRanking = account.seasons2v2
    end
    nodes[ratePoints[20]].widget_text = getRanking(myRanking, currentSeason)
    nodes[ratePosition[17]].widget_text = ">100"
  end
  return
end
if eventName == "replayChoosen" then
  local data = fromJson(getParameter("data"))
  local replayData = root.system.files.f_loadData(data.file)
  if data.code == nil then
    log("Add task to start session replay (" .. data.file .. ")")
    addStartSessionTask("startReplay", replayData)
  else
    log("Add task to start session replay (rep-" .. data.code .. ", " .. data.file .. ")")
    addStartSessionTask("startReplay", replayData, "replayCode=" .. data.code)
  end
  return
end
