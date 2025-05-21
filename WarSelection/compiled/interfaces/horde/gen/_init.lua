local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
end
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
playersColors = {
  {4278255423, 4278190080},
  {4278190335, 4278190080},
  {4282384319, 4280821800},
  {4294950656, 4280821800},
  {4278239231, 4280821800},
  {4286513343, 4280821800},
  {4294901887, 4280821800},
  {4290772736, 4278190080},
  {4278255615, 4278190080},
  {4286513407, 4280821800},
  {4286513152, 4284303427},
  {4286562175, 4280821800},
  {4294934272, 4282400833},
  {4278222847, 4280821800},
  {4290707647, 4278190080},
  {4278239039, 4280821800},
  {4286562239, 4280821800},
  {4286562303, 4280821800},
  {4278190207, 4278190138},
  {4284887859, 4284744192},
  {4278255423, 4278190080},
  {4286578687, 4278190080},
  {4286529535, 4280821800},
  {4294934399, 4280821800},
  {4282367871, 4280821800},
  {4278222783, 4280821800},
  {4294902015, 4280821800},
  {4294950847, 4280821800},
  {4286578559, 4280821800},
  {4290772991, 4280821800},
  {4290740223, 4280821800},
  {4290723647, 4280821800},
  {4286578655, 4280821800},
  {4290756607, 4280821800},
  {4294934527, 4280821800},
  {4290740031, 4282400833},
  {4282351423, 4280821793},
  {4286545919, 4280821800},
  {4294901951, 4282400833},
  {4294950783, 4280821800},
  {4278222592, 4278190080},
  {4286545855, 4280821800},
  {4290707583, 4278190080},
  {4294967231, 4280821800},
  {4278239167, 4280821800},
  {4282335167, 4281545523},
  {4282318911, 4286644353},
  {4290756352, 4280821800},
  {4278190271, 4280821793},
  {4294950911, 4280821800},
  {4286562048, 4280821800},
  {4282335103, 4280821800},
  {4290756479, 4280821800},
  {4278222719, 4282400833},
  {4278190143, 4278190207},
  {4290740159, 4280821800},
  {4290772927, 4280821800},
  {4286529407, 4281545523},
  {4294967040, 4280821800},
  {4290772863, 4280821800},
  {4286545664, 4282400833},
  {4286513279, 4283301966},
  {4289921024, 4282400833},
  {4290756543, 4280821800}
}
racesUnits = {
  {
    419,
    420,
    421,
    422,
    423
  },
  {
    424,
    425,
    426,
    427,
    428
  },
  {
    429,
    430,
    431,
    432,
    433
  }
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
    return string.format("%u:%02d", min, sec)
  end
  local hour = value // 3600
  local min = value % 3600 // 60
  local sec = value % 60
  return string.format("%u:%02d:%02d", hour, min, sec)
end

function lerp(v1, v2, k)
  return v1 + (v2 - v1) * k
end

function getPlayerName(player)
  return playerNames[player + 1]
end

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

local vSession = root.session_visual
local vStorage = vSession.dataStorage
local pns = vStorage.playerNames
playerNames = nil
playerFonts = nil
if pns ~= "" then
  playerNames = fromJson(pns)
  playerRankings = fromJson(vStorage.playerRankings)
  if playerNames ~= nil then
    playerFonts = {}
    for i = 1, #playerNames do
      if editorMode and playerRankings ~= nil then
        playerNames[i] = "(" .. playerRankings[i] .. ") " .. playerNames[i]
      end
      local font = fonts[root.functions.f_detectLanguage(playerNames[i])]
      assert(font ~= nil)
      table.insert(playerFonts, font)
    end
  end
end
for i = 2, 16 do
  if playerNames[i] == nil then
    playerNames[i] = localize("<*botName/" .. i - 2 .. ">")
  end
end
local gameplay = root.session.gameplay_gameplay
local dataStorage = gameplay.dataStorage
runAwayPeriod = fromJson(dataStorage.runAwayPeriod)
runAwayRestore = fromJson(dataStorage.runAwayRestore)
meteorRestore = fromJson(dataStorage.meteorRestore)
meteorsLimit = fromJson(dataStorage.meteorsLimit)
raceChooseDuration = fromJson(dataStorage.raceChooseDuration)
local nodes = interface.nodes
nodes[163].widget_text = "Early Access - v" .. root.f_version(true)
local factions = vSession.faction
for factionId = 0, factions.size - 1 do
  local fac = factions[factionId]
  if factionId == 0 then
    fac.minimapColor.a = 0
  else
    local color = playersColors[factionId]
    fac.minimapColor_value = color[1]
    fac.minimapBorderColor_value = color[2]
  end
end
