local eventName = getParameter("name")
if eventName == "playerEliminate" then
  local data = fromJson(getParameter("data"))
  if data.reason == nil then
    return
  end
  if data.player ~= root.session_gameplay_controlledPlayer then
    return
  end
  local nodes = interface.nodes
  if data.reason == 1 then
    interface.sound.f_playSound(1, 1)
    nodes[3].visible = true
  elseif data.reason == 2 then
    interface.sound.f_playSound(2, 1)
    nodes[4].visible = true
  else
    interface.sound.f_playSound(0, 1)
    nodes[2].visible = true
  end
  return
end
