local player = getParameter("player")
local reason = getParameter("reason")
local eli = eliminatedPlayers[player]
if eli ~= nil and eli then
  return
end
eliminatedPlayers[player] = true
local data = {player = player, reason = reason}
root.interface.f_sendEvent("playerEliminate", toJson(data))
if root.session_gameplay_streamMode == 2 then
  return
end
if reason ~= 0 then
  hasWin = true
  root.session_render_fogOfWar_ignore = true
  root.session_visual_scene[0].hideInFogOfWar = false
end
