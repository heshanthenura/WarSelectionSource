local group = tonumber(getParameter("group"))
local clearSelection = not root.session_visual_hotKeys.f_check(addSelectionHotKey)
root.session_visual.f_selectCommandGroup(group, clearSelection)
local command = getCommands()
if command == nil then
  return
end
command.f_controlGroup(group, true, clearSelection)
