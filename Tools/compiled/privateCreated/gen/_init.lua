privatePlayersList = {
  142,
  143,
  144,
  145,
  146,
  147,
  148,
  149,
  150,
  151,
  152,
  153,
  154,
  155,
  156,
  157,
  158,
  159,
  160,
  161,
  162,
  163,
  164,
  165,
  166,
  167,
  168,
  169,
  170,
  171,
  172,
  173,
  174,
  175,
  176,
  177
}
privateTeamsList = {
  217,
  218,
  219,
  220,
  221,
  222,
  223,
  224,
  225,
  226,
  227,
  228,
  229,
  230,
  231,
  232,
  233,
  234,
  235,
  236,
  237,
  238,
  239,
  240,
  241,
  242,
  243,
  244,
  245,
  246,
  247,
  248,
  249,
  250,
  251,
  252
}
privatePlayersKickWidgets = {
  345,
  346,
  347,
  348,
  349,
  350,
  351,
  352,
  353,
  354,
  355,
  356,
  357,
  358,
  359,
  360,
  361,
  362,
  363,
  364,
  365,
  366,
  367,
  368,
  369,
  370,
  371,
  372,
  373,
  374,
  375,
  376,
  377,
  378,
  379,
  380
}
difficultyNames = {
  localize("<*menuGameDifficility/1>"),
  localize("<*menuGameDifficility/2>"),
  localize("<*menuGameDifficility/3>"),
  localize("<*menuGameDifficility/4>")
}
defeatConditions = {
  localize("<*mainMenuDefeatConditions/0>"),
  localize("<*mainMenuDefeatConditions/1>")
}
mapSizes = {
  localize("<*mapSizes/0>"),
  localize("<*mapSizes/1>"),
  localize("<*mapSizes/2>"),
  localize("<*mapSizes/3>"),
  localize("<*mapSizes/4>"),
  localize("<*mapSizes/5>")
}
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
playersCountPrivate = {
  4,
  6,
  8,
  12,
  20,
  31
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

function setCurrentLineAndScroll(line)
  local nodes = interface.nodes
  local w = nodes[42].widget
  w.currentLine = line
  local size = w.lines_size
  w.verticalSlider_current = w.verticalSlider_max * line // size
  if line == 0 then
    nodes[25].widget_text = localize("<*privateGameRandomTeam>")
  else
    nodes[25].widget_text = customMapData.teams[line].name
  end
end

function updatePrivatePlayersList()
  assert(listOfPrivatePlayers ~= nil)
  local pn = #listOfPrivatePlayers
  local text = localize("<*countOfPlayers/0>" .. pn .. "<*countOfPlayers/1>" .. privateMaxPlayers .. "<*countOfPlayers/2>")
  local nodes = interface.nodes
  nodes[51].widget_text = text
  nodes[47].disabled = customMapData == nil and pn <= 1
  local showTeams = nodes[15].visible or customMapData ~= nil
  local facsOccup = {}
  for i, v in ipairs(privatePlayersList) do
    local n = nodes[v]
    local kn = nodes[privatePlayersKickWidgets[i]]
    local nn = nodes[privateTeamsList[i]]
    if slotsOfPrivatePlayers[i] ~= 255 then
      local pl = slotsOfPrivatePlayers[i]
      local plr = listOfPrivatePlayers[pl]
      assert(plr.name ~= "")
      setWidgetText(n.widget, plr.name)
      n.visible = true
      kn.visible = myPrivatePlayer == 1 and 1 < i
      nn.visible = showTeams
      if customMapData == nil then
        local tm = math.floor(listOfPrivateTeams[pl])
        if tm == 255 then
          nn.widget_text = "?"
        else
          nn.widget_text = tm + 1
        end
      elseif plr.faction == nil then
        nn.widget_text = "?"
      else
        facsOccup[plr.faction + 1] = true
        nn.widget_text = plr.faction + 1
      end
    else
      n.visible = false
      kn.visible = false
      nn.visible = false
    end
  end
  if customMapData ~= nil then
    local teamsOccup = {}
    for _, _ in ipairs(customMapData.teams) do
      table.insert(teamsOccup, {0, 0})
    end
    local linesF = nodes[24].widget_lines
    local linesT = nodes[42].widget_lines
    for i, v in ipairs(customMapData.factions) do
      if v.notPlayable then
        linesF.f_createSingle("")
      else
        local to = teamsOccup[v.team]
        to[2] = to[2] + 1
        if facsOccup[i] then
          linesF[i] = "X " .. v.name
          to[1] = to[1] + 1
        else
          linesF[i] = v.name
        end
      end
    end
    for i, v in ipairs(customMapData.teams) do
      if 0 < v.players then
        linesT[i] = v.name .. " (" .. teamsOccup[i][1] .. "/" .. teamsOccup[i][2] .. ")"
      else
        linesT.f_create()
      end
    end
  end
end

function changePrivatePlayerTeam(player, team)
  assert(player <= #listOfPrivateTeams)
  listOfPrivateTeams[player] = team
  local nodes = interface.nodes
  for i, _ in ipairs(privatePlayersList) do
    if slotsOfPrivatePlayers[i] == player then
      local nn = nodes[privateTeamsList[i]]
      if team == 255 then
        nn.widget_text = "?"
        break
      end
      nn.widget_text = team + 1
      break
    end
  end
end

function kickPrivatePlayer(pos)
  local json = {
    cmd = 6,
    player = slotsOfPrivatePlayers[pos] - 1
  }
  root.lobby.f_sendCommand(16, toJson(json))
end

function onPrivateFactionSetFail(reason, prevFaction)
  listOfPrivatePlayers[myPrivatePlayer].faction = prevFaction
  local nodes = interface.nodes
  if prevFaction == nil then
    nodes[24].widget_value = 0
    setCurrentLineAndScroll(0)
  else
    nodes[24].widget_value = prevFaction + 1
    setCurrentLineAndScroll(customMapData.factions[prevFaction + 1].team)
  end
end

function onPrivateFactionSet(player, faction)
  listOfPrivatePlayers[player].faction = faction
  updatePrivatePlayersList()
end

function joinedPrivate(creator, code, name, mapCode, maxPlayers, scriptsG, scriptsV, customMap, devMode, region, generatorData, teamMatch)
  interface.active = true
  if scriptsG == nil then
    scriptsG = {}
  end
  if scriptsV == nil then
    scriptsV = {}
  end
  iCreator = creator
  privateMaxPlayers = math.floor(maxPlayers)
  local nodes = interface.nodes
  nodes[32].visible = devMode
  nodes[17].visible = customMap ~= nil
  nodes[44].visible = nodes[17].visible
  if customMap ~= nil then
    customMapData = customMap
    if customMapData.name ~= nil then
      nodes[23].widget_text = customMapData.name
    else
      nodes[23].widget_text = "map-" .. mapCode
    end
    local linesF = nodes[24].widget_lines
    local linesT = nodes[42].widget_lines
    nodes[24].widget_dropDown_hideEmptyLines = true
    nodes[42].widget_hideEmptyLines = true
    linesF.f_clear()
    linesF.f_create(localize("<*privateGameRandomFaction>"))
    linesT.f_clear()
    linesT.f_create(localize("<*privateGameRandomTeam>"))
    for _, v in ipairs(customMapData.teams) do
      v.players = 0
    end
    for _, v in ipairs(customMapData.factions) do
      local team = customMapData.teams[v.team]
      if v.notPlayable then
        linesF.f_createSingle("")
      else
        team.players = team.players + 1
        linesF.f_createSingle(v.name)
      end
    end
    for _, v in ipairs(customMapData.teams) do
      if v.players > 0 then
        linesT.f_create(v.name)
      else
        linesT.f_create("")
      end
    end
    if #listOfPrivatePlayers == 0 then
      nodes[24].widget_value = 0
      setCurrentLineAndScroll(0)
    else
      local myFac = listOfPrivatePlayers[myPrivatePlayer].faction
      if myFac == nil then
        nodes[24].widget_value = 0
        setCurrentLineAndScroll(0)
      else
        nodes[24].widget_value = myFac
        setCurrentLineAndScroll(customMapData.factions[myFac].team)
      end
    end
  end
  nodes[10].visible = creator
  nodes[47].visible = creator
  nodes[5].visible = not creator
  nodes[46].widget_text = getRegionName(region)
  nodes[28].visible = true
  nodes[49].disabled = false
  nodes[47].disabled = customMapData == nil
  nodes[8].widget_text_text = code
  nodes[2].widget_text = name
  nodes[1].visible = true
  nodes[15].visible = teamMatch
  nodes[35].visible = true
  if teamMatch then
    nodes[27].widget_text = localize("<*gameModeMultiTeam>")
  else
    nodes[27].widget_text = localize("<*gameModeMultiFFA>")
  end
  local modsParameters = nodes[12].widget.lines
  modsParameters.f_clear()
  for _, scr in ipairs(scriptsV) do
    local modCode = scr
    if type(modCode) == "table" then
      modCode = scr[1]
    end
    modCode = string.sub(modCode, 1, 11)
    if modCode == "nz4SD1WAHyj" then
      if toBool(parseParameters(scr[2]).creatingUnits) then
        modsParameters.f_create(localize("<*privateModParameterUnitsCreating>"))
      end
    elseif modCode == "UV9nJd7KPS8" then
      modsParameters.f_create(localize("<*privateModParameterNoFow>"))
    end
  end
  local teamsCount = 16
  local noCosmetics = true
  local hordeDifficulty
  for _, scr in ipairs(scriptsG) do
    local modCode = scr
    if type(modCode) == "table" then
      modCode = scr[1]
    end
    modCode = string.sub(modCode, 1, 11)
    if modCode == "Rgi6rNgLAmd" then
      modsParameters.f_create(localize("<*privateModParameterDefeatConditions/0>" .. defeatConditions[1] .. "<*privateModParameterDefeatConditions/1>"))
    elseif modCode == "bxRNf7V9y4f" then
      modsParameters.f_create(localize("<*privateModParameterArmageddon>"))
    elseif modCode == "eMjoqml7Qfb" then
      nodes[28].visible = false
      nodes[15].visible = true
      teamsCount = 2
      nodes[27].widget_text = localize("<*gameModeTugOfWar>")
      nodes[35].visible = false
    elseif modCode == "l5ib3BJVr9i" then
      nodes[28].visible = false
      nodes[15].visible = false
      nodes[27].widget_text = localize("<*gameModeHorde>")
      hordeDifficulty = 0
    elseif modCode == "bQvMCC4erVl" then
      if toBool(parseParameters(scr[2]).weakBots) then
        hordeDifficulty = 1
      else
        hordeDifficulty = 2
      end
    elseif modCode == "caKgiwj8lh8" then
      modsParameters.f_create(localize("<*privateModParameterDefeatConditions/0>" .. defeatConditions[2] .. "<*privateModParameterDefeatConditions/1>"))
    elseif modCode == "iZvDVNV7Aok" then
      modsParameters.f_create(localize("<*privateModParameterDrawMode>"))
    elseif modCode == "lFMtjJTcyml" then
      noCosmetics = false
    elseif modCode == "IOGEe1vh385" then
      modsParameters.f_create(localize("<*privateModParameterFastBuild>"))
    elseif modCode == "325s8mFhB5f" then
      modsParameters.f_create(localize("<*privateModParameterFastWork>"))
    elseif modCode == "4Kdob459gog" then
      modsParameters.f_create(localize("<*privateModParameterNoWonder>"))
    elseif modCode == "lGn8Ivf5qmb" then
      nodes[27].widget_text = localize("<*gameModeSandbox>")
    elseif modCode == "lUA74NKbZSf" then
      modsParameters.f_create(localize("<*privateModParameterNoHousesNeeded>"))
    elseif modCode == "J3v7snqXfl7" then
      nodes[28].visible = false
      nodes[35].visible = false
      nodes[27].widget_text = localize("<*gameModeSurvival>")
      modsParameters.f_create(localize("<*privateModParameterDifficulty/0>" .. difficultyNames[tonumber(parseParameters(scr[2]).difficulty) + 1] .. "<*privateModParameterDifficulty/1>"))
    elseif modCode == "QdmFm6WcJGj" then
      nodes[28].visible = false
      nodes[35].visible = false
      nodes[27].widget_text = localize("<*gameModeCustomMap>")
    elseif modCode == "coz0zyLx4Md" then
      local finalAge = tonumber(parseParameters(scr[2]).finalAge)
      local ageName = "Not set"
      if finalAge ~= nil and eraName[finalAge + 2] ~= nil then
        ageName = eraName[finalAge + 2]
      end
      modsParameters.f_create(localize("<*privateModParameterAgeLimit/0>" .. ageName .. "<*privateModParameterAgeLimit/1>"))
    elseif modCode == "kdrDA746k9d" then
      local agressiveAmount = tonumber(parseParameters(scr[2]).agressiveAmount)
      if agressiveAmount == nil then
        agressiveAmount = 100
      end
      if agressiveAmount ~= 100 then
        modsParameters.f_create(localize("<*privateModParameterAgressiveAnimals/0>" .. agressiveAmount .. "<*privateModParameterAgressiveAnimals/1>"))
      end
    elseif modCode == "KgbndOUtoob" then
      local res0 = tonumber(parseParameters(scr[2]).res0)
      if res0 == nil then
        res0 = 250
      end
      local res1 = tonumber(parseParameters(scr[2]).res1)
      if res1 == nil then
        res1 = 100
      end
      local res2 = tonumber(parseParameters(scr[2]).res2)
      if res2 == nil then
        res2 = 0
      end
      if res0 ~= 100 or res1 ~= 250 or res2 ~= 0 then
        modsParameters.f_create(localize("<*privateModParameterStartingResources/0>" .. res0 .. "<*privateModParameterStartingResources/1>" .. res1 .. "<*privateModParameterStartingResources/2>" .. res2 .. "<*privateModParameterStartingResources/3>"))
      end
    elseif modCode == "fIoO5t44ONj" then
      local limit = tonumber(parseParameters(scr[2]).limit)
      if limit == nil then
        limit = tonumber(parseParameters(scr[2]).supply)
      end
      if limit == nil then
        limit = 100
      end
      if limit ~= 100 then
        modsParameters.f_create(localize("<*privateModParameterSupplyLimit/0>" .. limit .. "<*privateModParameterSupplyLimit/1>"))
      end
    elseif modCode == "RyYmGF3DPQc" then
      modsParameters.f_create(localize("<*privateModParameterDisabledCultures>"))
    elseif modCode == "X6OqsoSYnB2" and not toBool(parseParameters(scr[2]).onlyAllies) then
      modsParameters.f_create(localize("<*privateModParameterSendResToNonAllies>"))
    end
  end
  if hordeDifficulty ~= nil then
    localize(localize("<*privateModHordeBotsDifficulty/0><*privateModHordeBotsDifficultyValues/" .. hordeDifficulty .. "><*privateModHordeBotsDifficulty/1>"))
  end
  if noCosmetics then
    modsParameters.f_create(localize("<*privateModParameterNoCosmetics>"))
  end
  nodes[34].visible = not nodes[35].visible
  local mapSize = 0
  if privateMaxPlayers <= playersCountPrivate[1] then
    mapSize = 1
  elseif privateMaxPlayers <= playersCountPrivate[2] then
    mapSize = 2
  elseif privateMaxPlayers <= playersCountPrivate[3] then
    mapSize = 3
  elseif privateMaxPlayers <= playersCountPrivate[4] then
    mapSize = 4
  elseif privateMaxPlayers <= playersCountPrivate[5] then
    mapSize = 5
  else
    mapSize = 6
  end
  nodes[37].widget_text = mapSizes[mapSize]
  nodes[51].widget_text = localize("<*countOfPlayers/0>-<*countOfPlayers/1>" .. privateMaxPlayers .. "<*countOfPlayers/2>")
  local lines = nodes[16].widget_lines
  lines.f_clear()
  lines.f_create("?")
  for i = 1, teamsCount do
    lines.f_create(tostring(i))
  end
  nodes[16].widget_value = 0
  joinTime = os.time()
  nodes[6].widget_text = "0:00"
end

function parseParameters(parameters)
  local result = {}
  if parameters == nil then
    return result
  end
  local p = 1
  while true do
    local pp = string.find(parameters, "=", p)
    if pp == nil then
      break
    end
    local name = string.sub(parameters, p, pp - 1)
    p = pp + 1
    local pp = string.find(parameters, ",", p)
    if pp == nil then
      result[name] = string.sub(parameters, p, pp)
      break
    else
      result[name] = string.sub(parameters, p, pp - 1)
      p = pp + 1
    end
  end
  return result
end

function setWidgetText(widgetText, text)
  assert(text ~= "")
  widgetText.text = text
  widgetText.fontName = getFontName(text)
end

function getFontName(text)
  assert(text ~= "")
  local font = fonts[root.functions.f_detectLanguage(text)]
  assert(font ~= nil)
  return font
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

function deactivate()
  interface.active = false
end
