local factionColors = {
  {4286545791, 4280821800},
  {4292532954, 4280821800},
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

function getFactionColor(factionId)
  return factionColors[factionId + 1][1]
end

function calcMustTerritorySize(wave, avgCountryStartSize)
  if wave == 0 then
    return 0
  end
  local result = avgCountryStartSize
  for i = 1, wave do
    result = result * 16 // 10
  end
  result = result * 3 // 2
  return result
end

function toTimeStr(value)
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
