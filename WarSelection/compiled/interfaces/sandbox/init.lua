interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
nationNames = {
  localize("<*nationName0>"),
  localize("<*nationName1>"),
  localize("<*nationName2>"),
  localize("<*nationName3>"),
  localize("<*nationName4>"),
  localize("<*nationName5>"),
  localize("<*nationName6>"),
  localize("<*nationName7>"),
  localize("<*nationName8>"),
  localize("<*nationName9>"),
  localize("<*nationName10>"),
  localize("<*nationName11>"),
  localize("<*nationName12>"),
  {
    localize("<*nationName13/0>"),
    localize("<*nationName13/1>")
  },
  localize("<*nationName14>"),
  localize("<*nationName15>"),
  localize("<*nationName16>"),
  localize("<*nationName17>"),
  {
    localize("<*nationName18/0>"),
    localize("<*nationName18/1>")
  },
  {
    localize("<*nationName19/0>"),
    localize("<*nationName19/1>")
  },
  localize("<*nationName20>"),
  localize("<*nationName21>")
}
unitNames = {}
for i = 0, root.session_gameplay_gameplay_unitType_size + 10 do
  table.insert(unitNames, localize("<*unitName" .. i .. ">"))
end
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
culturesAbilities = {
  [9] = 5,
  [10] = 6,
  [11] = 7,
  [12] = 8,
  [13] = 9,
  [14] = 10,
  [15] = 11,
  [16] = 12,
  [17] = 13,
  [18] = 14,
  [19] = 26,
  [21] = 30
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

if toBool(getParameter("creatingUnits")) then
  local nodes = interface.nodes
  nodes[4].visible = true
  local data = {
    nationNames = nationNames,
    unitNames = unitNames,
    unitNations = unitNations,
    nationsAccess = {true}
  }
  local id = root.session_visual_currentFaction
  local abilities = root.session_gameplay_gameplay_faction[id].abilities
  for i = 1, #nationNames do
    local id = culturesAbilities[i]
    if id == nil then
      table.insert(data.nationsAccess, true)
    else
      table.insert(data.nationsAccess, abilities[id])
    end
  end
  local streamMode = root.session_gameplay_streamMode
  isModeSingle = streamMode == 0
  sandboxUnitPlacingInterface = root.interface.f_create("/project/Tools/unitPlacing", "sandboxUnitPlacing", interfaceScale, interfaceScale, "selfClose", false, "changeFactions", isModeSingle, "data", toJson(data), "placeInterface", interfaceId)
  root.interface[sandboxUnitPlacingInterface].active = false
  root.interface[sandboxUnitPlacingInterface].priority = 60
end
