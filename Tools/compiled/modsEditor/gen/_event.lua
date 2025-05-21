local name = getParameter("name")
if name == "fileEdited" then
  local command = root.session_visual_commands
  if command == nil then
    return
  end
  local data = fromJson(getParameter("data"))
  if data.modType == "gameplay" then
    command.f_specialCommand(0, "command", "modEditG", "modCode", data.modCode, "content", data.content)
  else
    command.f_specialCommand(0, "command", "modEditV", "modCode", data.modCode, "content", data.content)
  end
  modsList[data.modCode].newContent = data.content
  setCanSave(data.modCode)
end
