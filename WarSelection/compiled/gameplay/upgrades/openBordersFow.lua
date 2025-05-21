local facs = root.scene[0].faction
local team = facs[getParameter("faction")].team
for factionId = 0, 63 do
  local fac = facs[factionId]
  if fac == nil then
    return
  end
  local fTeam = fac.team
  if team == fTeam then
    fac.factionsOpenBorders[getParameter("faction")] = true
  end
end
