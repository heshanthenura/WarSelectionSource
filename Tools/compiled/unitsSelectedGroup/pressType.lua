local button = tonumber(getParameter("button"))
if not rightDirection then
  button = #typeSelectionButtons - button + 1
end
local vScene = root.session_visual_scene[0]
local selectionList = vScene.selection_units_list
local selectionSize = selectionList.size
if selectionSize == 0 then
  return
end
local unitTypeId = currentSelectionButtonsTypes[button]
local units = root.session_gameplay_gameplay_scene[0].units_list
if showingUnitsInTransport then
  local command = root.session_gameplay_command
  if command == nil then
    return
  end
  local transport = units[selectionList[0]]
  if transport ~= nil then
    local unitsList = transport.transportingUnits
    for i = 0, unitsList.size - 1 do
      local selUnit = unitsList[i]
      if selUnit ~= nil then
        local gUnit = units[selUnit]
        if gUnit ~= nil and gUnit.state >= 3 and gUnit.typeModified == unitTypeId then
          command.f_unload(false, i)
        end
      end
    end
  end
else
  local sel = {}
  for i = 0, selectionSize - 1 do
    local selUnit = selectionList[i]
    if selUnit ~= nil then
      local gUnit = units[selUnit]
      if gUnit ~= nil and gUnit.typeModified == unitTypeId then
        table.insert(sel, selUnit)
      end
    end
  end
  if interface.hotKeys.f_check(0) then
    vScene.f_unselectUnits3(sel)
  else
    vScene.f_selectUnits3(sel, true)
  end
end
