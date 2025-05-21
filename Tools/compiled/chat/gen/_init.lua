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

function getFactionOfPlayer(player)
  local facs = root.session_gameplay_gameplay_player[player].controlledFactions
  for i = 0, 63 do
    if facs[i] then
      return i
    end
  end
  return -1
end

function getPlayerOfFaction(faction)
  local plr = root.session_gameplay_gameplay_player
  for i = 0, plr.size - 1 do
    local player = plr[i].controlledFactions
    if player[faction] then
      return i
    end
  end
  return nil
end

function getPlayerTeam(player)
  return root.session_gameplay_gameplay_scene[0].faction[getFactionOfPlayer(player)].team
end

function getPlayerNameFont(player)
  if playerNames == nil then
    return {
      "Noname",
      localize("<*font_en>")
    }
  end
  local name = playerNames[player + 1]
  if name == nil then
    return {
      "Noname",
      localize("<*font_en>")
    }
  end
  return {
    name,
    playerFonts[player + 1]
  }
end

function getPlayerColor(playerId)
  return playersColors[playerId + 1]
end

function updateChat()
  local vSession = root.session_visual
  local nodes = interface.nodes
  local height = nodes[3].sizeY
  local linesSum = 0
  local players = root.session_gameplay_gameplay_player
  local scale = interface.scaleWidgets
  for i = #chatStrings, 1, -1 do
    local n = nodes[chatStrings[i]]
    local w = n.widget
    local strPos = #chatLog + i - #chatStrings
    if 1 <= strPos then
      local str = chatLog[strPos]
      local system = str[3]
      local playerName = getPlayerNameFont(str[1])[1]
      if system then
        w.text = str[2]
      else
        w.text = "<*" .. playerName .. "*> " .. str[2]
      end
      if str[5] then
        w.appearance = chatAppearanceAlly
      else
        w.appearance = nil
      end
      w.fontName = str[4]
      local color = getPlayerColor(str[1])
      if system then
        n.sizeY = 16
        w.font_textColor_value = color[2]
        w.backColor_value = color[1]
        w.font_strokeColor_value = 0
        w.strokeThikness = 0
      else
        n.sizeY = 415
        w.font_textColor_value = color[1]
        w.backColor_value = 0
        w.font_strokeColor_value = color[2]
        w.strokeThikness = 1.5
      end
    else
      w.text = ""
    end
    local lines = w.text_size
    linesSum = linesSum + lines
    local top = height - math.floor(linesSum * 20 * scale)
    n.localTop = top
  end
end

function addString(player, system, text, font, destination)
  local ally = false
  if 500 < #text then
    return
  end
  local nodes = interface.nodes
  if font == "" then
    font = nodes[22].widget_text_fontName
  end
  if destination == nil then
    if not system then
      return
    end
  elseif destination ~= "all" then
    local senderTeam = getPlayerTeam(player)
    local myFaction = root.session_visual_currentFaction
    local myPlayer = getPlayerOfFaction(myFaction)
    local myTeam = getPlayerTeam(myPlayer)
    if senderTeam ~= myTeam then
      return
    end
    ally = true
  end
  if soundId ~= nil then
    root.session_visual_sound.f_playSound(soundId, 1)
  end
  table.insert(chatLog, {
    player,
    text,
    system,
    font,
    ally
  })
  updateChat()
  if nodes[4].widget_checked then
    return
  end
  chatLastTime = os.time()
  if not nodes[22].isFocused then
    nodes[28].visible = false
  end
  nodes[1].visible = true
end

function isBanned(player)
  local factionId = getFactionOfPlayer(player)
  if root.session_gameplay_gameplay_faction[factionId].abilities[18] then
    return true
  end
  if playersBan[player] == nil then
    return false
  end
  return playersBan[player]
end

function getPlayerFaction(player)
  local facs = root.session_gameplay_gameplay_player[player].controlledFactions
  for facId = 0, 63 do
    if facs[facId] then
      return facId
    end
  end
end

function getPlayerTeam(player)
  local id = getPlayerFaction(player)
  return root.session_gameplay_gameplay_scene[0].faction[id].team
end
