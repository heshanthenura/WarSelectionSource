local eventName = getParameter("name")
if eventName == "editUnitType" then
  local data = fromJson(getParameter("data"))
  if unitIcons == nil then
    unitIcons = {}
    local ut = root[unitTypesAddress]
    local images = interface.content_image
    for i = 0, ut.size - 1 do
      table.insert(unitIcons, findImage(images, "unit" .. i .. ".png"))
    end
  end
  if data == nil or data.show == nil or data.show == true then
    interface.active = true
  end
  if data ~= nil and data.unit ~= nil then
    selectedUnit = data.unit
    if selectedUnit ~= nil and root[unitTypesAddress][selectedUnit] == nil then
      selectedUnit = nil
    end
  end
  updateFilteredUnitsComboBox()
  return
end
