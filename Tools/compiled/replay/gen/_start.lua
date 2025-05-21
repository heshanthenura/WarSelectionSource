playerNames = fromJson(getParameter("playerNames"))
replayCode = getParameter("replayCode")
local nodes = interface.nodes
local gSes = root.session_gameplay
local gameplay = gSes.gameplay
nodes[2].widget_text = ""
local w = nodes[4].widget
local lines = w.lines
lines.f_clear()
for plId = 1, gameplay.player_size do
  lines.f_create(getPlayerName(plId - 1))
end
w.value = gSes.controlledPlayer
replayDuration = gameplay.time + gSes.replayProcess_ticksDuration * gSes.tickController_tickTime
nodes[12].widget_text = toTimeStr(replayDuration // 1000)
nodes[23].visible = replayCode ~= nil
