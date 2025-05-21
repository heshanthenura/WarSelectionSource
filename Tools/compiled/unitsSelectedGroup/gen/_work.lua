local nodes = interface.nodes
local vSession = root.session_visual
local selectionList = vSession.scene[0].selection_units_list
local selectionSize = selectionList.size
nodes[1].visible = false
nodes[2].visible = false
currentSelectionUnitTypes = {}
showingUnitsInTransport = false
local baseCur = currentSelectionUnitType
if selectionSize == 0 then
  currentSelectionUnitType = nil
elseif 1 < selectionSize then
  outUnitsGroup(selectionList, false)
else
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local gUnit = scene.units_list[selectionList[0]]
  currentSelectionUnitType = nil
  if gUnit ~= nil and gUnit.state >= 3 and gUnit.presence ~= 2 then
    local myFactionId = vSession.currentFaction
    local isMyFaction = gUnit.faction == myFactionId or allFactionsAsMy
    local unitType = gameplay.unitTypeModified[gUnit.typeModified]
    assert(unitType ~= nil)
    if isMyFaction or canShowUnit(scene, gUnit, unitType, myFactionId) then
      if isMyFaction and unitType.controllable and 0 < gUnit.transportingUnits_size then
        showingUnitsInTransport = true
        outUnitsGroup(gUnit.transportingUnits, true)
      end
      local unitTypeModifiedId = gUnit.typeModified
      currentSelectionUnitType = unitTypeModifiedId
      currentSelectionUnitTypes[unitTypeModifiedId] = {
        gUnit.type,
        1
      }
    end
  end
end
if parentInterface ~= nil and baseCur ~= currentSelectionUnitType then
  local value = currentSelectionUnitType
  if value == nil then
    value = ""
  end
  root.interface[parentInterface].f_sendEvent("onUnitsSelection", tostring(value))
end
