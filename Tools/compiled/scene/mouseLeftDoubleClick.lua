if placing then
  return
end
local key = getParameter("keyId")
if key ~= 16777216 then
  return
end
local vSession = root.session_visual
local vScene = vSession.scene[0]
local selector = vScene.selection_units_list
if selector.size == 0 then
  return
end
local unitId = selector[selector.size - 1]
if unitId == nil then
  return
end
local gUnit = root.session_gameplay_gameplay_scene[0].units_list[unitId]
if gUnit == nil then
  return
end
if addSelectionHotKey == nil then
  return
end
local clearSelection = not vSession.hotKeys.f_check(addSelectionHotKey)
local units = vSession.f_viewportGetUnits(vSession.currentFaction, gUnit.type)
vScene.f_selectUnits3(units, clearSelection)
