local eventName = getParameter("name")
if eventName == "chatMessage" then
  local data = fromJson(getParameter("data"))
  if isBanned(data.player) and not data.system then
    return
  end
  addString(data.player, data.system, data.text, data.font, data.destination)
  return
end
if eventName == "playerCommunicationBlock" then
  local data = fromJson(getParameter("data"))
  playersBan[data.player] = data.block
  return
end
if eventName == "playerEliminate" then
  local data = fromJson(getParameter("data"))
  local name = getPlayerNameFont(data.player)[1]
  local notification
  if data.reason == "kick" then
    notification = localize("<*notificationPlayerKicked/0>") .. name .. localize("<*notificationPlayerKicked/1>")
  elseif data.reason == "desync" then
    notification = localize("<*notificationPlayerKickedDesync/0>") .. name .. localize("<*notificationPlayerKickedDesync/1>")
  elseif data.reason == 1 then
    notification = localize("<*notificationPlayerWin/0>") .. name .. localize("<*notificationPlayerWin/1>")
  elseif data.reason == 0 then
    notification = localize("<*notificationPlayerLose/0>") .. name .. localize("<*notificationPlayerLose/1>")
  elseif data.reason == 2 then
    notification = localize("<*notificationPlayerDraw/0>") .. name .. localize("<*notificationPlayerDraw/1>")
  end
  addString(data.player, true, notification, "", nil)
  return
end
if eventName == "teamKiller" then
  local data = fromJson(getParameter("data"))
  local name = getPlayerNameFont(data.player)[1]
  local notification = localize("<*notificationPlayerKickedTeamKiller/0>") .. name .. localize("<*notificationPlayerKickedTeamKiller/1>")
  addString(data.player, true, notification, "", nil)
  return
end
if eventName == "factionsColors" then
  factionsColors = fromJson(getParameter("data"))
  playersColors = {}
  for f = 1, #factionsColors do
    local playerId = getPlayerOfFaction(f - 1)
    if playerId ~= nil then
      playersColors[playerId + 1] = factionsColors[f]
    end
  end
  updateChat()
  return
end
if eventName == "playerSurrender" then
  local playerId = tonumber(getParameter("data"))
  local controlledPlayer = root.session_gameplay_controlledPlayer
  local controlledTeam = getPlayerTeam(controlledPlayer)
  local playerTeam = getPlayerTeam(playerId)
  if controlledTeam == playerTeam then
    local name = getPlayerNameFont(playerId)[1]
    local notification = localize("<*notificationPlayerSurrendered/0>") .. name .. localize("<*notificationPlayerSurrendered/1>")
    addString(playerId, true, notification, "", nil)
  end
  return
end
