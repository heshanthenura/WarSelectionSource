local button = tonumber(getParameter("button"))
if not rightDirection then
  button = #typeSelectionButtons - button + 1
end
setCurrentSelectionUnitType(currentSelectionButtonsTypes[button])
