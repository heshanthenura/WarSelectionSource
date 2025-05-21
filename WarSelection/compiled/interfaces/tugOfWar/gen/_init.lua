local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
end
damageUpgradeName = localize("<*damageUpgradeName>")
unitsButtons = {
  134,
  135,
  136,
  137,
  138,
  139,
  140,
  141,
  142,
  9,
  144,
  145
}
unitsCounters = {
  92,
  93,
  94,
  95,
  96,
  97,
  98,
  99,
  100,
  164,
  102,
  103
}
playerInterfaces = {
  {
    {
      panel = 112,
      name = 50,
      wave = 47,
      timer = 33,
      lose = 106
    },
    {
      panel = 29,
      name = 49,
      wave = 45,
      timer = 32,
      lose = 125
    },
    {
      panel = 30,
      name = 53,
      wave = 48,
      timer = 31,
      lose = 126
    }
  },
  {
    {
      panel = 113,
      name = 59,
      wave = 56,
      timer = 35,
      lose = 128
    },
    {
      panel = 27,
      name = 60,
      wave = 57,
      timer = 36,
      lose = 127
    },
    {
      panel = 28,
      name = 61,
      wave = 58,
      timer = 46,
      lose = 129
    }
  }
}
nextCultureButtons = {
  105,
  143,
  108,
  91,
  198,
  8
}
unitNations = {
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  0,
  0,
  0,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  0,
  2,
  2,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  2,
  2,
  2,
  3,
  3,
  3,
  3,
  3,
  3,
  0,
  3,
  3,
  3,
  3,
  2,
  4,
  5,
  0,
  2,
  4,
  5,
  4,
  5,
  4,
  5,
  0,
  0,
  3,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  2,
  5,
  2,
  5,
  5,
  2,
  2,
  2,
  6,
  7,
  6,
  7,
  6,
  7,
  6,
  7,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  2,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  0,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  2,
  2,
  7,
  6,
  6,
  6,
  6,
  6,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  8,
  8,
  8,
  8,
  8,
  2,
  2,
  2,
  2,
  3,
  3,
  3,
  3,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  2,
  3,
  1,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  2,
  3,
  4,
  4,
  4,
  4,
  4,
  5,
  5,
  5,
  5,
  5,
  6,
  6,
  6,
  6,
  6,
  7,
  7,
  7,
  7,
  7,
  5,
  8,
  6,
  8,
  4,
  5,
  6,
  7,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  6,
  8,
  20,
  8,
  8,
  9,
  9,
  9,
  8,
  9,
  9,
  9,
  9,
  9,
  9,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  11,
  11,
  11,
  20,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  8,
  8,
  8,
  12,
  12,
  12,
  12,
  8,
  13,
  13,
  13,
  8,
  13,
  13,
  13,
  13,
  13,
  13,
  0,
  13,
  13,
  8,
  8,
  1,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  12,
  9,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  20,
  14,
  14,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  9,
  12,
  20,
  16,
  16,
  16,
  16,
  16,
  16,
  8,
  8,
  16,
  16,
  16,
  16,
  8,
  3,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  20,
  20,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  20,
  1,
  1,
  20,
  8,
  12,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  16,
  21,
  21,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil
}
factionColorsBase = {
  {4294930544, 4278190080},
  {4278190256, 4280821800},
  {4281048353, 4280821800},
  {4278239231, 4280821800},
  {4294950656, 4280821800},
  {4286513343, 4280821800}
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
unitNames = {}
for i = 0, root.session_gameplay_gameplay_unitType_size + 10 do
  table.insert(unitNames, localize("<*unitName" .. i .. ">"))
end
cultureNames = {
  localize("<*nationName1>"),
  localize("<*ageNames/1> <*nationName2>"),
  localize("<*ageNames/2> <*nationName2>"),
  localize("<*ageNames/1> <*nationName3>"),
  localize("<*ageNames/2> <*nationName3>"),
  localize("<*ageNames/3> <*nationName4>"),
  localize("<*ageNames/4> <*nationName4>"),
  localize("<*ageNames/3> <*nationName5>"),
  localize("<*ageNames/4> <*nationName5>"),
  localize("<*ageNames/3> <*nationName6>"),
  localize("<*ageNames/4> <*nationName6>"),
  localize("<*ageNames/3> <*nationName7>"),
  localize("<*ageNames/4> <*nationName7>"),
  localize("<*ageNames/5> <*nationName8>"),
  localize("<*ageNames/6> <*nationName8>"),
  localize("<*ageNames/5> <*nationName9>"),
  localize("<*ageNames/6> <*nationName9>"),
  localize("<*ageNames/5> <*nationName10>"),
  localize("<*ageNames/6> <*nationName10>"),
  localize("<*ageNames/5> <*nationName11>"),
  localize("<*ageNames/6> <*nationName11>"),
  localize("<*ageNames/5> <*nationName12>"),
  localize("<*ageNames/6> <*nationName12>"),
  localize("<*ageNames/5> <*nationName13/0>"),
  localize("<*ageNames/6> <*nationName13/1>"),
  localize("<*ageNames/5> <*nationName14>"),
  localize("<*ageNames/6> <*nationName14>"),
  localize("<*ageNames/5> <*nationName15>"),
  localize("<*ageNames/6> <*nationName15>"),
  localize("<*ageNames/5> <*nationName16>"),
  localize("<*ageNames/6> <*nationName16>"),
  localize("<*ageNames/5> <*nationName17>"),
  localize("<*ageNames/6> <*nationName17>"),
  localize("<*ageNames/5> <*nationName18/0>"),
  localize("<*ageNames/6> <*nationName18/1>"),
  localize("<*ageNames/5> <*nationName19/0>"),
  localize("<*ageNames/6> <*nationName19/1>"),
  localize("<*ageNames/5> <*nationName20>"),
  localize("<*ageNames/6> <*nationName20>")
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

function findImage(images, name)
  local id = images.f_find(name)
  if id == nil then
    log("Can't find image for '" .. name .. "'")
    return nil
  end
  if images[id] == nil then
    log("interface." .. interfaceId .. ".content.image: No image with id=" .. id .. " (name=" .. name .. ")")
  end
  return id
end

unitIcons = {}
local images = interface.content_image
local ut = root.session_gameplay_gameplay_unitType
for i = 1, ut.size do
  unitIcons[i] = findImage(images, "unit" .. i - 1 .. ".png")
end
researchIcons = {}
local rs = root.session_gameplay_gameplay_researches_list
for i = 1, rs.size do
  researchIcons[i] = findImage(images, "upgrade" .. i - 1 .. ".png")
end
cultureIcons = {
  -1,
  researchIcons[4],
  researchIcons[2],
  researchIcons[5],
  researchIcons[3],
  researchIcons[6],
  researchIcons[16],
  researchIcons[7],
  researchIcons[10],
  researchIcons[8],
  researchIcons[17],
  researchIcons[9],
  researchIcons[18],
  researchIcons[60],
  researchIcons[94],
  researchIcons[65],
  researchIcons[115],
  researchIcons[69],
  researchIcons[116],
  researchIcons[68],
  researchIcons[117],
  researchIcons[64],
  researchIcons[119],
  researchIcons[66],
  researchIcons[122],
  researchIcons[63],
  researchIcons[126],
  researchIcons[71],
  researchIcons[127],
  researchIcons[74],
  researchIcons[132],
  researchIcons[73],
  researchIcons[136],
  researchIcons[62],
  researchIcons[137],
  researchIcons[70],
  researchIcons[146],
  researchIcons[72],
  researchIcons[147]
}

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

function getPlayerNameFont(player)
  if playerNames == nil then
    return {
      "Noname",
      fonts.en
    }
  end
  local name = playerNames[player + 1]
  if name == nil then
    return {
      "Noname",
      fonts.en
    }
  end
  return {
    name,
    playerFonts[player + 1]
  }
end

function writePlayerToWidget(player, widget, textColor, strokeColor)
  local plnf = getPlayerNameFont(player)
  widget.text = plnf[1]
  widget.fontName = plnf[2]
  if textColor ~= nil then
    widget.font_textColor_value = textColor
  end
  if strokeColor ~= nil then
    widget.font_strokeColor_value = strokeColor
  end
end

function getFactionOfPlayer(player)
  local facs = root.session_gameplay_gameplay_player[player].controlledFactions
  for i = 0, 63 do
    if facs[i] then
      return i
    end
  end
  return -1
end

function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == "table" then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(orig)))
  else
    copy = orig
  end
  return copy
end

function searchUnit(units, faction, tags)
  return units.f_searchNearest(0, 0, 1000000000, faction, tags)
end

function getHQ(units, faction)
  return searchUnit(units, faction, 32)
end

function showPlayerWindow(player)
  local nodes = interface.nodes
  nodes[65].visible = true
  nodes[71].visible = false
  nodes[116].visible = false
  complaintPlayer = player
  writePlayerToWidget(player, nodes[70].widget)
  nodes[69].widget_checked = isChatBanned(player)
end

function onResize()
  local nodes = interface.nodes
  local b = 0
  if nodes[1].visible then
    b = nodes[85].sizeY
  end
  if root.interface_scene_scripts_ready then
    root.interface_scene.f_sendEvent("initOffsets", toJson({bottom = b}))
  end
end

function isChatBanned(player)
  if root.session_gameplay_gameplay_faction[getFactionOfPlayer(player)].abilities[18] then
    return true
  end
  if playersChatBan[player] == nil then
    return false
  end
  return playersChatBan[player]
end

function getUnitName(id)
  return unitNames[id + 1]
end

function getMyDinamic()
  return dynamicData.teams[myTeamNum].players[myPlayerNum]
end

function getMyCulture()
  return staticData.cultures[getMyDinamic().culture]
end

function canBuildHouse()
  local myTeamPlayerD = getMyDinamic()
  local house = staticData.cultures[myTeamPlayerD.culture].house
  if myTeamPlayerD.houses == nil or #myTeamPlayerD.houses < staticData.maxHouses then
    return 1
  end
  for i = 1, #myTeamPlayerD.houses do
    local h = myTeamPlayerD.houses[i]
    if h[2] ~= house[1] then
      return 2
    end
  end
  return 0
end

hotKeysResult = {
  id = interfaceId,
  name = localize("<*tugofwarInterfaceName>"),
  hotKeys = {}
}
local list = fromJson("[" .. localize("<*tugofwarHotKeysList>") .. "]")
if list ~= nil then
  for _, v in ipairs(list) do
    local name = localize("<*tugofwarHotKeyName" .. v .. ">")
    table.insert(hotKeysResult.hotKeys, {v, name})
  end
end
hotKeysResult = toJson(hotKeysResult)
