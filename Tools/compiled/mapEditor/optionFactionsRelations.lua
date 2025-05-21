if getParameter("value") == 0 then
  local teamsRels = getTeamsRelations()
  for fromTeam = 1, #teamsList do
    for toTeam = 1, #teamsList do
      local r = teamsRels[fromTeam][toTeam]
      if fromTeam == toTeam then
        teamSetRelation(fromTeam, toTeam, true)
      elseif 0 < r & 1 and r ~= 1 then
        teamSetRelation(fromTeam, toTeam, nil)
      elseif 0 < r & 2 and r ~= 2 then
        teamSetRelation(fromTeam, toTeam, true)
      elseif 0 < r & 4 and r ~= 4 then
        teamSetRelation(fromTeam, toTeam, false)
      end
    end
  end
else
  for fromFac = 1, #factionsList do
    for toFac = 1, #factionsList do
      if factionsList[fromFac].team == factionsList[toFac].team then
        factionsList[fromFac].relations[toFac] = true
      end
    end
  end
end
updateTeamsList()
updateFactionsList()
