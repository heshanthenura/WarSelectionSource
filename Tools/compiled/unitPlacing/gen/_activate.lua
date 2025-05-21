local unitSelector = root.session_visual_scene[0].selection_units_list
for i = 0, unitSelector.size - 1 do
  local unitId = unitSelector[i].id
  if unitId ~= nil then
    local unit = root.session_gameplay_gameplay_scene[0].units_list[unitId]
    if unit ~= nil then
      placingUnitTypeId = unit.type
      if placingUnitTypeId ~= nil then
        assert(root.session_gameplay_gameplay_unitType[placingUnitTypeId] ~= nil)
        interface.nodes[5].widget_text = unitNames[placingUnitTypeId + 1] .. " (" .. getUnitNationName(placingUnitTypeId) .. ")"
        break
      end
    end
  end
end
