if leaveSession ~= nil then
  if leaveSession == 0 then
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    root.session.f_break()
    leaveSession = nil
  else
    leaveSession = leaveSession - 1
  end
end
local nodes = interface.nodes
local gSes = root.session.gameplay
if gSes ~= nil and gSes.streamMode == 1 then
  local pingPeriod = gSes.pingDuration
  nodes[66].visible = true
  local w = nodes[65].widget
  w.text = pingMsTxt[1] .. pingPeriod .. pingMsTxt[2]
  if pingPeriod < 200 then
    w.font_textColor_value = 4278255360
  elseif pingPeriod < 300 then
    w.font_textColor_value = 4278255615
  else
    w.font_textColor_value = 4278190335
  end
else
  nodes[66].visible = false
end
