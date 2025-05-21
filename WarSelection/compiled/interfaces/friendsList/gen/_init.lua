function sortFriends()
  local nodes = interface.nodes
  
  local w2 = nodes[2].widget
  local line = w2.currentLine
  local selFriend
  if line ~= nil then
    local f = friends[line + 1]
    selFriend = f[5]
  end
  
  function compare(a, b)
    if a[2] ~= b[2] then
      return a[2]
    end
    return a[3] < b[3]
  end
  
  table.sort(friends, compare)
  local lines = w2.lines
  lines.f_clear()
  local cont = root.messenger_contacts
  for _, f in ipairs(friends) do
    lines.f_create(getFriendNameStr(f))
    if f[5] == selFriend then
      w2.currentLine = lines.size - 1
    end
  end
end

function getFriend(code)
  for i, c in ipairs(friends) do
    if c[5] == code then
      return c, i - 1
    end
  end
end

function onFriendSelect(f)
  local nodes = interface.nodes
  local d = fromJson(f[4])
  nodes[31].visible = false
  nodes[30].visible = false
  if d == nil then
    return
  end
  if d.group ~= nil then
    local full = d.group.size > 3
    nodes[31].visible = true
    nodes[6].disabled = full
    nodes[15].visible = full
  end
  if d.private ~= nil then
    local full = d.private.size >= d.private.max
    nodes[30].visible = true
    nodes[1].disabled = full
    nodes[14].visible = full
  end
end

function getFriendNameStr(f)
  local s = ""
  if f[4] ~= "" and f[4] ~= "null" then
    local d = fromJson(f[4])
    if d ~= nil then
      if d.group ~= nil then
        s = squadStr[1] .. f[3] .. squadStr[2]
      end
      if d.private ~= nil then
        s = privateStr[1] .. f[3] .. privateStr[2]
      end
    end
  elseif f[2] then
    s = s .. onlineStr[1] .. f[3] .. onlineStr[2]
  else
    s = s .. offlineStr[1] .. f[3] .. offlineStr[2]
  end
  return s
end

function updateList()
  friends = {}
  local cont = root.messenger_contacts
  for i = 0, cont.size - 1 do
    local c = cont[i]
    table.insert(friends, {
      i,
      c.online,
      c.name,
      c.userData,
      c.id
    })
  end
  sortFriends()
end

function initList()
  if root.messenger_inited then
    updateList()
  else
    friends = {}
  end
end

function setMessengerUserData(parameter, value)
  local data = fromJson(root.messenger_userData)
  if data == nil then
    data = {}
  end
  if data[parameter] == value then
    return
  end
  data[parameter] = value
  root.messenger_userData = toJson(data)
end

function onDisconnect()
  privateLeft()
  groupLeft()
end

function joinedGroup(code)
  assert(type(code) == "string")
  groupCode = code
  setMessengerUserData("group", {
    code = groupCode,
    size = 1
  })
end

function groupLeft()
  local b = groupCode ~= nil
  groupCode = nil
  if b then
    setMessengerUserData("group", nil)
  end
end

function updateGroup(playersCount)
  if groupCode == nil then
    return
  end
  assert(type(groupCode) == "string")
  setMessengerUserData("group", {
    code = groupCode,
    size = playersCount
  })
end

function privateCreated(code, playersMax)
  private = {
    code = code,
    size = 0,
    max = playersMax
  }
end

function joinedPrivate(code, playersCount, playersMax)
  assert(playersCount ~= nil)
  assert(playersMax ~= nil)
  assert(type(code) == "string")
  private = {
    code = code,
    size = playersCount,
    max = playersMax
  }
  setMessengerUserData("private", private)
end

function privateLeft()
  local b = private ~= nil
  private = nil
  if b then
    setMessengerUserData("private", nil)
  end
end

function privatePlayerAdd()
  if private == nil then
    return
  end
  private.size = private.size + 1
  setMessengerUserData("private", private)
end

function privatePlayerDec()
  if private == nil then
    return
  end
  private.size = private.size - 1
  setMessengerUserData("private", private)
end

onlineStr = {
  localize("<*friendOnline/0>"),
  localize("<*friendOnline/1>")
}
offlineStr = {
  localize("<*friendOffline/0>"),
  localize("<*friendOffline/1>")
}
squadStr = {
  localize("<*friendSquad/0>"),
  localize("<*friendSquad/1>")
}
privateStr = {
  localize("<*friendPrivate/0>"),
  localize("<*friendPrivate/1>")
}
