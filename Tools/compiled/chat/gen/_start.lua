chatStrings = {
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19
}
soundId = getParameter("sound")
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
local nodes = interface.nodes
chatAppearanceAlly = nodes[19].widget_appearance
chatLog = {}
chatLastTime = 0
if getParameter("banned") then
  nodes[22].disabled = true
  nodes[20].visible = true
end
local gSes = root.session_gameplay
local factionsColors = fromJson(getParameter("colors"))
if factionsColors == nil then
  factionsColors = {}
  local factions = root.session_visual_faction
  local players = gSes.gameplay_player
  for factionId = 0, factions.size - 1 do
    local faction = factions[factionId]
    factionsColors[factionId + 1] = {
      faction.minimapColor_value,
      faction.minimapBorderColor_value
    }
  end
end
playersColors = {}
for f = 1, #factionsColors do
  local playerId = getPlayerOfFaction(f - 1)
  if playerId ~= nil then
    playersColors[playerId + 1] = factionsColors[f]
  end
end
playerNames = fromJson(getParameter("playerNames"))
playerFonts = {}
if playerNames ~= nil then
  for i = 1, #playerNames do
    local font = fonts[root.functions.f_detectLanguage(playerNames[i])]
    assert(font ~= nil)
    table.insert(playerFonts, font)
  end
end
local n = nodes[1]
n.horizontalAlign = getParameter("horizontalAlign")
n.verticalAlign = getParameter("verticalAlign")
n.sizeX = getParameter("sx")
n.sizeY = getParameter("sy")
n.localLeft = getParameter("x")
n.localTop = getParameter("y")
nodes[1].visible = false
lastTime = 0
playersBan = getParameter("bans")
if playersBan == nil then
  playersBan = {}
else
  playersBan = fromJson(playersBan)
  if playersBan == nil then
    playersBan = {}
  end
end
isModeNetwork = gSes.streamMode == 1
