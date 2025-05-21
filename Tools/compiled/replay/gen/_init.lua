speeds = {
  5000,
  1000,
  200,
  100,
  50,
  34,
  25,
  17,
  12,
  6,
  2
}
speedsPercent = {
  "x0.01",
  "x0.05",
  "x0.25",
  "x0.5",
  "x1.0",
  "x1.5",
  "x2.0",
  "x3.0",
  "x4.0",
  "x8.0",
  "max"
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

function getPlayerName(player)
  if playerNames == nil then
    return "Noname"
  end
  local name = playerNames[player + 1]
  if name == nil then
    return "Noname"
  end
  return name
end

function toTimeStr(value)
  if value < 0 then
    return "-" .. toTimeStr(-value)
  end
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

function getFactionOfPlayer(player)
  local facs = root.session_gameplay_gameplay_player[player].controlledFactions
  for factionId = 0, 63 do
    if facs[factionId] then
      return factionId
    end
  end
  return nil
end

function updateDumpTimeChange()
  local curDuration = root.session_gameplay_gameplay_time
  local nodes = interface.nodes
  local w16 = nodes[16].widget
  local setTime = math.floor((w16.current - w16.min) * replayDuration / (w16.max - w16.min))
  if setTime < 100 then
    setTime = 100
  end
  local replayProcess = root.session_gameplay_replayProcess
  local dumpId = replayProcess.f_getDumpId(setTime // 50)
  local dumpTime = replayProcess.dumps[dumpId].ticks * 50
  local dt = (dumpTime - curDuration) // 1000
  local timeStr = toTimeStr(dt)
  if 0 <= dt then
    nodes[42].widget_text = "+" .. timeStr
  else
    nodes[42].widget_text = timeStr
  end
end
