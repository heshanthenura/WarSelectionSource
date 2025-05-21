local command = root.session_visual_commands
if command == nil then
  return
end
local myTeamPlayerD = getMyDinamic()
if myTeamPlayerD.tower == 0 then
  return
end
local unitTypeId = getMyCulture().tower[1]
local zone = staticData.factions[myFactionNum].teamNum + 1
root.session_visual_placer.f_unit(unitTypeId, 0, true, "interface=" .. interfaceId .. ",tower=true,unit=" .. unitTypeId, 0, 0, 0, 4278255360, 4278190335, 1000, 0, false, zone)
