local eventName = getParameter("name")
if eventName == "cosmeticStart" then
  local data = fromJson(getParameter("data"))
  onEvent(data.id, data.time)
  return
end
if eventName == "onPlacer" then
  local data = fromJson(getParameter("data"))
  if data.left then
    local command = root.session_visual_commands
    if command == nil then
      return
    end
    if not root.session_gameplay_gameplay_scene[0].landscape.f_inRange(data.xg, data.yg) then
      return
    end
    data.id = tonumber(data.id)
    assert(data.id ~= nil)
    onEvent(data.id, 0)
    command.f_specialCommand(0, "command", "ability", "id", data.id, "x", data.xg, "y", data.yg)
  end
  return
end
