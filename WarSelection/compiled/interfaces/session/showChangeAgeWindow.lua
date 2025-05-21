local vSession = root.session_visual
local nodes = interface.nodes
local myFactionId = vSession.currentFaction
local age = getAgeFaction(myFactionId)
local actualEra = age[1]
local actualNation = age[2]
local gameplay = root.session_gameplay_gameplay
local factionUnits = gameplay.faction[myFactionId].statistics_units
local reqNum = 1
if actualEra == 6 then
  return
end
nodes[133].visible = true
nodes[719].visible = false
nodes[723].visible = false
nodes[724].visible = false
nodes[725].visible = false
nodes[726].visible = false
nodes[757].visible = false
nodes[69].visible = false
nodes[43].visible = false
nodes[188].visible = false
local requirements

function getMainBuildingId(nation)
  if nation == 1 then
    return 10
  elseif nation == 2 then
    return 11
  elseif nation == 3 then
    return 28
  elseif nation == 4 then
    return 51
  elseif nation == 5 then
    return 52
  elseif nation == 6 then
    return 83
  elseif nation == 7 then
    return 84
  elseif nation == 8 then
    return 190
  elseif nation == 9 then
    return 254
  elseif nation == 10 then
    return 264
  elseif nation == 11 then
    return 271
  elseif nation == 12 then
    return 282
  elseif nation == 13 then
    return 302
  elseif nation == 14 then
    return 323
  elseif nation == 15 then
    return 337
  elseif nation == 16 then
    return 358
  elseif nation == 17 then
    return 372
  elseif nation == 18 then
    return 385
  elseif nation == 19 then
    return 402
  elseif nation == 20 then
    return 436
  else
    return nil
  end
end

local mainBuildingId = getMainBuildingId(actualNation)
nodes[669].widget_text = unitNames[mainBuildingId + 1]
nodes[1206].widget_middle_set_normal = unitIcons[mainBuildingId + 1]
nodes[728].widget_text = ageNames[actualEra + 2]
local mainBuilding = gameplay.unitType[mainBuildingId]
if actualEra == 0 then
  nodes[719].visible = true
  requirements = mainBuilding.ability_ability[0].requirements_unit
  assert(requirements ~= nil)
  nodes[43].visible = true
  nodes[1209].widget_text = getNationName(2, true)
  nodes[1210].widget_text = getNationName(3, true)
  nodes[1207].widget_middle_set_normal = researchIcons[2]
  nodes[1208].widget_middle_set_normal = researchIcons[3]
elseif actualEra == 1 then
  nodes[723].visible = true
  requirements = mainBuilding.ability_ability[1].requirements_unit
  assert(requirements ~= nil)
  nodes[69].visible = true
  if actualNation == 2 then
    nodes[727].widget_middle_set_normal = researchIcons[4]
  else
    nodes[727].widget_middle_set_normal = researchIcons[5]
  end
elseif actualEra == 2 then
  nodes[724].visible = true
  requirements = mainBuilding.ability_ability[2].requirements_unit
  assert(requirements ~= nil)
  nodes[43].visible = true
  if actualNation == 2 then
    nodes[1209].widget_text = getNationName(4, true)
    nodes[1210].widget_text = getNationName(5, true)
    nodes[1207].widget_middle_set_normal = researchIcons[6]
    nodes[1208].widget_middle_set_normal = researchIcons[7]
  else
    nodes[1209].widget_text = getNationName(6, true)
    nodes[1210].widget_text = getNationName(7, true)
    nodes[1207].widget_middle_set_normal = researchIcons[8]
    nodes[1208].widget_middle_set_normal = researchIcons[9]
  end
elseif actualEra == 3 then
  nodes[725].visible = true
  requirements = mainBuilding.ability_ability[1].requirements_unit
  assert(requirements ~= nil)
  nodes[69].visible = true
  if actualNation == 4 then
    nodes[727].widget_middle_set_normal = researchIcons[16]
  elseif actualNation == 5 then
    nodes[727].widget_middle_set_normal = researchIcons[10]
  elseif actualNation == 6 then
    nodes[727].widget_middle_set_normal = researchIcons[17]
  elseif actualNation == 7 then
    nodes[727].widget_middle_set_normal = researchIcons[18]
  end
elseif actualEra == 4 then
  nodes[726].visible = true
  requirements = mainBuilding.ability_ability[5].requirements_unit
  assert(requirements ~= nil)
  if actualNation == 4 then
    nodes[188].visible = true
    nodes[194].widget_text = getNationName(8, true)
    nodes[204].widget_text = getNationName(9, true)
    nodes[227].widget_text = getNationName(12, true)
    nodes[229].widget_text = getNationName(14, true)
    nodes[250].widget_text = getNationName(18, true)
    nodes[567].widget_text = getNationName(21, true)
    nodes[299].widget_middle_set_normal = researchIcons[60]
    nodes[301].widget_middle_set_normal = researchIcons[65]
    nodes[302].widget_middle_set_normal = researchIcons[64]
    nodes[313].widget_middle_set_normal = researchIcons[63]
    nodes[324].widget_middle_set_normal = researchIcons[62]
    nodes[561].widget_middle_set_normal = researchIcons[72]
    nodes[298].visible = true
    nodes[273].visible = true
  elseif actualNation == 5 then
    nodes[188].visible = true
    nodes[194].widget_text = getNationName(8, true)
    nodes[204].widget_text = getNationName(13, true)
    nodes[227].widget_text = getNationName(17, true)
    nodes[229].widget_text = getNationName(18, true)
    nodes[299].widget_middle_set_normal = researchIcons[60]
    nodes[301].widget_middle_set_normal = researchIcons[66]
    nodes[302].widget_middle_set_normal = researchIcons[73]
    nodes[313].widget_middle_set_normal = researchIcons[62]
    nodes[298].visible = false
    nodes[273].visible = false
  elseif actualNation == 6 then
    nodes[188].visible = true
    nodes[194].widget_text = getNationName(8, true)
    nodes[204].widget_text = getNationName(10, true)
    nodes[227].widget_text = getNationName(11, true)
    nodes[229].widget_text = getNationName(19, true)
    nodes[299].widget_middle_set_normal = researchIcons[60]
    nodes[301].widget_middle_set_normal = researchIcons[69]
    nodes[302].widget_middle_set_normal = researchIcons[68]
    nodes[313].widget_middle_set_normal = researchIcons[70]
    nodes[298].visible = false
    nodes[273].visible = false
  elseif actualNation == 7 then
    nodes[188].visible = true
    nodes[194].widget_text = getNationName(8, true)
    nodes[204].widget_text = getNationName(10, true)
    nodes[227].widget_text = getNationName(15, true)
    nodes[229].widget_text = getNationName(16, true)
    nodes[299].widget_middle_set_normal = researchIcons[60]
    nodes[301].widget_middle_set_normal = researchIcons[69]
    nodes[302].widget_middle_set_normal = researchIcons[71]
    nodes[313].widget_middle_set_normal = researchIcons[74]
    nodes[298].visible = false
    nodes[273].visible = false
  end
elseif actualEra == 5 then
  nodes[757].visible = true
  requirements = mainBuilding.ability_ability[7].requirements_unit
  assert(requirements ~= nil)
  nodes[69].visible = true
  if actualNation == 8 then
    nodes[727].widget_middle_set_normal = researchIcons[94]
  elseif actualNation == 9 then
    nodes[727].widget_middle_set_normal = researchIcons[115]
  elseif actualNation == 10 then
    nodes[727].widget_middle_set_normal = researchIcons[116]
  elseif actualNation == 11 then
    nodes[727].widget_middle_set_normal = researchIcons[117]
  elseif actualNation == 12 then
    nodes[727].widget_middle_set_normal = researchIcons[119]
  elseif actualNation == 13 then
    nodes[727].widget_middle_set_normal = researchIcons[122]
  elseif actualNation == 14 then
    nodes[727].widget_middle_set_normal = researchIcons[126]
  elseif actualNation == 15 then
    nodes[727].widget_middle_set_normal = researchIcons[127]
  elseif actualNation == 16 then
    nodes[727].widget_middle_set_normal = researchIcons[132]
  elseif actualNation == 17 then
    nodes[727].widget_middle_set_normal = researchIcons[136]
  elseif actualNation == 18 then
    nodes[727].widget_middle_set_normal = researchIcons[137]
  elseif actualNation == 19 then
    nodes[727].widget_middle_set_normal = researchIcons[146]
  elseif actualNation == 20 then
    nodes[727].widget_middle_set_normal = researchIcons[147]
  end
end
local firstPeriod = actualEra % 2 == 1
nodes[17].visible = false
local hasDestroy = false
local requirementsSize = requirements.size
for i = 1, requirementsSize do
  local req = requirements[i - 1]
  if 0 < req.min then
    nodes[17].visible = true
    nodes[759].widget_text = reqNum
    reqNum = reqNum + 1
    local typeId = req.type
    local need = req.min
    local have = factionUnits.f_liveConstructed(typeId)
    nodes[1142].widget_middle_set_normal = unitIcons[typeId + 1]
    nodes[178].widget_text = getUnitNationName(typeId, firstPeriod)
    local w = nodes[1145].widget
    w.text = localize("<*requirementUnitAmountOf/0>") .. unitNames[typeId + 1] .. localize("<*requirementUnitAmountOf/1>") .. have .. localize("<*requirementUnitAmountOf/2>") .. need .. localize("<*requirementUnitAmountOf/3>")
    if need > have then
      w.font_textColor_value = 4278190335
    else
      w.font_textColor_value = 4278255360
    end
  else
    hasDestroy = true
  end
end
nodes[1205].visible = hasDestroy
if hasDestroy then
  nodes[763].widget_text = reqNum
  reqNum = reqNum + 1
  local num = 0
  for i = 1, requirementsSize do
    local req = requirements[i - 1]
    if req.min == 0 then
      local typeId = req.type
      local fu = factionUnits[typeId]
      if fu ~= nil then
        local have = fu.live
        if 0 < have then
          num = num + 1
          if num <= #destroyListWidgets then
            local n = nodes[destroyListWidgets[num]]
            n.visible = true
            n.widget_text = localize("<*requirementUnitAmount/0>") .. unitNames[typeId + 1] .. localize("<*requirementUnitAmount/1>") .. have .. localize("<*requirementUnitAmount/2>")
          end
        end
      end
    end
  end
  for i = num + 1, #destroyListWidgets do
    local n = nodes[destroyListWidgets[i]]
    n.visible = false
  end
end
nodes[766].widget_text = reqNum
nodes[767].widget_text = reqNum + 1
nodes[1213].visible = false
nodes[1322].visible = false
if actualEra == 0 then
  nodes[1213].visible = true
else
  nodes[1322].visible = true
end
