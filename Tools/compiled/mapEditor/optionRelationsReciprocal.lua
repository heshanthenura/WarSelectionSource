if getParameter("value") == 1 then
  for fromFac = 1, #factionsList do
    for toFac = 1, #factionsList do
      factionsList[fromFac].relations[toFac] = factionsList[toFac].relations[fromFac]
    end
  end
end
updateTeamsList()
updateFactionsList()
