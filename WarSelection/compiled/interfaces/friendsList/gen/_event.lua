local eventName = getParameter("name")
if eventName == "friendsActive" then
  initList()
  return
end
if eventName == "friendChanges" then
  local data = fromJson(getParameter("data"))
  local code = data.contact
  local f, pos = getFriend(code)
  assert(f ~= nil)
  if data.online ~= nil then
    f[2] = data.online
  end
  if data.userData ~= nil then
    f[4] = data.userData
  end
  if data.online ~= nil then
    sortFriends()
    f, pos = getFriend(code)
  end
  local nodes = interface.nodes
  nodes[2].widget_lines[pos] = getFriendNameStr(f)
  if nodes[2].widget_currentLine == pos then
    onFriendSelect(f)
  end
  return
end
if eventName == "friendMessage" then
  local data = fromJson(getParameter("data"))
  log(data)
  return
end
if eventName == "lobbyDisconnect" then
  onDisconnect()
  return
end
if eventName == "lobbyData" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  local code = data.code
  local data = data.data
  if code == 0 and data.sessionId ~= nil then
    privateLeft()
    groupLeft()
  elseif code == 1 then
    joinedGroup(data.code)
  elseif code == 2 then
    privateCreated(data.code, data.maxPlayers)
  elseif code == 3 then
    privateLeft()
  elseif code == 4 then
    local errorCode = data.error
    if errorCode == nil or errorCode == 0 then
      joinedPrivate(data.code, #data.players, data.maxPlayers)
    end
  elseif code == 7 then
    local errorCode = data.error
    local nodes = interface.nodes
    if errorCode == 0 then
    elseif errorCode == 1 then
      groupLeft()
    end
  elseif code == 10 then
    privateLeft()
  elseif code == 16 then
    updateGroup(#data.players)
  elseif code == 28 then
    privateLeft()
  elseif code == 35 then
    privatePlayerAdd()
  elseif code == 36 then
    privatePlayerDec()
  end
  return
end
