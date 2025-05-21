local button = tonumber(getParameter("button"))
local planId = buildPlansAbilities[buildPlansId][button]
if planId < 0 then
  return
end
local nodes = interface.nodes
nodes[43].visible = true
local gameplay = root.session_gameplay_gameplay
local faction = root.session_visual_currentFaction
local gFaction = gameplay.faction[faction]
local sFaction = gameplay.scene[0].faction[faction]
local plan = gFaction.build[planId]
local initCost = plan.initCost
local buildCost = plan.buildCost
local building = plan.unit
updateCostRequirements(plan.requirements)
nodes[46].widget_setText = unitNames[building + 1]
nodes[49].widget_text = buildPlanText[planId + 1]
local resources = sFaction.treasury_resources
local i0 = initCost[0]
local i1 = initCost[1]
local i2 = initCost[2]
local c0 = i0 + buildCost[0]
local c1 = i1 + buildCost[1]
local c2 = i2 + buildCost[2]
local r0 = resources[0]
local r1 = resources[1]
local r2 = resources[2]
outCostDigit(nodes[74], nodes[75], i0, c0, r0, 1000)
outCostDigit(nodes[77], nodes[78], i1, c1, r1, 1000)
outCostDigit(nodes[80], nodes[83], i2, c2, r2, 1000)
local unitType = gameplay.unitType[building]
if unitType.supplyOn then
  local sup = unitType.supply_cost
  local limit = sFaction.supply_limitMaximized - sFaction.supply_sum
  outCostDigit(nodes[70], nodes[73], sup, sup, limit, 10)
else
  nodes[70].visible = false
end
nodes[44].visible = gFaction.buildRulesUnavailable[planId]
