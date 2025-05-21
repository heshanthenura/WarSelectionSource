local eventName = getParameter("name")
if eventName == "unitPlace" then
  local data = fromJson(getParameter("data"))
  if data.left then
    local command = root.session_visual_commands
    if command == nil then
      return
    end
    local faction = tonumber(data.faction)
    if faction == nil then
      faction = root.session_visual_currentFaction
    end
    command.f_specialCommand(0, "command", "createUnit", "faction", faction, "x", data.xg, "y", data.yg, "dir", data.directiong, "unit", tonumber(data.unit), "count", tonumber(data.count))
  elseif data.final then
    root.window_cursor = 0
  else
    root.session_visual_placer.f_turnOff()
  end
end
