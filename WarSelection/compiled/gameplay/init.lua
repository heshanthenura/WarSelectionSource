function hexToInt(hex)
  if 48 <= hex and hex <= 57 then
    return hex - 48
  end
  if 97 <= hex and hex <= 102 then
    return hex - 87
  end
  if 65 <= hex and hex <= 70 then
    return hex - 55
  end
  return 0
end

function isAbilityAvailable(abilities, id)
  local letterId = id // 4 + 1
  if letterId > #abilities then
    return false
  end
  local ch = abilities:byte(letterId)
  local v = hexToInt(ch)
  local shift = id % 4
  return v & 1 << shift > 0
end

function onStartMain__()
  if getParameter("data") ~= nil then
    local dataInit = fromJson(getParameter("data"))
    local factions = root.faction
    for playerId, playerInit in ipairs(dataInit.players) do
      assert(playerId <= root.player_size)
      local func = function(facId)
        local faction = factions[facId]
        local abilities = playerInit.abilities
        if abilities ~= nil then
          faction.abilities.f_init(abilities)
        else
          abilities = ""
        end
        faction.researchesUnavailable[61] = not isAbilityAvailable(abilities, 14)
        faction.researchesUnavailable[62] = not isAbilityAvailable(abilities, 10)
        faction.researchesUnavailable[63] = not isAbilityAvailable(abilities, 8)
        faction.researchesUnavailable[64] = not isAbilityAvailable(abilities, 5)
        faction.researchesUnavailable[65] = not isAbilityAvailable(abilities, 9)
        faction.researchesUnavailable[66] = true
        faction.researchesUnavailable[67] = not isAbilityAvailable(abilities, 7)
        faction.researchesUnavailable[68] = not isAbilityAvailable(abilities, 6)
        faction.researchesUnavailable[69] = not isAbilityAvailable(abilities, 26)
        faction.researchesUnavailable[70] = not isAbilityAvailable(abilities, 11)
        faction.researchesUnavailable[71] = not isAbilityAvailable(abilities, 30)
        faction.researchesUnavailable[72] = not isAbilityAvailable(abilities, 13)
        faction.researchesUnavailable[73] = not isAbilityAvailable(abilities, 12)
      end
      forEachPlayerFaction(playerId - 1, func)
    end
  end
  local massOffResearchesUnavailable = function(research)
    local func = function(facId)
      root.faction[facId].researchesUnavailable[research] = true
    end
    forEachControlledFaction(func)
  end
  massOffResearchesUnavailable(25)
  massOffResearchesUnavailable(57)
  massOffResearchesUnavailable(58)
  massOffResearchesUnavailable(85)
  massOffResearchesUnavailable(86)
  massOffResearchesUnavailable(87)
  massOffResearchesUnavailable(88)
end

function onUnitCustomAbility__(var)
  local ability = getParameter("ability")
  if ability == "paratroopers" then
    local unitId = getParameter("unitId")
    local scene = root.scene[0]
    local units = scene.units
    local unit = units.list[unitId]
    if unit ~= nil then
      local pType = tonumber(getParameter("pType"))
      local pCount = tonumber(getParameter("pCount"))
      local pLifeTime = tonumber(getParameter("pLifeTime"))
      local x = unit.position_x
      local y = unit.position_y
      if scene.landscape.f_inRange(x, y) then
        units.f_create(pType, pCount, unit.faction, x, y, 0, 512, 2, 500, pLifeTime)
      end
    end
    return
  end
end

function onSpecialCommandMain__(var)
  local command = getParameter("command")
  if command == "surrender" then
    local playerId = getParameter("player")
    local sur = root.dataStorage.f_get("surrender")
    if sur == "" then
      sur = {}
    else
      sur = fromJson(sur)
    end
    if not sur[playerId] then
      sur[playerId] = true
      root.dataStorage.f_set("surrender", toJson(sur))
      root.f_playerSpecialCommand(playerId, "command", "surrenderDone")
    end
  end
  if command == "leave" then
    local playerId = getParameter("player")
    root.f_eliminatePlayer(playerId, 0)
    return
  end
  if command == "serverkick" then
    local playerId = getParameter("player")
    root.f_eliminatePlayer(playerId, 0)
    return
  end
end

function addServerWinDataMain__(var, data)
  assert(type(data) == "table")
  data.stats = getFactionsStatistics__()
end

function onTickMain__(var, currentMoment)
  if var.winners ~= nil then
    local noLivePlayers = true
    local func = function()
      noLivePlayers = false
    end
    forEachPlayerLive(func)
    if noLivePlayers then
      do
        local json = {
          type = "matchState",
          winPlayers = var.winners,
          matchState = "winners",
          data = {},
          time = currentMoment
        }
        var.winners = nil
        genServerData(json.data)
        root.f_sendDataToServer(toJson(json))
      end
    end
  end
  if var.draw ~= nil then
    local noLivePlayers = true
    local func = function()
      noLivePlayers = false
    end
    forEachPlayerLive(func)
    if noLivePlayers then
      do
        local json = {
          type = "matchState",
          drawPlayers = var.draw,
          matchState = "draw",
          data = {},
          time = currentMoment
        }
        var.draw = nil
        genServerData(json.data)
        root.f_sendDataToServer(toJson(json))
      end
    end
  end
end

function onPlayerEliminateMain__(var)
  local playerId = getParameter("player")
  local reason = getParameter("reason")
  if reason == 0 then
    local players = root.player
    local position = players.size + 1
    for playerId = 0, players.size - 1 do
      if players[playerId].eliminated then
        position = position - 1
      end
    end
    local json = {
      type = "matchState",
      lostPlayer = playerId,
      matchState = "loser",
      position = position,
      time = root.time
    }
    root.f_sendDataToServer(toJson(json))
  end
  if reason == 1 then
    if var.winners == nil then
      var.winners = {}
    end
    table.insert(var.winners, playerId)
  end
  if reason == 2 then
    if var.draw == nil then
      var.draw = {}
    end
    table.insert(var.draw, playerId)
  end
end

function getFactionsStatistics__()
  local result = {}
  local factions = root.faction
  local func = function(facId)
    local list = factions[facId].statistics.units.f_createdList()
    result[facId] = {
      unitsCreated = fromJson(list)
    }
  end
  forEachControlledFaction(func)
  return result
end

function genServerData(data)
  assert(type(data) == "table")
  for _, func in ipairs(onServerWinDataFuncs) do
    func[2](func[3], data)
  end
end

modVars = {}
modCodes = {}
onTickFuncs = {}
onStartFuncs = {}
onDumpInitFuncs = {}
onDumpCreateFuncs = {}
onSpecialCommandFuncs = {}
onServerWinDataFuncs = {}
onUnitDeathFuncs = {}
onResearchDoneFuncs = {}
onUnitInZoneFuncs = {}
onPlayerEliminateFuncs = {}
onUnitCustomAbilityFuncs = {}

function addFunction(funcs, func, name, var)
  if funcs == nil then
    return
  end
  for _, data in ipairs(funcs) do
    if data[1] == name then
      data[2] = func
      data[3] = var
      return
    end
  end
  table.insert(funcs, {
    name,
    func,
    var
  })
end

function addTickFunction(func, name, var)
  addFunction(onTickFuncs, func, name, var)
end

function addStartFunction(func, name, var)
  addFunction(onStartFuncs, func, name, var)
end

function addDumpInitFunction(func, name, var)
  addFunction(onDumpInitFuncs, func, name, var)
end

function addDumpCreateFunction(func, name, var)
  addFunction(onDumpCreateFuncs, func, name, var)
end

function addScriptFunction(func, name, var)
  addFunction(onSpecialCommandFuncs, func, name, var)
end

function addServerWinDataFunction(func, name, var)
  addFunction(onServerWinDataFuncs, func, name, var)
end

function addResearchDoneFunction(func, name, var)
  addFunction(onResearchDoneFuncs, func, name, var)
end

function addPlayerEliminate(func, name, var)
  addFunction(onPlayerEliminateFuncs, func, name, var)
end

function tableReplaceProperties(original, newObject)
  for k in pairs(original) do
    original[k] = nil
  end
  if newObject == nil then
    return
  end
  for k, v in pairs(newObject) do
    original[k] = v
  end
end

function addMod(functions, modCode)
  if modCode == nil then
    modCode = getParameter("modCode")
  end
  if modVars[modCode] == nil then
    modVars[modCode] = {}
  end
  table.insert(modCodes, modCode)
  mod = {
    var = modVars[modCode],
    onInit = functions.onInit,
    onStart = functions.onStart,
    onDumpStart = functions.onDumpStart,
    onTick = functions.onTick,
    onDumpCreate = functions.onDumpCreate,
    onSpecialCommand = functions.onSpecialCommand,
    onWin = functions.onWin,
    onUnitDeath = functions.onUnitDeath,
    onResearchDone = functions.onResearchDone,
    onUnitInZone = functions.onUnitInZone,
    onPlayerEliminate = functions.onPlayerEliminate,
    onUnitCustomAbility = functions.onUnitCustomAbility,
    onServerWinData = functions.onServerWinData
  }
  if mod.onInit ~= nil and not mod.var.inited__ then
    mod.var.inited__ = true
    local status, error = pcall(mod.onInit, mod.var)
    if not status then
      log("Caught an error in mod-" .. modCode .. " on init:", error)
    end
  end
  if mod.onTick ~= nil then
    addFunction(onTickFuncs, mod.onTick, modCode, mod.var)
  end
  if mod.onStart ~= nil then
    addFunction(onStartFuncs, mod.onStart, modCode, mod.var)
  end
  if mod.onDumpStart ~= nil then
    addFunction(onDumpInitFuncs, mod.onDumpStart, modCode, mod.var)
  end
  if mod.onDumpCreate ~= nil then
    addFunction(onDumpCreateFuncs, mod.onDumpCreate, modCode, mod.var)
  end
  if mod.onSpecialCommand ~= nil then
    addFunction(onSpecialCommandFuncs, mod.onSpecialCommand, modCode, mod.var)
  end
  if mod.onWin ~= nil then
    addFunction(onServerWinDataFuncs, mod.onWin, modCode, mod.var)
  end
  if mod.onUnitDeath ~= nil then
    addFunction(onUnitDeathFuncs, mod.onUnitDeath, modCode, mod.var)
  end
  if mod.onResearchDone ~= nil then
    addFunction(onResearchDoneFuncs, mod.onResearchDone, modCode, mod.var)
  end
  if mod.onUnitInZone ~= nil then
    addFunction(onUnitInZoneFuncs, mod.onUnitInZone, modCode, mod.var)
  end
  if mod.onPlayerEliminate ~= nil then
    addFunction(onPlayerEliminateFuncs, mod.onPlayerEliminate, modCode, mod.var)
  end
  if mod.onUnitCustomAbility ~= nil then
    addFunction(onUnitCustomAbilityFuncs, mod.onUnitCustomAbility, modCode, mod.var)
  end
  if mod.onServerWinData ~= nil then
    addFunction(onServerWinDataFuncs, mod.onServerWinData, modCode, mod.var)
  end
end

addMod({
  onUnitCustomAbility = onUnitCustomAbility__,
  onStart = onStartMain__,
  onSpecialCommand = onSpecialCommandMain__,
  onWin = addServerWinDataMain__,
  onTick = onTickMain__,
  onPlayerEliminate = onPlayerEliminateMain__
}, "main__G")
