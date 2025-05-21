if not getParameter("press") then
  local command = root.session_visual_commands
  if command ~= nil then
    command.f_specialCommand(0, "command", "move", "x", math.floor(getParameter("x") * 256), "y", math.floor(getParameter("y") * 256))
  end
end
