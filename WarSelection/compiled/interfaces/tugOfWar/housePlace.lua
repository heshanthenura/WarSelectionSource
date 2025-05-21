local command = root.session_visual_commands
if command == nil then
  return
end
local can = canBuildHouse()
if can == 0 then
  return
end
local unitTypeId = getMyCulture().house[1]
if can == 1 then
  local zone = staticData.factions[myFactionNum].teamNum + 3
  root.session_visual_placer.f_unit(unitTypeId, 0, true, "interface=" .. interfaceId .. ",house=true,unit=" .. unitTypeId, 0, 0, 0, 4278255360, 4278190335, 1000, 0, false, zone)
else
  command.f_specialCommand(0, "command", "upgradeHouse")
end
