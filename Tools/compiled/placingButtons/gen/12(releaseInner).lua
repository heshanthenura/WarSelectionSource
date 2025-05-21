local buttonId = tonumber(getParameter("button"))
if placing[buttonId] then
  root.session_visual_placer.f_free(nil, 1, "interface=" .. interfaceId .. ",button=" .. buttonId)
  if placingCursor ~= nil then
    root.window_cursor = placingCursor
  end
else
  local command = root.session_visual_commands
  if command == nil then
    return
  end
  command.f_specialCommand(0, "command", "placerButton", "button", buttonId, "interfaceName", interfaceName)
end
