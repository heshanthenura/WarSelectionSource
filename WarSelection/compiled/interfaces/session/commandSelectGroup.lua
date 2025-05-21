local command = getCommands()
if command == nil then
  return
end
local clearSelection = not root.session_visual_hotKeys.f_check(addSelectionHotKey)
root.session_visual_scene[0].f_massSelect(tonumber(getParameter("tags")), root.session_visual_currentFaction, clearSelection)
root.session_gameplay_gameplay_dataStorage.f_set("massSelectTags", getParameter("tags"))
root.session_gameplay_gameplay_dataStorage.f_set("massSelectTime", root.session_gameplay_gameplay_time)
