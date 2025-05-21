local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
end
disconnectWidgets = {
  21,
  20,
  19,
  36
}
groupLeaderNameFrames = {
  nil,
  158,
  159
}
groupLeaderNameWidgets = {
  86,
  27,
  23
}
groupSlaveNameFrames = {
  nil,
  165,
  164
}
groupSlaveNameWidgets = {
  106,
  107,
  108
}
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

function showError(text)
  local nodes = interface.nodes
  nodes[7].visible = true
  nodes[8].widget_text = text
end

function onServerInit(data)
  local nodes = interface.nodes
  connectServerTime = data.serverTime
  currentSeason = data.season1v1
  chestPrice = data.chestPrice
  connectLocalTime = os.time()
  playDay = data.playDay
  for i = 1, #disconnectWidgets do
    nodes[disconnectWidgets[i]].visible = false
  end
end

function onDisconnect()
  local nodes = interface.nodes
  onStopMatchFinding()
  for i = 1, #disconnectWidgets do
    nodes[disconnectWidgets[i]].visible = true
  end
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

function onSessionStart()
  resetPanels()
  interface.active = false
  root.interface_loading_active = true
end

function intToHex(int)
  assert(0 <= int)
  if int < 10 then
    return string.char(int + 48)
  end
  return string.char(int + 87)
end

function isValidRegion(propValue)
  return propValue + 0.001 >= regionCoef
end

function getFontName(text)
  assert(text ~= "")
  local font = fonts[root.functions.f_detectLanguage(text)]
  assert(font ~= nil)
  return font
end

function getPropValue(prop)
  local v = account.propValues[prop]
  if v == nil then
    return 0
  end
  return v
end

function updateAccountProperties()
  account.properties = ""
  sum = 0
  c = 1
  pos = 1
  for i = 1, #account.propValues do
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
  if sum > 0 then
    account.properties = account.properties .. intToHex(sum)
  end
  requestPriceListIfNeed()
end

function getVersionArray()
  local v = root.f_version(false)
  return {
    tonumber(v[1]),
    v[6],
    tonumber(v[2]),
    tonumber(v[3]),
    v[4],
    tonumber(v[5])
  }
end

function startMatchFinding()
  local json = {
    version = getVersionArray(),
    mode = 7
  }
  if root.lobby.f_sendCommand(6, toJson(json)) then
    log("Start matchfinding (TugOfWar)")
    local nodes = interface.nodes
    nodes[87].disabled = true
    nodes[89].disabled = true
    nodes[1].disabled = true
  else
    showError(localize("<*menuErrorNoLobby>"))
  end
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
        local w = nodes[widgetText].widget
        if bm.reason == 0 then
          w.text = localize("<*banReason0>")
        elseif bm.reason == 1 then
          w.text = localize("<*banReason1>")
        elseif bm.reason == 2 then
          w.text = localize("<*banReason2>")
        elseif bm.reason == 3 then
          w.text = localize("<*banReason3>")
        elseif bm.reason == 4 then
          w.text = localize("<*banReason4>")
        elseif bm.reason == 5 then
          w.text = localize("<*banReason5>")
        elseif bm.reason == 6 then
          w.text = localize("<*banReason6>")
        end
      end
    end
  end
  nodes[widgetMain].visible = ban
end

function updateAllBanWidgets()
  local nodes = interface.nodes
  hasBan = false
  updateBanWidget(7, 55, 57, 59)
  nodes[65].disabled = isModeBanned(7)
end

function startMultiplay(server, ticket)
  assert(server ~= nil)
  assert(ticket ~= nil)
  joinTime = nil
  local nodes = interface.nodes
  hideAllWindows()
  log("Start session network")
  root.session_startNetwork = {server, ticket}
  onSessionStart()
end

function onStartMatchFinding(outdated)
  local nodes = interface.nodes
  joinTime = os.time()
  hideAllWindows()
  nodes[44].visible = true
  nodes[46].disabled = false
  nodes[6].visible = outdated
  if randomTeam then
    nodes[5].visible = true
    nodes[101].visible = false
  else
    nodes[5].visible = false
    nodes[101].visible = true
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

function joinGroup()
  local nodes = interface.nodes
  local code = nodes[53].widget_text_text
  code = removeBadSimbolsFromCode(code)
  if code:len() ~= 6 then
    nodes[111].visible = true
    return
  end
  local json = {
    version = getVersionArray(),
    code = code
  }
  if root.lobby.f_sendCommand(9, toJson(json)) then
    nodes[56].disabled = true
    nodes[58].disabled = true
  else
    showError(localize("<*menuErrorNoLobby>"))
  end
end

function updateGroupPlayers(playersList)
  local nodes = interface.nodes
  for i = 1, #groupLeaderNameWidgets do
    local n1f
    local id = groupLeaderNameFrames[i]
    if id ~= nil then
      n1f = nodes[id]
    end
    local n1t = nodes[groupLeaderNameWidgets[i]]
    local n2f
    local id = groupSlaveNameFrames[i]
    if id ~= nil then
      n2f = nodes[id]
    end
    local n2t = nodes[groupSlaveNameWidgets[i]]
    if i <= #playersList then
      if n1f ~= nil then
        n1f.disabled = false
      end
      if n2f ~= nil then
        n2f.disabled = false
      end
      n1t.visible = true
      n2t.visible = true
      n1t.widget_text = playersList[i]
      n2t.widget_text = playersList[i]
    else
      if n1f ~= nil then
        n1f.disabled = true
      end
      if n2f ~= nil then
        n2f.disabled = true
      end
      n1t.visible = false
      n2t.visible = false
    end
  end
  nodes[87].disabled = #playersList <= 1
end

function onGroupOperationResult(data)
  local errorCode = tonumber(data.error)
  local nodes = interface.nodes
  nodes[58].disabled = false
  nodes[56].disabled = false
  if errorCode == 0 then
    hideAllWindows()
    nodes[68].visible = true
    nodes[78].disabled = false
  elseif errorCode == 1 then
    resetPanels()
  elseif errorCode == 2 or errorCode == 9 then
    nodes[111].visible = true
  elseif errorCode == 3 then
    showError(localize("<*menuErrorGroupBadVersion>"))
  elseif errorCode == 4 then
    nodes[104].visible = true
  elseif errorCode == 5 then
  elseif errorCode == 7 then
    local banEnd = tonumber(data.banPeriod)
    showError(localize("<*matchfindingBan/0>" .. toTimeStr(banEnd) .. "<*matchfindingBan/1>"))
  else
    log("onGroupOperationResult " .. errorCode)
  end
end

function onGroupCreated(code)
  local nodes = interface.nodes
  hideAllWindows()
  nodes[67].visible = true
  nodes[83].widget_text_text = code
  local id = groupLeaderNameWidgets[1]
  nodes[id].visible = true
  nodes[id].widget_text = account.name
  nodes[groupLeaderNameFrames[2]].disabled = true
  nodes[groupLeaderNameWidgets[2]].visible = false
  nodes[groupLeaderNameFrames[3]].disabled = true
  nodes[groupLeaderNameWidgets[3]].visible = false
  nodes[89].disabled = false
  nodes[87].disabled = true
end

function toStrWithSign(num)
  if 0 <= num then
    return "+" .. num
  else
    return "" .. num
  end
end

function tryShowLastMatchResult(json)
  if json == nil then
    return
  end
  if json.mode ~= 7 then
    return
  end
  lastMatchStartTime = json.startTime
  local storage = root.storage
  local storedMatchTime = tonumber(storage.lastMatchTime)
  if lastMatchStartTime == storedMatchTime then
    return
  end
  local nodes = interface.nodes
  storage.f_set("lastMatchTime", lastMatchStartTime)
  nodes[69].visible = true
  local techPoints = json.techPoints
  local state = json.state
  nodes[71].visible = false
  nodes[82].visible = false
  if state == 1 then
    nodes[71].visible = true
  elseif state == 0 then
    nodes[82].visible = true
  end
  if techPoints ~= nil then
    local mult = json.techPointsMutiplier
    if mult == nil then
      mult = 1
    end
    local tp = techPoints // mult
    local bonus = techPoints - tp
    nodes[17].widget_text = toStrWithSign(techPoints)
    nodes[99].visible = bonus ~= 0
    nodes[110].widget_text = toStrWithSign(tp)
    nodes[115].widget_text = toStrWithSign(bonus)
  end
end

function onStopMatchFinding()
  local nodes = interface.nodes
  joinTime = nil
  resetPanels()
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

function startTugOfWarSingle()
  if not root.projectLoaded then
    return
  end
  local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
  local json = {
    factions = 6,
    player = 0,
    players = {
      1,
      2,
      4,
      8,
      16,
      32
    },
    teams = {
      {
        0,
        2,
        4
      },
      {
        1,
        3,
        5
      }
    },
    seed = 0,
    scriptParameters = parameters,
    scriptsG = {
      "JnHcuvqS6ga_10",
      "sicpCjwFVT9_8",
      "eMjoqml7Qfb_25"
    },
    scriptsV = {
      "dKsZBCbnhVf_6",
      "i6wtqtGBgid_0",
      "t1AxUmZaZ41_1",
      "uKeGCLnotPg_3",
      "mCpWa2x0F7i_8",
      "mkrXH0nVJC7_5",
      "JDGR2Xa7qt5_0"
    },
    parametersUrlG = "project/WarSelection/scenes/defaultG.json",
    parametersUrlV = "project/WarSelection/scenes/defaultV.json",
    generatorData = {
      seed = os.time(),
      size = {
        cellsize = 16384,
        passability = {
          cellsize = 16,
          offset = nil,
          size = {x = 500, y = 200}
        },
        size = {x = 126, y = 51}
      },
      mapParameters = {
        factions = 2,
        generatorParameters = {
          terrainNoiseScale = 1500,
          heightScale = 100,
          mountainsScale = 2500,
          woodScale = 750,
          woodSize = 50,
          symmetry = math.random(1, 2),
          style = 3,
          minStartPointsDistance = 1500000
        }
      }
    }
  }
  log("Start session tugOfWar")
  local err = root.session.f_startSingle(toJson(json), root.system_localFolder .. "/replay.rep")
  assert(err == 0)
  onSessionStart()
end

function hideAllWindows()
  local nodes = interface.nodes
  nodes[39].visible = false
  nodes[29].visible = false
  nodes[44].visible = false
  nodes[67].visible = false
  nodes[68].visible = false
  nodes[65].visible = false
  nodes[54].visible = false
  if nodes[74].visible then
    nodes[74].visible = false
    startMusic()
    root.interface_storeWeb_active = false
  end
end

function resetPanels()
  local nodes = interface.nodes
  hideAllWindows()
  nodes[39].visible = true
  nodes[1].disabled = false
end

function requestPriceListIfNeed()
  local nodes = interface.nodes
  if not nodes[41].disabled then
    return false
  end
  if root.launcher.currency.name == "" then
    return false
  end
  root.lobby_sendCommand = {
    2,
    toJson(root.launcher.currency.signed)
  }
  return true
end

function calcInterfaceScaleAuto()
  local res = root.window_height / 1080
  if res < 0.5 then
    res = 0.5
  end
  if 2 < res then
    res = 2
  end
  return res
end

function setInterfaceScale(setValue)
  root.interface_setScale = {setValue, setValue}
  interfaceScale = setValue
  root.storage.f_set("interfaceScale", interfaceScale)
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
  startMusicById(math.random(3) - 1)
end

function initSoundVolume()
  local sound = interface.sound
  local storage = root.storage
  local soundVolume = tonumber(storage.soundVolume)
  if 1 < soundVolume then
    soundVolume = 1
  end
  sound.volume = soundVolume
  local musicVolume = tonumber(storage.musicVolume)
  sound.musicVolume = musicVolume
  root.interface_storeWeb_sound_musicVolume = musicVolume
end
