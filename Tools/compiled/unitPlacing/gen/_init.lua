interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end

function getUnitNationName(unitTypeId, firstPeriod)
  local nationId = unitNations[unitTypeId + 1]
  if nationId == nil then
    return ""
  end
  return getNationName(nationId, firstPeriod)
end

function getNationName(id, firstPeriod)
  if id >= #nationNames then
    return "---"
  end
  local result = nationNames[id + 1]
  if #result == 2 then
    if firstPeriod then
      return result[1]
    else
      return result[2]
    end
  else
    return result
  end
end

function haveAccessToUnitType(unitTypeId)
  local nationId = unitNations[unitTypeId + 1]
  if nationId == nil then
    return true
  end
  return nationsAccess[nationId + 1]
end

function setFactionOnUnitsAdd(factionId)
  local nodes = interface.nodes
  nodes[10].widget_text = factionId
  local facs = root.session_visual_faction
  local fac = facs[factionId]
  nodes[11].widget_color_value = fac.minimapColor_value | 4278190080
  nodes[10].widget_font_textColor_value = fac.minimapBorderColor_value | 4278190080
end

function place()
  if placingUnitTypeId == nil then
    return
  end
  local nodes = interface.nodes
  local count = tonumber(nodes[7].widget_text)
  local factionId = tonumber(nodes[10].widget_text)
  root.session_visual_placer.f_unit(placingUnitTypeId, 0, true, "interface=" .. interfaceId .. ",unit=" .. placingUnitTypeId .. ",faction=" .. factionId .. ",count=" .. count, 0, 0, 0, 4278255360, 4278190335, 1000, 0, false, nil, defaultDir)
end
