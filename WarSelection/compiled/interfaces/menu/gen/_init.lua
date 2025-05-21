local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
end
editorMode = root.project ~= nil
fonts = {
  ru = localize("<*font_ru>"),
  br = localize("<*font_br>"),
  cn = localize("<*font_cn>"),
  cs = localize("<*font_cs>"),
  sk = localize("<*font_sk>"),
  da = localize("<*font_da>"),
  de = localize("<*font_de>"),
  en = localize("<*font_en>"),
  es = localize("<*font_es>"),
  fr = localize("<*font_fr>"),
  hi = localize("<*font_hi>"),
  it = localize("<*font_it>"),
  ka = localize("<*font_ka>"),
  kr = localize("<*font_kr>"),
  pl = localize("<*font_pl>"),
  tr = localize("<*font_tr>"),
  nl = localize("<*font_nl>"),
  sr = localize("<*font_sr>"),
  hu = localize("<*font_hu>"),
  tw = localize("<*font_tw>"),
  hr = localize("<*font_hr>"),
  ja = localize("<*font_ja>"),
  th = localize("<*font_th>"),
  fa = localize("<*font_fa>"),
  unk = localize("<*font_unk>")
}
strPing1 = localize("<*menuCurrentPingMs/0>")
strPing2 = localize("<*menuCurrentPingMs/1>")
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
eraName = {
  localize("<*menuAgeName0>"),
  localize("<*menuAgeName1>"),
  localize("<*menuAgeName2>"),
  localize("<*menuAgeName3>"),
  localize("<*menuAgeName4>"),
  localize("<*menuAgeName5>"),
  localize("<*menuAgeName6>"),
  localize("<*menuAgeName7>")
}
hints = {
  localize("<*hint0>"),
  localize("<*hint1>"),
  localize("<*hint2>"),
  localize("<*hint3>"),
  localize("<*hint4>"),
  localize("<*hint5>"),
  localize("<*hint6>"),
  localize("<*hint7>"),
  localize("<*hint8>"),
  localize("<*hint9>"),
  localize("<*hint10>"),
  localize("<*hint11>"),
  localize("<*hint12>"),
  localize("<*hint13>")
}
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
difficultyNames = {
  localize("<*menuGameDifficility/1>"),
  localize("<*menuGameDifficility/2>"),
  localize("<*menuGameDifficility/3>"),
  localize("<*menuGameDifficility/4>")
}
mapSizes = {
  localize("<*mapSize/0>"),
  localize("<*mapSize/1>"),
  localize("<*mapSize/2>"),
  localize("<*mapSize/3>"),
  localize("<*mapSize/4>"),
  localize("<*mapSize/5>")
}
playersCountText = {
  localize("<*mapPlayersCount/0>"),
  localize("<*mapPlayersCount/1>")
}
playersCountPrivate = {
  4,
  6,
  8,
  12,
  20,
  31
}
disconnectWidgetsVisible = {
  224,
  192,
  188,
  147
}
disconnectWidgetsDisable = {
  125,
  232,
  489
}
ratePosition = {
  663,
  664,
  665,
  666,
  667,
  668,
  669,
  670,
  671,
  672,
  673,
  674,
  675,
  676,
  677,
  678,
  679
}
rateName = {
  700,
  701,
  702,
  703,
  704,
  705,
  706,
  707,
  708,
  709,
  710,
  711,
  712,
  713,
  714,
  715,
  716,
  717,
  718,
  719
}
ratePoints = {
  872,
  873,
  874,
  875,
  876,
  877,
  878,
  879,
  880,
  881,
  882,
  883,
  884,
  885,
  886,
  887,
  888,
  889,
  890,
  891
}
culturesSwitchButtons = {
  1494,
  1495,
  1496,
  1497,
  1498,
  1499,
  1504,
  1500,
  1501,
  1502,
  1503,
  1505,
  1506,
  1507,
  1508,
  1393,
  1818,
  404,
  417
}
bigPictures = {
  1146,
  1147,
  418,
  574,
  2971
}
tpRates = {
  [0] = {190, 1542},
  [1] = {1694, 1697},
  [4] = {1698, 1700},
  [5] = {1701, 1703},
  [7] = {360, 391}
}
local currentShopTp = 9
webVersion = root.system_platformName == "web"

function boolToStr(b)
  if b then
    return "true"
  end
  return "false"
end

function toBool(v)
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

function getFontName(text)
  assert(text ~= "")
  local font = fonts[root.functions.f_detectLanguage(text)]
  assert(font ~= nil)
  return font
end

function setWidgetText(widgetText, text)
  assert(text ~= "")
  widgetText.text = text
  widgetText.fontName = getFontName(text)
end

function getCurrentServerTime()
  return connectServerTime + (os.time() - connectLocalTime)
end

function updateSeasons()
  local nodes = interface.nodes
  local s = 0
  if currentSeason ~= nil then
    s = currentSeason
  end
  local w = nodes[1191].widget
  local lines = w.lines
  lines.f_clear()
  lines.f_create(localize("<*menuRateSeasonNumber/0>" .. s + 1 .. "<*menuRateSeasonNumber/1><*menuRateSeasonNumber/2>"))
  for i = s, 1, -1 do
    lines.f_create(localize("<*menuRateSeasonNumber/0>" .. i .. "<*menuRateSeasonNumber/1>"))
  end
  w.value = 0
end

function getRegionName(code)
  if string.find(code, "europe") ~= nil then
    return localize("<*matchRegion/0>")
  elseif string.find(code, "america") ~= nil then
    return localize("<*matchRegion/1>")
  elseif string.find(code, "asia") ~= nil then
    return localize("<*matchRegion/2>")
  else
    return code
  end
end

function onServerInit(data)
  local nodes = interface.nodes
  connectServerTime = data.serverTime
  currentSeason = data.season1v1
  connectLocalTime = os.time()
  anonymMode = false
  if data.registry ~= nil then
    anonymMode = toBool(data.registry.anonym)
  end
  nodes[121].widget_checked = anonymMode
  nodes[237].visible = false
  if data.newsNumber ~= nil then
    nodes[237].visible = data.newsNumber ~= tonumber(root.storage_newsNumber)
    newsNumber = data.newsNumber
  end
  nodes[916].visible = data.errorsWarning == true
  local serverMessage = data.serverMessage
  nodes[631].visible = serverMessage ~= nil
  if serverMessage ~= nil then
    nodes[641].widget_text = serverMessage
  end
  playDay = data.playDay
  nextSeason = data.nextSeason
  playRegion = data.playRegion
  nodes[435].widget_text = getRegionName(playRegion)
  for _, widgetId in pairs(disconnectWidgetsVisible) do
    nodes[widgetId].visible = false
  end
  for _, widgetId in pairs(disconnectWidgetsDisable) do
    nodes[widgetId].disabled = false
  end
  nodes[232].disabled = not priceListInited
  nodes[489].disabled = not priceListInited
  updateSeasons()
end

function onDisconnect()
  local nodes = interface.nodes
  nodes[53].visible = false
  hideCustomMapOptions()
  nodes[144].visible = false
  hideCustomMapChoosing()
  nodes[505].visible = false
  nodes[305].visible = false
  nodes[724].visible = false
  nodes[608].visible = false
  nodes[586].visible = false
  nodes[477].visible = false
  nodes[523].disabled = true
  nodes[133].disabled = true
  onMatchFindingLeft(0)
  privateLeft()
  for _, widgetId in pairs(disconnectWidgetsVisible) do
    nodes[widgetId].visible = true
  end
  for _, widgetId in pairs(disconnectWidgetsDisable) do
    nodes[widgetId].disabled = true
  end
end

function isHex(simbol)
  if 48 <= simbol and simbol <= 57 then
    return true
  end
  if 97 <= simbol and simbol <= 102 then
    return true
  end
  if 65 <= simbol and simbol <= 70 then
    return true
  end
  return false
end

function intToHex(int)
  assert(0 <= int)
  if int < 10 then
    return string.char(int + 48)
  end
  return string.char(int + 87)
end

function hideCustomMapChoosing()
  local nodes = interface.nodes
  nodes[624].visible = false
  root.interface_customMapChoosing_active = false
end

function hideCustomMapOptions()
  local nodes = interface.nodes
  nodes[491].visible = false
  root.interface_customMapOptions_active = false
end

function clearChooseModeWindows()
  local nodes = interface.nodes
  newMatchMode = ""
  nodes[116].visible = false
  nodes[28].visible = false
  nodes[23].visible = false
  nodes[68].visible = false
  nodes[505].visible = false
  hideCustomMapChoosing()
  hideCustomMapOptions()
  nodes[53].visible = false
  nodes[144].visible = false
  nodes[298].visible = false
  nodes[305].visible = false
  nodes[477].visible = false
  nodes[325].visible = false
  nodes[148].visible = false
  nodes[793].visible = false
  nodes[239].visible = false
  nodes[608].visible = false
  nodes[151].visible = false
  nodes[414].visible = false
  nodes[1175].visible = false
  nodes[410].visible = false
  root.interface_replaysList_active = false
  root.interface_mapEditorStart_active = false
  if nodes[142].visible then
    nodes[142].visible = false
    startMusic()
    root.interface_store_active = false
  end
end

function isModeBanned(mode)
  if account.bans == nil then
    return false
  end
  local bm = account.bans[mode]
  if bm == nil then
    return false
  end
  return getCurrentServerTime() < bm.expired
end

function startMatch()
  if matchMode == "survival" then
    startSurvival()
  elseif matchMode == "horde" then
    startHorde()
  elseif matchMode == "sandbox" then
    startSandbox()
  elseif matchMode == "ffa" then
    if not isModeBanned(0) then
      startMatchFinding(0)
    end
  elseif matchMode == "team" then
    if not isModeBanned(1) then
      startMatchFinding(1)
    end
  elseif matchMode == "br" then
    startMatchFinding(2)
  elseif matchMode == "1x1" then
    if not isModeBanned(4) then
      startMatchFinding(4)
    end
  elseif matchMode == "tugofwar" then
    if not isModeBanned(7) then
      startMatchFinding(7)
    end
  else
    assert(false)
  end
end

function setAndStartMatch(mode)
  newMatchMode = mode
  applyGameMode()
  startMatch()
end

function showEditMatchSingle(mode)
  newMatchMode = mode
  local nodes = interface.nodes
  nodes[116].visible = false
  if mode == "s-campaign" then
    nodes[23].visible = true
  elseif mode == "s-FFA" then
    nodes[68].visible = true
  end
end

function disablePanel(logData)
  if logData ~= nil then
  end
  local nodes = interface.nodes
  nodes[334].disabled = true
end

function enablePanel(logData)
  if logData ~= nil then
  end
  local nodes = interface.nodes
  nodes[334].disabled = false
end

function getRandomHint()
  local hint = math.random(#hints)
  return hints[hint]
end

function removeBadSimbolsFromCode(code)
  local result = ""
  for i = 1, #code do
    local ch = code:byte(i)
    if isHex(ch) then
      result = result .. string.char(ch)
    end
  end
  return result
end

function onGroupCreated(code)
  disablePanel(5)
  local nodes = interface.nodes
  nodes[724].visible = true
  nodes[752].widget_text_text = code
  nodes[18].visible = false
  local lines = nodes[367].widget_lines
  lines.f_clear()
  lines.f_create(account.name)
  nodes[550].disabled = false
  nodes[585].disabled = true
  nodes[586].visible = false
  nodes[477].visible = false
end

function updateGroupPlayers(playersList)
  local nodes = interface.nodes
  local lines = nodes[444].widget_lines
  lines.f_clear()
  for i = 1, #playersList do
    lines.f_create(playersList[i])
  end
  nodes[18].visible = false
  local lines = nodes[367].widget_lines
  lines.f_clear()
  for i = 1, #playersList do
    lines.f_create(playersList[i])
  end
  nodes[585].disabled = #playersList <= 1
  nodes[1633].disabled = #playersList ~= 2
  groupPlayers = playersList
end

function joinedPrivate()
  log("Joined private")
  inPrivate = true
  local nodes = interface.nodes
  nodes[144].visible = false
  nodes[53].visible = false
  hideCustomMapOptions()
end

function privateLeft()
  if not inPrivate then
    return
  end
  inPrivate = nil
  log("Left private")
  clearChooseModeWindows()
  enablePanel(21)
end

function applyGameMode()
  local nodes = interface.nodes
  matchMode = newMatchMode
  if matchMode == "team" then
    nodes[22].widget_text = localize("<*gameModeMultiTeam>")
  elseif matchMode == "br" then
    nodes[22].widget_text = localize("<*gameModeMultiBattleRoyale>")
  elseif matchMode == "ffa" then
    nodes[22].widget_text = localize("<*gameModeMultiFFA>")
  elseif matchMode == "sandbox" then
    nodes[22].widget_text = localize("<*gameModeSandbox>")
  elseif matchMode == "survival" then
    nodes[22].widget_text = localize("<*gameModeSurvival>")
  elseif matchMode == "horde" then
    nodes[22].widget_text = localize("<*gameModeHorde>")
  elseif matchMode == "1x1" then
    nodes[22].widget_text = localize("<*gameModeMultyRate1x1>")
  end
  clearChooseModeWindows()
  if matchMode == "survival" then
    nodes[58].visible = false
    nodes[295].visible = true
    nodes[302].widget_text = difficultyNames[difficulty + 1]
  elseif matchMode == "horde" then
    nodes[58].visible = false
    nodes[295].visible = true
    nodes[302].widget_text = difficultyNames[difficulty + 1]
  elseif matchMode == "sandbox" then
    nodes[58].visible = false
    nodes[295].visible = false
  else
    nodes[58].visible = false
    nodes[295].visible = false
    nodes[45].widget_text = eraName[nodes[37].widget_value + 1]
  end
end

function showError(text)
  root.interface.f_sendEvent("showError", text)
end

local factionColors = {
  {8355711, 2631720},
  {14342874, 2631720},
  {255, 0},
  {4194239, 2631720},
  {16760576, 2631720},
  {49151, 2631720},
  {8323263, 2631720},
  {16711807, 2631720},
  {12582656, 0},
  {65535, 0},
  {8323327, 2631720},
  {8323072, 6113347},
  {8372095, 2631720},
  {16744192, 4210753},
  {32767, 2631720},
  {12517567, 0},
  {48959, 2631720},
  {8372159, 2631720},
  {8372223, 2631720},
  {127, 58},
  {6697779, 6554112},
  {65343, 0},
  {8388607, 0},
  {8339455, 2631720},
  {16744319, 2631720},
  {4177791, 2631720},
  {32703, 2631720},
  {16711935, 2631720},
  {16760767, 2631720},
  {8388479, 2631720},
  {12582911, 2631720},
  {12550143, 2631720},
  {12533567, 2631720},
  {8388575, 2631720},
  {12566527, 2631720},
  {16744447, 2631720},
  {12549951, 4210753},
  {4161343, 2631713},
  {8355839, 2631720},
  {16711871, 4210753},
  {16760703, 2631720},
  {32512, 0},
  {8355775, 2631720},
  {12517503, 0},
  {16777151, 2631720},
  {49087, 2631720},
  {4145087, 3355443},
  {4128831, 8454273},
  {12566272, 2631720},
  {191, 2631713},
  {16760831, 2631720},
  {8371968, 2631720},
  {4145023, 2631720},
  {12566399, 2631720},
  {32639, 4210753},
  {63, 127},
  {12550079, 2631720},
  {12582847, 2631720},
  {8339327, 3355443},
  {16776960, 2631720},
  {12582783, 2631720},
  {8355584, 4210753},
  {8323199, 5111886},
  {11730944, 4210753},
  {12566463, 2631720}
}

function tryShowLastMatchResult()
  local json = fromJson(account.lastMatchResult)
  if json == nil then
    return
  end
  lastMatchStartTime = math.floor(json.startTime)
  local storage = root.storage
  local storedMatchTime = tonumber(storage.lastMatchTime)
  if lastMatchStartTime == storedMatchTime then
    return
  end
  root.interface_replaysList.f_sendEvent("clearList", "")
  local nodes = interface.nodes
  storage.f_set("lastMatchTime", lastMatchStartTime)
  nodes[614].visible = true
  nodes[414].visible = true
  nodes[637].disabled = nodes[334].disabled
  local replay = json.replay
  nodes[1022].visible = replay ~= nil
  if replay ~= nil then
    nodes[1021].widget_text_text = "rep-" .. replay
  end
  local rateDiff = json.rateDiff1v1
  if rateDiff == nil or rateDiff == 0 then
    rateDiff = json.rateDiff2v2
  end
  local techPoints = json.techPoints
  local playerPosition = json.playerPosition
  local state = json.state
  local mode = json.mode
  if state == nil then
    if playerPosition == 1 then
      state = 1
    else
      state = 0
    end
  end
  if mode ~= nil then
    nodes[1753].widget_text = modeNames[mode + 1]
  else
    nodes[1753].widget_text = ""
  end
  nodes[453].visible = false
  nodes[465].visible = false
  nodes[980].visible = false
  if state == 1 then
    nodes[453].visible = true
  elseif state == 0 then
    nodes[465].visible = true
  else
    nodes[980].visible = true
  end
  if mode ~= 7 then
    nodes[763].visible = true
    nodes[471].widget_text = playerPosition
  else
    nodes[763].visible = false
  end
  if rateDiff ~= nil or techPoints ~= nil then
    nodes[308].visible = true
    if rateDiff ~= nil then
      local rateDiff = math.floor(rateDiff)
      if 0 <= rateDiff then
        nodes[457].widget_text = "+" .. rateDiff
      else
        nodes[457].widget_text = rateDiff
      end
      nodes[459].visible = true
    else
      nodes[459].visible = false
    end
    if techPoints ~= nil then
      local mult = json.techPointsMutiplier
      if mult == nil then
        mult = 1
      end
      local tp = techPoints // mult
      local bonus = techPoints - tp
      nodes[1704].visible = bonus ~= 0
      nodes[1706].widget_text = bonus
      nodes[306].widget_text = techPoints
      nodes[1708].widget_text = tp
      nodes[311].visible = true
    else
      nodes[311].visible = false
    end
  else
    nodes[308].visible = false
  end
end

function isPropertyAvailable(id)
  local p = account.propValues[id]
  if p == nil or p == 0 then
    return 0
  end
  if not isValidRegion(tonumber(p)) then
    return 1
  end
  return 2
end

function requestPriceListIfNeed()
  if priceRequested then
    return true
  end
  if root.launcher_currency == nil then
    return false
  end
  interface.nodes[405].visible = false
  if root.launcher_currency_name == "" then
    return false
  end
  if not root.interface_store_scripts_ready then
    return false
  end
  priceRequested = root.lobby.f_sendCommand(2, toJson(root.launcher_currency_signed))
  if priceRequested then
    log("Price list request (currency=" .. root.launcher_currency_name .. ")")
  end
  return true
end

function getRanking(seasonsData, season)
  if seasonsData == nil then
    return 0
  end
  local rt = seasonsData[season]
  if rt == nil then
    return 0
  end
  return math.floor(rt)
end

function updateBanWidget(mode, widgetMain, widgetTimer, widgetText)
  local nodes = interface.nodes
  local ban = false
  if account.bans ~= nil then
    local bm = account.bans[mode]
    if bm ~= nil then
      local tm = bm.expired - getCurrentServerTime()
      ban = 0 < tm
      if ban then
        hasBan = true
        nodes[widgetTimer].widget_text = toTimeStr(tm)
        local widget = nodes[widgetText].widget
        if bm.reason == 0 then
          widget.text = localize("<*banReason0>")
        elseif bm.reason == 1 then
          widget.text = localize("<*banReason1>")
        elseif bm.reason == 2 then
          widget.text = localize("<*banReason2>")
        elseif bm.reason == 3 then
          widget.text = localize("<*banReason3>")
        elseif bm.reason == 4 then
          widget.text = localize("<*banReason4>")
        elseif bm.reason == 5 then
          widget.text = localize("<*banReason5>")
        elseif bm.reason == 6 then
          widget.text = localize("<*banReason6>")
        end
      end
    end
  end
  nodes[widgetMain].visible = ban
end

function updateAllBanWidgets()
  local nodes = interface.nodes
  hasBan = false
  updateBanWidget(0, 567, 1206, 1207)
  updateBanWidget(1, 683, 1190, 1205)
  updateBanWidget(4, 214, 1208, 1209)
  updateBanWidget(5, 1551, 1565, 1552)
  updateBanWidget(7, 1861, 1852, 1817)
  if account.noExp then
    nodes[1190].widget_text = ""
    nodes[1205].widget_text = localize("<*banReasonLowPractice>")
    nodes[683].visible = true
  end
  nodes[523].visible = not isModeBanned(1)
end

function updateAccount()
  updateAccountProperties()
  tryShowLastMatchResult()
  local nodes = interface.nodes
  local hasRight2 = account.specialRights >> 1 & 1 == 1
  nodes[957].visible = hasRight2
  nodes[1638].visible = hasRight2
  if hasRight2 and root.storage_closedRight2 == nil then
    nodes[452].visible = true
  end
  nodes[312].widget_text = account.name
  nodes[1174].widget_text = account.name
  if account.name ~= "" then
    local fn = getFontName(account.name)
    nodes[312].widget_fontName = fn
    nodes[1174].widget_fontName = fn
  end
  if currentSeason ~= nil then
    nodes[287].widget_text = getRanking(account.seasons1v1, currentSeason) .. " / " .. getRanking(account.seasons2v2, currentSeason)
  end
  nodes[316].widget_text = account.techPoints
  nodes[523].disabled = false
  nodes[133].disabled = false
  updateAllBanWidgets()
  nodes[801].disabled = false
  nodes[760].visible = priceListInited and hasPropLowCoef()
  nodes[1171].visible = #account.coupons > 0 or hasRight2
  local shownCoupons = tonumber(root.storage_shownCoupons)
  if shownCoupons == nil then
    shownCoupons = 0
  end
  nodes[868].visible = #account.coupons > math.floor(shownCoupons)
end

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

function stopMusic()
  if music ~= nil then
    interface.sound.f_stopMusic(music, 2000)
    music = nil
  end
end

function startMusicById(id)
  stopMusic()
  music = interface.sound.f_playMusic(id, 1, 2000)
end

function startMusic()
  startMusicById(math.random(2) + 2)
end

function encodeStringJson(str)
  local result = ""
  for i = 1, #str do
    local c = str:sub(i, i)
    if c == "'" then
      result = result .. "`"
    elseif c == "\"" then
      result = result .. "\\\""
    elseif c == "," then
      result = result .. "\\,"
    elseif c == "\\" then
      result = result .. "\\\\"
    else
      result = result .. c
    end
  end
  return result
end

function playStartSound()
  interface.sound.f_playSound(5, 1)
end

function startSandbox()
  local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
  local json = {
    factions = 42,
    player = 0,
    players = {
      4,
      8,
      16,
      32,
      64,
      128,
      256,
      512,
      1024,
      2048,
      4096,
      8192,
      16384,
      32768,
      65536,
      131072,
      262144,
      524288,
      1048576,
      2097152,
      4194304,
      8388608,
      16777216,
      33554432,
      67108864,
      134217728,
      268435456,
      536870912,
      1073741824,
      2147483648,
      4294967296,
      8589934592,
      17179869184,
      34359738368,
      68719476736,
      137438953472,
      274877906944,
      549755813888,
      1099511627776,
      2199023255552
    },
    seed = 0,
    scriptParameters = parameters,
    scriptsG = {
      "JnHcuvqS6ga_10",
      "sicpCjwFVT9_8",
      "6gqH17D5rDl_3",
      "t0RdMqvHcB9_14",
      "PqR6QgyQlHb_4",
      "KgbndOUtoob_10",
      "fIoO5t44ONj_8",
      "NydmBBD9kr6_4",
      "s03TBDxfi55_5",
      {
        "GOkEjX0t3G0_10",
        "specialUnit=107,trainWorkers=2"
      },
      "lGn8Ivf5qmb_3",
      {
        "kdrDA746k9d_4",
        "peacefulFaction=0,agressiveFaction=1"
      },
      {
        "X1uVftqwjI9_1",
        "relations='[[null,0,0],[null,1,2],[0,1,1],[1,0,1]]'"
      },
      {
        "PknWbweiKTj_2",
        "faction=0"
      },
      {
        "BkorbliOBbj_2",
        "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
      },
      "lFMtjJTcyml_11",
      {
        "jz0EOdJFAug_6",
        "smallAmount=10,bigAmount=10"
      },
      "Am5eQZtzjYd_8",
      "vUzAsp5omY9_11"
    },
    scriptsV = {
      "dKsZBCbnhVf_6",
      "i6wtqtGBgid_0",
      "BPoKSILDqIl_3",
      "wFs1okaN4Ng_2",
      {
        "nz4SD1WAHyj_0",
        "creatingUnits=" .. boolToStr(isPropertyAvailable(0) == 2)
      },
      "fBB0HwHlfzd_19",
      "uKeGCLnotPg_3",
      {
        "mCpWa2x0F7i_8",
        "height=1724,borders=350"
      },
      {
        "mkrXH0nVJC7_5",
        "unitTags=32"
      },
      "JDGR2Xa7qt5_1",
      {
        "up48OkgDf4d_2",
        "factions=1"
      }
    },
    parametersUrlG = "project/WarSelection/scenes/defaultG.json",
    parametersUrlV = "project/WarSelection/scenes/defaultV.json",
    generatorData = {
      size = {
        cellsize = 16384,
        passability = {
          cellsize = 16,
          offset = nil,
          size = {x = 1624, y = 1624}
        },
        size = {x = 407, y = 407}
      },
      mapParameters = {
        seed = os.time(),
        startPositions = 40,
        script = {
          name = "T1KvZeyfjb0_9",
          parameters = "woodScale=750,woodSize=50,terrainNoiseScale=750,terrainHeightScale=300,terrainMountainsScale=2500"
        },
        style = 5
      }
    }
  }
  log("Add task to start session sandbox")
  addStartSessionTask("startSingle", toJson(json), root.system_localFolder .. "/replay.rep")
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

function startMatchFinding(mode, size)
  if size == nil then
    size = 0
  end
  clearChooseModeWindows()
  gameMode = mode
  local json = {
    version = getVersionArray(),
    size = size,
    mode = mode,
    anonym = anonymMode
  }
  if root.lobby.f_sendCommand(6, toJson(json)) then
    log("Try start match finding (mode=" .. mode .. ")")
    disablePanel(7)
  else
    showError(localize("<*menuErrorNoLobby>"))
  end
end

function onStartMatchFinding(outdated)
  assert(gameMode ~= nil)
  log("Match finding started")
  local nodes = interface.nodes
  joinTime = os.time()
  disablePanel(8)
  nodes[46].visible = true
  nodes[47].disabled = false
  nodes[41].widget_text = getRandomHint()
  nodes[42].widget_text = modeNames[gameMode + 1]
  nodes[355].visible = outdated
  nodes[354].visible = false
  nodes[353].visible = false
  nodes[225].visible = false
  nodes[1339].visible = false
  nodes[52].visible = false
  if gameMode == 0 then
    nodes[354].visible = true
  elseif gameMode == 1 then
    nodes[353].visible = true
  elseif gameMode == 2 then
    nodes[225].visible = true
  elseif gameMode == 4 then
    nodes[52].visible = true
  elseif gameMode == 7 then
    nodes[1339].visible = true
  end
end

function onMatchFindingLeft(reason)
  if joinTime == nil then
    return
  end
  log("Match finding stop (reason=" .. reason .. ")")
  joinTime = nil
  local nodes = interface.nodes
  if reason == 2 then
    nodes[92].visible = true
  else
    enablePanel(22)
  end
  nodes[46].visible = false
end

function getDifficultyAnimals(difficulty)
  if difficulty == 0 then
    return 200
  elseif difficulty == 1 then
    return 300
  elseif difficulty == 2 then
    return 400
  else
    return 700
  end
end

function startHorde()
  local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
  local json = {
    factions = 17,
    player = 0,
    players = {
      2,
      4,
      8,
      16,
      32,
      64,
      128,
      256,
      512,
      1024,
      2048,
      4096,
      8192,
      16384,
      32768,
      65536
    },
    seed = 0,
    scriptParameters = parameters,
    scriptsG = {
      "JnHcuvqS6ga_10",
      "sicpCjwFVT9_8",
      "6gqH17D5rDl_3",
      "NydmBBD9kr6_4",
      "l5ib3BJVr9i_22",
      {
        "HWAIvxsaH9l_2",
        "weakBots=" .. tostring(difficulty == 0)
      },
      "Ov2UKssPOBi_7"
    },
    scriptsV = {
      "dKsZBCbnhVf_6",
      "i6wtqtGBgid_0",
      "BPoKSILDqIl_3",
      "kre2YStMyCj_19",
      "0gWl6YH1EDe_4",
      {
        "mCpWa2x0F7i_8",
        "height=1500,maxHeight=3000"
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
          size = {x = 1200, y = 1200}
        },
        size = {x = 301, y = 301}
      },
      mapParameters = {
        seed = os.time(),
        startPositions = 16,
        script = {
          name = "T1KvZeyfjb0_9",
          parameters = "woodScale=1000,woodSize=50,terrainNoiseScale=10000,terrainHeightScale=75,terrainMountainsScale=2000"
        },
        style = 5
      }
    }
  }
  log("Add task to start session horde")
  addStartSessionTask("startSingle", toJson(json), root.system_localFolder .. "/replay.rep")
end

function startSurvival()
  local animalsDangerousCount = getDifficultyAnimals(difficulty)
  local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
  local json = {
    factions = 4,
    player = 0,
    players = {8},
    seed = 0,
    scriptParameters = parameters,
    scriptsG = {
      "JnHcuvqS6ga_10",
      "sicpCjwFVT9_8",
      "6gqH17D5rDl_3",
      "PqR6QgyQlHb_4",
      "KgbndOUtoob_10",
      "NydmBBD9kr6_4",
      "s03TBDxfi55_5",
      {
        "kdrDA746k9d_4",
        "peacefulFaction=0,agressiveFaction=1,agressiveAmount=" .. animalsDangerousCount .. ",peacefulAmount=300"
      },
      {
        "GOkEjX0t3G0_10",
        "trainWorkers=2"
      },
      {
        "X1uVftqwjI9_1",
        "relations='[[null,0,0],[null,1,2],[0,1,1],[1,0,1]]'"
      },
      {
        "J3v7snqXfl7_10",
        "difficulty=" .. difficulty
      },
      "Rgi6rNgLAmd_5",
      {
        "PknWbweiKTj_2",
        "faction=0"
      },
      {
        "QmBfycUvwsi_4",
        "timeToWin=600"
      },
      {
        "BkorbliOBbj_2",
        "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
      },
      "lFMtjJTcyml_11",
      {
        "fIoO5t44ONj_8",
        "limit=200"
      },
      {
        "jz0EOdJFAug_6",
        "smallAmount=10,bigAmount=10"
      },
      "Am5eQZtzjYd_8"
    },
    scriptsV = {
      "dKsZBCbnhVf_6",
      "i6wtqtGBgid_0",
      "BPoKSILDqIl_3",
      "wFs1okaN4Ng_2",
      "fBB0HwHlfzd_19",
      "uKeGCLnotPg_3",
      {
        "mCpWa2x0F7i_8",
        "height=1724,borders=350"
      },
      {
        "mkrXH0nVJC7_5",
        "unitTags=32"
      },
      "JDGR2Xa7qt5_1",
      "VWZoanUldR4_5",
      {
        "up48OkgDf4d_2",
        "factions=1"
      }
    },
    parametersUrlG = "project/WarSelection/scenes/defaultG.json",
    parametersUrlV = "project/WarSelection/scenes/defaultV.json",
    generatorData = {
      size = {
        cellsize = 16384,
        passability = {
          cellsize = 16,
          offset = nil,
          size = {x = 1624, y = 1624}
        },
        size = {x = 407, y = 407}
      },
      mapParameters = {
        seed = os.time(),
        startPositions = 62,
        script = {
          name = "T1KvZeyfjb0_9",
          parameters = "woodScale=750,woodSize=50,terrainNoiseScale=750,terrainHeightScale=300,terrainMountainsScale=2500"
        },
        style = 5
      }
    }
  }
  log("Add task to start session survival")
  addStartSessionTask("startSingle", toJson(json), root.system_localFolder .. "/replay.rep")
end

function initSoundVolume()
  local nodes = interface.nodes
  local sound = interface.sound
  local storage = root.storage
  local soundVolume = tonumber(storage.soundVolume)
  if 1 < soundVolume then
    soundVolume = 1
  end
  sound.volume = soundVolume
  nodes[328].widget_current = math.floor(soundVolume * 100)
  local musicVolume = tonumber(storage.musicVolume)
  sound.musicVolume = musicVolume
  root.interface_store_sound_musicVolume = musicVolume
  local v = math.floor(musicVolume * 250)
  if 100 < v then
    v = 100
  end
  nodes[344].widget_current = v
end

function setScaleWidget()
  local nodes = interface.nodes
  local v = tonumber(root.storage_interfaceScale)
  if v == nil then
    v = 1
  end
  if v < 1 then
    v = (v - 0.5) * 100
  else
    v = v * 50
  end
  nodes[101].widget_current = math.floor(v)
end

function calcInterfaceScaleAuto(baseHeight)
  if baseHeight == nil then
    baseHeight = root.window_height
  end
  local res = baseHeight / 1080
  if res < 0.5 then
    res = 0.5
  end
  if 2 < res then
    res = 2
  end
  return res
end

function setInterfaceScale(setValue)
  root.interface.f_setScale(setValue, setValue)
  interfaceScale = setValue
  root.storage.f_set("interfaceScale", interfaceScale)
  updateViewportSize()
  if root.interface_scene_scripts_ready then
    root.interface_scene.f_sendEvent("initOffsets", toJson({
      left = interface.nodes[456].sizeX
    }))
  end
end

function setInterfaceScaleW(setValue)
  assert(setValue ~= nil)
  if setValue < 50 then
    setInterfaceScale(0.5 + setValue / 100)
  else
    setInterfaceScale(setValue / 50)
  end
end

function isValidRegion(propValue)
  return propValue + 0.001 >= regionCoef
end

function getPropValue(prop)
  local v = account.propValues[prop]
  if v == nil then
    return 0
  end
  return v
end

function hasPropLowCoef()
  for i = 0, 100 do
    local pv = getPropValue(i)
    if 0 < pv and not isValidRegion(pv) then
      return true
    end
  end
  return false
end

function updateAccountProperties()
  account.properties = ""
  local mx = 0
  for i = 1, #account.props do
    if mx < account.props[i][1] then
      mx = account.props[i][1]
    end
  end
  local sum = 0
  local c = 1
  local pos = 1
  for i = 0, mx do
    local prop = getPropValue(i)
    if isValidRegion(prop) then
      sum = sum + (1 << c - 1)
    end
    c = c + 1
    if c == 5 then
      account.properties = account.properties .. intToHex(sum)
      c = 1
      pos = pos + 1
      sum = 0
    end
  end
  if 0 < sum then
    account.properties = account.properties .. intToHex(sum)
  end
  local notHaveSpecialModes = isPropertyAvailable(0) ~= 2
  local nodes = interface.nodes
  nodes[207].visible = notHaveSpecialModes
  nodes[747].visible = notHaveSpecialModes
end

function reinitDemoAndMusic()
  joinTime = nil
  initSoundVolume()
  startMusic()
  startDemo()
  setObscuringPicture(3)
end

function startSession()
  assert(sessionWork == false)
  if not startSessionTask.demo then
    stopMusic()
  end
  local err
  if startSessionTask.command == "startSingle" then
    if startSessionTask.data2 == nil then
      err = root.session.f_startSingle(startSessionTask.data1)
    else
      err = root.session.f_startSingle(startSessionTask.data1, startSessionTask.data2)
    end
    if err == 1000 or err == 1001 then
      showError(localize("<*menuErrorPrivateMapObsolete>"))
    else
      assert(err == 0)
    end
  elseif startSessionTask.command == "startNetwork" then
    err = root.session.f_startNetwork(startSessionTask.data1, startSessionTask.data2)
    assert(err == 0)
  elseif startSessionTask.command == "startReplay" then
    if startSessionTask.data2 == nil then
      err = root.session.f_startReplay(startSessionTask.data1)
    else
      err = root.session.f_startReplay(startSessionTask.data1, startSessionTask.data2)
    end
    if err == 1 or err == 2 then
      showError(localize("<*menuErrorCorruptedDump>"))
    elseif err == 4 then
      showError(localize("<*menuErrorObsoleteReplay>"))
    end
  elseif startSessionTask.command == "startSingleDump" then
    err = root.session.f_startSingleDump(startSessionTask.data1, startSessionTask.data2, startSessionTask.data3)
    if err == 2 then
      showError(localize("<*menuErrorCorruptedDump>"))
    elseif err == 3 then
      showError(localize("<*menuErrorObsoleteDump>"))
    end
  end
  demoSessionWork = startSessionTask.demo
  startSessionTask = nil
  if err == 0 then
    sessionWork = true
    if not demoSessionWork then
      playStartSound()
      clearChooseModeWindows()
      interface.active = false
    end
  else
    sessionWork = false
    reinitDemoAndMusic()
  end
end

function addStartSessionTask(command, data1, data2, data3, demo)
  if startSessionTask ~= nil then
    return
  end
  if sessionWork then
    assert(root.session.gameplay ~= nil)
    root.session.f_break(true)
  end
  startSessionTask = {
    command = command,
    data1 = data1,
    data2 = data2,
    data3 = data3,
    demo = demo
  }
end

function getDemoJson(seed)
  return {
    factions = 5,
    player = 0,
    players = {
      4,
      8,
      16
    },
    seed = seed,
    scriptsG = {
      "JnHcuvqS6ga_10",
      "sicpCjwFVT9_8",
      "NydmBBD9kr6_4",
      "s03TBDxfi55_5",
      "OLMsqKtYQJ7_8"
    },
    scriptsV = {
      "dKsZBCbnhVf_6",
      "i6wtqtGBgid_1",
      {
        "mCpWa2x0F7i_8",
        "height=1724,borders=350"
      },
      {
        "XmQ2bFO4RWa_2",
        "snow=false"
      }
    },
    parametersUrlG = "project/WarSelection/scenes/defaultG.json",
    parametersUrlV = "project/WarSelection/scenes/defaultV.json",
    generatorData = {
      size = {
        cellsize = 16384,
        passability = {
          cellsize = 16,
          offset = nil,
          size = {x = 400, y = 400}
        },
        size = {x = 101, y = 101}
      },
      mapParameters = {
        seed = 6000,
        startPositions = 3,
        script = {
          name = "T1KvZeyfjb0_9",
          parameters = "woodScale=3000,woodSize=50,terrainNoiseScale=1500,terrainHeightScale=100,terrainMountainsScale=2500"
        },
        style = 5
      }
    }
  }
end

function startDemo()
  assert(not sessionWork or root.session.gameplay ~= nil)
  local nodes = interface.nodes
  if not nodes[1185].widget_checked then
    return
  end
  local seed = os.time()
  local json = getDemoJson(seed)
  log("Add task to start session demo")
  log("Demo seed = " .. seed)
  addStartSessionTask("startSingle", toJson(json), nil, nil, true)
end

function rankingsUpdateTop(pos, data, myAccId)
  local nodes = interface.nodes
  local w = nodes[rateName[pos]].widget
  setWidgetText(w, data.name)
  nodes[ratePoints[pos]].widget_text = math.floor(data.rating)
  rateFirst3[pos] = data.name
  if math.floor(data.user) == myAccId then
    rankingOutOfList = false
  end
end

function rankingsClearPos(pos)
  local nodes = interface.nodes
  assert(1 <= pos and pos <= 20)
  local w = nodes[rateName[pos]].widget
  w.text = "..."
  w.fontName = fonts.en
  nodes[ratePoints[pos]].widget_text = "..."
  if 4 <= pos then
    nodes[ratePosition[pos - 3]].widget_text = "..."
  end
end

function rankingsUpdatePos(listNum, pos, data, myAccId)
  if pos <= 3 then
    rankingsUpdateTop(pos, data, myAccId)
    return
  end
  if listNum <= 3 then
    return
  end
  if listNum == 4 and pos ~= 4 then
    rankingsClearPos(4)
    return
  end
  local nodes = interface.nodes
  local w1 = nodes[rateName[listNum]].widget
  if data.name ~= "" then
    setWidgetText(w1, data.name)
  end
  local w2 = nodes[ratePoints[listNum]].widget
  w2.text = math.floor(data.rating)
  local n = nodes[ratePosition[listNum - 3]]
  local top = n.localTop
  local w3 = n.widget
  w3.text = pos
  if math.floor(data.user) == myAccId then
    rankingOutOfList = false
    local n = nodes[596]
    n.visible = true
    n.localTop = top
    w1.font_textColor_value = ratePlayerNameColor
    w2.font_textColor_value = ratePlayerPointsColor
    w3.font_textColor_value = ratePlayerPositionColor
  else
    w1.font_textColor_value = rateDefaultNameColor
    w2.font_textColor_value = rateDefaultPointsColor
    w3.font_textColor_value = rateDefaultPositionColor
  end
end

function shopShow()
  local nodes = interface.nodes
  local vis = nodes[142].visible
  clearChooseModeWindows()
  nodes[142].visible = not vis
  if not vis then
    stopMusic()
    root.interface_store_active = true
  else
    startMusic()
  end
  nodes[490].visible = false
  local storage = root.storage
  storage.f_set("shopTP", currentShopTp)
end

function unloadObscuringPicture()
  local nodes = interface.nodes
  local content = interface.content
  local image = content.image[nodes[1730].widget_image]
  content.resetTexture = image.texture
end

function setObscuringPicture(duration)
  local nodes = interface.nodes
  if nodes[1185].widget_checked then
    demoShowTime = os.time() + duration
  else
    demoShowTime = nil
  end
  local n = nodes[986]
  n.visible = true
  n.color_a = 255
  nodes[1730].widget_image = bigPictures[math.random(#bigPictures)]
  checkObsPic = true
end

function startMultiplay(server, ticket)
  assert(server ~= nil)
  assert(ticket ~= nil)
  clearChooseModeWindows()
  joinTime = nil
  local nodes = interface.nodes
  nodes[46].visible = false
  nodes[92].visible = false
  enablePanel(23)
  log("Add task to start session network")
  addStartSessionTask("startNetwork", server, ticket)
end

function joinPrivate(code)
  local nodes = interface.nodes
  if code == nil then
    code = nodes[77].widget_text_text
  end
  code = removeBadSimbolsFromCode(code)
  if code:len() == 6 then
    showError(localize("<*menuErrorWrongKeySquadForPrivate>"))
    return
  end
  local json = {
    cmd = 2,
    version = getVersionArray(),
    enter = {code = code}
  }
  if root.lobby.f_sendCommand(16, toJson(json)) then
    nodes[80].disabled = true
    disablePanel(12)
  else
    showError(localize("<*menuErrorNoLobby>"))
  end
end

function joinGroup(code)
  local nodes = interface.nodes
  if code == nil then
    code = nodes[621].widget_text_text
  end
  code = removeBadSimbolsFromCode(code)
  if code:len() == 8 then
    showError(localize("<*menuErrorWrongKeyPrivateForSquad>"))
    return
  end
  local json = {
    version = getVersionArray(),
    code = code
  }
  if root.lobby.f_sendCommand(9, toJson(json)) then
    disablePanel(9)
    nodes[476].disabled = true
    nodes[737].disabled = true
  else
    showError(localize("<*menuErrorNoLobby>"))
  end
end

function setGamma(value)
  local colorLut = root.render_scene_colorLut
  if colorLut == nil then
    return
  end
  colorLut.gamma = value / 100
  root.storage.f_set("gamma2", value)
end

function updateViewportSize()
end

function getReplayMapCodeFromClipboard()
  local code = root.system_clipboard_get
  local a = string.find(code, "map-")
  if a == nil then
    return nil
  end
  code = string.sub(code, a + 4)
  local sec = string.sub(code, 1, 4)
  code = string.sub(code, 5)
  local sha1 = root.functions.cryptography.f_sha1(code)
  if sec ~= string.sub(sha1, 1, 4) then
    return nil
  end
  return code
end

function getRankingsTable()
  local nodes = interface.nodes
  if not rankingsConnected then
    rankingsConnected = true
    root.rankings.f_connect("wss://ratings.warselect.io", "2094ij4njgvf")
  end
  nodes[217].visible = false
  nodes[97].visible = true
  nodes[893].disabled = true
  nodes[892].disabled = true
  for i = 1, 20 do
    rankingsClearPos(i)
  end
  rankingOutOfList = true
  local accId = root.lobby_accountId
  local season = nodes[1191].widget_lines_size - nodes[1191].widget_value - 1
  root.rankings.f_getByPlace(nodes[1635].widget_value, season, 0, 3)
  root.rankings.f_getByUser(nodes[1635].widget_value, season, accId, 13, 20)
end

function getAccountServerKey(key)
  local json = {operation = 1, key = key}
  return root.lobby.f_sendCommand(200, toJson(json))
end

function setAccountServerKey(key, value)
  local json = {
    operation = 0,
    key = key,
    value = value
  }
  return root.lobby.f_sendCommand(200, toJson(json))
end

local nodes = interface.nodes
rateDefaultPositionColor = nodes[663].widget_font_textColor_value
rateDefaultNameColor = nodes[703].widget_font_textColor_value
rateDefaultPointsColor = nodes[875].widget_font_textColor_value
ratePlayerPositionColor = nodes[664].widget_font_textColor_value
ratePlayerNameColor = nodes[704].widget_font_textColor_value
ratePlayerPointsColor = nodes[876].widget_font_textColor_value
if webVersion then
  webMustInit = true
  nodes[137].visible = false
  nodes[1688].visible = false
  nodes[1691].visible = false
end
local storage = root.storage
local firstLaunch = storage.soundVolume == nil
storage.f_setIfEmpty("rQuality", "3")
storage.f_setIfEmpty("soundVolume", "1.0")
storage.f_setIfEmpty("cameraSpeed", "2000")
storage.f_setIfEmpty("cameraInertia", "200")
storage.f_setIfEmpty("bordersScroll", "1")
storage.f_setIfEmpty("showHealthBarMode", "1")
storage.f_setIfEmpty("musicVolume", "0.2")
storage.f_setIfEmpty("windowed", "0")
storage.f_setIfEmpty("tutorialDone", "0")
storage.f_setIfEmpty("vSync", "1")
storage.f_setIfEmpty("shopTP", currentShopTp)
storage.f_setIfEmpty("showDemo", "1")
storage.f_setIfEmpty("gamma2", "220")
root.window.f_setCaption("War Selection")
nodes[490].visible = currentShopTp > tonumber(storage.shopTP)
sendReplaysAddr = storage.replayAddr
if sendReplaysAddr == nil then
  nodes[154].widget_text_text = ""
else
  nodes[154].widget_text_text = sendReplaysAddr
end
local sysTime = root.system_time
local eaShowTime = tonumber(storage.eaShowTime)
if eaShowTime ~= nil and sysTime - eaShowTime > 259200 then
  storage.f_set("eaShowTime", sysTime)
  nodes[332].visible = true
end
local sessionStartTime = tonumber(storage.sessionStartTime)
if sessionStartTime ~= nil and os.time() - sessionStartTime < 7200 then
  assert(storage.sessionServer ~= nil)
  assert(storage.sessionTicket ~= nil)
  nodes[1158].visible = true
  disablePanel(10)
end
nodes[870].visible = firstLaunch
nodes[120].disabled = true
updateSeasons()
local curLang = root.language
nodes[319].disabled = false
nodes[342].disabled = false
nodes[345].disabled = false
nodes[359].disabled = false
nodes[378].disabled = false
nodes[387].disabled = false
nodes[390].disabled = false
nodes[388].disabled = false
nodes[389].disabled = false
nodes[462].disabled = false
nodes[115].disabled = false
nodes[517].disabled = false
nodes[580].disabled = false
nodes[581].disabled = false
nodes[813].disabled = false
nodes[1173].disabled = false
nodes[928].disabled = false
nodes[1198].disabled = false
nodes[1202].disabled = false
nodes[1564].disabled = false
nodes[603].disabled = false
nodes[314].disabled = false
nodes[324].disabled = false
if curLang == "en" then
  nodes[319].disabled = true
  nodes[533].visible = true
elseif curLang == "de" then
  nodes[342].disabled = true
  nodes[515].visible = true
elseif curLang == "ru" then
  nodes[345].disabled = true
  nodes[514].visible = true
elseif curLang == "es" then
  nodes[359].disabled = true
  nodes[513].visible = true
elseif curLang == "fr" then
  nodes[378].disabled = true
  nodes[512].visible = true
elseif curLang == "cn" then
  nodes[387].disabled = true
  nodes[511].visible = true
elseif curLang == "da" then
  nodes[390].disabled = true
  nodes[510].visible = true
elseif curLang == "pl" then
  nodes[388].disabled = true
  nodes[534].visible = true
elseif curLang == "it" then
  nodes[389].disabled = true
  nodes[509].visible = true
elseif curLang == "kr" then
  nodes[462].disabled = true
  nodes[508].visible = true
elseif curLang == "sk" then
  nodes[115].disabled = true
  nodes[281].visible = true
elseif curLang == "cs" then
  nodes[517].disabled = true
  nodes[519].visible = true
elseif curLang == "br" then
  nodes[580].disabled = true
  nodes[588].visible = true
elseif curLang == "tr" then
  nodes[581].disabled = true
  nodes[612].visible = true
elseif curLang == "ka" then
  nodes[813].disabled = true
  nodes[904].visible = true
elseif curLang == "nl" then
  nodes[1173].disabled = true
  nodes[1163].visible = true
elseif curLang == "sr" then
  nodes[928].disabled = true
  nodes[335].visible = true
elseif curLang == "hu" then
  nodes[1198].disabled = true
  nodes[333].visible = true
elseif curLang == "tw" then
  nodes[1202].disabled = true
  nodes[1212].visible = true
elseif curLang == "hr" then
  nodes[1564].disabled = true
  nodes[1475].visible = true
elseif curLang == "ja" then
  nodes[603].disabled = true
  nodes[141].visible = true
elseif curLang == "th" then
  nodes[314].disabled = true
  nodes[108].visible = true
elseif curLang == "fa" then
  nodes[324].disabled = true
  nodes[401].visible = true
end
for _, butId in ipairs(culturesSwitchButtons) do
  local set = nodes[butId].widget_bottom_set
  set.disabled = set.normal
end
local privateRegion = tonumber(root.storage_privateRegion)
if privateRegion == nil then
  privateRegion = 0
end
nodes[376].widget_value = privateRegion
nodes[1185].widget_checked = toBool(storage.showDemo)
nodes[237].visible = false
nodes[347].visible = editorMode
nodes[307].visible = editorMode
nodes[207].visible = true
nodes[747].visible = true
nodes[232].disabled = true
nodes[489].disabled = true
nodes[537].visible = editorMode
nodes[540].visible = true
local privateGameName = root.storage_privateGameName
if privateGameName == nil then
  privateGameName = localize("<*defaultMatchName>")
end
nodes[15].widget_text_text = privateGameName
local w = interface.nodes[310].widget
local lines = w.lines
lines.f_clear()
lines.f_create(mapSizes[1] .. playersCountText[1] .. playersCountPrivate[1] .. playersCountText[2])
lines.f_create(mapSizes[2] .. playersCountText[1] .. playersCountPrivate[2] .. playersCountText[2])
lines.f_create(mapSizes[3] .. playersCountText[1] .. playersCountPrivate[3] .. playersCountText[2])
lines.f_create(mapSizes[4] .. playersCountText[1] .. playersCountPrivate[4] .. playersCountText[2])
lines.f_create(mapSizes[5] .. playersCountText[1] .. playersCountPrivate[5] .. playersCountText[2])
lines.f_create(mapSizes[6] .. playersCountText[1] .. playersCountPrivate[6] .. playersCountText[2])
w.value = 0
