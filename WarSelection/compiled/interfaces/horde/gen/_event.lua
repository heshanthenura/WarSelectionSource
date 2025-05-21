local eventName = getParameter("name")
if eventName == "playerEliminate" then
  playersCount = playersCount - 1
  return
end
if eventName == "musicVolume" then
  interface.sound_musicVolume = tonumber(getParameter("data"))
  return
end
if eventName == "soundVolume" then
  interface.sound_volume = tonumber(getParameter("data"))
  return
end
if eventName == "changeGraphics" then
  root.session_visual_script_scripts.f_run(35, "level", tonumber(getParameter("data")))
  return
end
if eventName == "onPlacer" then
  local data = fromJson(getParameter("data"))
  local command = root.session_visual_commands
  if command == nil then
    return
  end
  if data.xg ~= nil then
    if data.left then
      command.f_specialCommand(0, "command", "meteor", "x", data.xg, "y", data.yg)
    else
      command.f_specialCommand(0, "command", "runAway")
    end
  end
  return
end
