local first = true
local firstType
local takeNext = false
for unitTypeModifiedId, typeCount in pairs(currentSelectionUnitTypes) do
  if first then
    firstType = unitTypeModifiedId
    first = false
  end
  if takeNext then
    setCurrentSelectionUnitType(unitTypeModifiedId)
    return
  end
  if unitTypeModifiedId == currentSelectionUnitType then
    takeNext = true
  end
end
setCurrentSelectionUnitType(firstType)
