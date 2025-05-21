local nodes = interface.nodes
local w = nodes[289].widget
local scroll = w.verticalSlider_current
local toTeam = tonumber(getParameter("line"))
local o = w.lines_size - 8
if 0 < o then
  toTeam = toTeam + math.floor(o * scroll / w.verticalSlider_max + 0.5)
end
local setRel = tonumber(getParameter("rel"))
local teamId = w.currentLine + 1
local value
if setRel == 0 then
  value = false
elseif setRel == 1 then
  value = true
else
  value = nil
end
teamSetRelation(teamId, toTeam, value)
updateTeamsList()
markMapNotSaved()
