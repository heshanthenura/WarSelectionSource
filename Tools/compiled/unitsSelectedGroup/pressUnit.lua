local button = tonumber(getParameter("button"))
if not rightDirection then
  button = #unitsSelectionButtons - button + 1
end
if showingUnitsInTransport then
  local command = root.session_gameplay_command
  if command == nil then
    return
  end
  command.f_unload(false, button - 1)
else
  local sel = currentSelectionUnits[button]
  if sel == nil then
    return
  end
  if interface.hotKeys.f_check(0) then
    root.session_visual_scene[0].f_unselectUnits3(sel)
  else
    root.session_visual_scene[0].f_selectUnits3(sel, true)
  end
end
