local eventName = getParameter("name")
if eventName == "onPlacer" then
  local data = fromJson(getParameter("data"))
  data.continue = interface.hotKeys.f_check(1)
  if data.left then
    defaultDir = tonumber(data.direction)
    if data.continue then
      place()
    end
  end
  root.interface[placeInterface].f_sendEvent("unitPlace", toJson(data))
  return
end
if eventName == "selectedUnitType" then
  placingUnitTypeId = tonumber(getParameter("data"))
  local nodes = interface.nodes
  assert(placingUnitTypeId ~= nil)
  assert(root.session_gameplay_gameplay_unitType[placingUnitTypeId] ~= nil)
  nodes[5].widget_text = unitNames[placingUnitTypeId + 1] .. " (" .. getUnitNationName(placingUnitTypeId) .. ")"
  local access = haveAccessToUnitType(placingUnitTypeId)
  nodes[4].visible = not access
  nodes[12].visible = access
end
if eventName == "toolsOnNumber" then
  interface.nodes[7].widget_text = getParameter("data")
  return
end
if eventName == "onFactionChoose" then
  setFactionOnUnitsAdd(tonumber(getParameter("data")))
  root.interface[factionsInterface].active = false
  return
end
