local eventName = getParameter("name")
if eventName == "lobbyData" then
  local data = fromJson(getParameter("data"))
  local code = data.code
  local data = data.data
  if code == 0 and data.sessionId ~= nil then
    deactivate()
  elseif code == 2 then
    myPrivatePlayer = 1
    listOfPrivatePlayers = {}
    listOfPrivateTeams = {}
    slotsOfPrivatePlayers = {
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255,
      255
    }
    updatePrivatePlayersList()
    joinedPrivate(true, data.code, data.name, data.mapCode, data.maxPlayers, data.scriptsG, data.scriptsV, data.customMap, data.devMode, data.region, data.generatorData, data.teamMatch)
  elseif code == 3 then
    if not iCreator then
      local nodes = interface.nodes
      nodes[20].visible = true
    else
      deactivate()
    end
  elseif code == 4 then
    local error = data.error
    if error == nil or error == 0 then
      myPrivatePlayer = data.playerId + 1
      assert(myPrivatePlayer > 1)
      listOfPrivatePlayers = data.players
      listOfPrivateTeams = data.teams
      assert(listOfPrivatePlayers ~= nil)
      slotsOfPrivatePlayers = {
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255
      }
      for i = 1, #listOfPrivatePlayers do
        slotsOfPrivatePlayers[i] = i
      end
      joinedPrivate(false, data.code, data.name, data.mapCode, data.maxPlayers, data.scriptsG, data.scriptsV, data.customMap, data.devMode, data.region, data.generatorData, data.teamMatch)
      updatePrivatePlayersList()
    end
  elseif code == 9 then
    local nodes = interface.nodes
    nodes[47].disabled = false
    nodes[49].disabled = false
  elseif code == 10 then
    deactivate()
  elseif code == 13 then
    onPrivateFactionSetFail(data.reason, data.faction)
  elseif code == 21 then
    onPrivateFactionSet(data.player + 1, data.faction)
  elseif code == 27 then
    changePrivatePlayerTeam(data.player + 1, data.team)
  elseif code == 28 then
    deactivate()
  elseif code == 35 then
    assert(listOfPrivatePlayers ~= nil)
    assert(data.name ~= "")
    table.insert(listOfPrivatePlayers, {
      name = data.name
    })
    table.insert(listOfPrivateTeams, 255)
    local pos
    for i = 1, #slotsOfPrivatePlayers do
      if slotsOfPrivatePlayers[i] == 255 then
        slotsOfPrivatePlayers[i] = #listOfPrivatePlayers
        pos = i
        break
      end
    end
    updatePrivatePlayersList()
    local bans = root.storage_bans
    if bans ~= nil then
      bans = fromJson(bans)
    end
    if bans ~= nil and bans[data.idInLocalSpace] ~= nil then
      log("Auto kick: idInLocalSpace=" .. data.idInLocalSpace)
      kickPrivatePlayer(pos)
    end
  elseif code == 36 then
    local id = data.player + 1
    assert(listOfPrivatePlayers ~= nil)
    assert(#listOfPrivatePlayers == #listOfPrivateTeams)
    local maxPl = #listOfPrivatePlayers
    if myPrivatePlayer == maxPl then
      myPrivatePlayer = id
    end
    listOfPrivatePlayers[id] = listOfPrivatePlayers[maxPl]
    listOfPrivateTeams[id] = listOfPrivateTeams[maxPl]
    listOfPrivatePlayers[maxPl] = nil
    listOfPrivateTeams[maxPl] = nil
    for i = 1, #slotsOfPrivatePlayers do
      if slotsOfPrivatePlayers[i] == id then
        slotsOfPrivatePlayers[i] = 255
      elseif slotsOfPrivatePlayers[i] == maxPl then
        slotsOfPrivatePlayers[i] = id
      end
    end
    updatePrivatePlayersList()
  end
  return
end
if eventName == "lobbyDisconnect" then
  deactivate()
  return
end
