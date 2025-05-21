local nodes = interface.nodes
local teamId = nodes[289].widget_currentLine + 1
local hasFactions = false
for i = 1, #factionsList do
  hasFactions = hasFactions or factionsList[i].team == teamId
end
if getParameter("confirm") == nil then
  nodes[257].visible = true
  nodes[670].visible = hasFactions
  nodes[667].disabled = hasFactions
  nodes[662].visible = not hasFactions
  nodes[673].widget_text = teamsList[teamId].name
  return
end
nodes[257].visible = false
if not toBool(getParameter("confirm")) or hasFactions then
  return
end
assert(1 < #teamsList)
table.remove(teamsList, teamId)
for i = 1, #factionsList do
  if 1 < factionsList[i].team and teamId <= factionsList[i].team then
    local v = factionsList[i].team - 1
    assert(0 < v)
    assert(v <= #teamsList)
    factionsList[i].team = v
  end
end
nodes[289].widget_currentLine = 0
updateTeamsList()
onTeamSelect(1)
markMapNotSaved()
