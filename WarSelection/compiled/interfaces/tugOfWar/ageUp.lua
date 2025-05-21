local button = tonumber(getParameter("button"))
local command = root.session_visual_commands
if command == nil then
  return
end
local myCultureS = getMyCulture()
if button > #myCultureS.nextCultures then
  return
end
local culture = myCultureS.nextCultures[button][1]
command.f_specialCommand(0, "command", "nextAge", "culture", culture)
