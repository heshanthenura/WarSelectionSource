local eventName = getParameter("name")
if eventName == "onPlacer" then
  local data = fromJson(getParameter("data"))
  if data.left then
    local command = root.session_visual_commands
    if command == nil then
      return
    end
    command.f_specialCommand(0, "command", "placerButton", "button", tonumber(data.button), "x", data.xg, "y", data.yg, "interfaceName", interfaceName)
  end
  return
end
