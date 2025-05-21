local command = root.session_visual_commands
if command == nil then
  return
end
if not getParameter("canAnyoneBuild") then
  addNotification(1)
  return
end
local vSession = root.session_visual
local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
local gameplay = root.session_gameplay_gameplay
local factions = gameplay.scene[0].faction
local planId = getParameter("plan")
local plan = factions.buildPlan[planId]
local faction = factions[root.session_visual_currentFaction]
local xg = plan.position_x
local yg = plan.position_y
local x = vSession.f_coordinateToVisual2(xg)
local y = vSession.f_coordinateToVisual2(yg)
local zg = gameplay.scene[0].landscape.f_getHeight(xg, yg)
local onWater = zg ~= nil and underWater(zg)
local rule = gameplay.build[plan.rule]
local unitType = gameplay.unitType[rule.unit]
local radius = 4.7 * unitType.radius / 65535
vSession.f_createEmitters(0, 1642, radius, true, x, y, 0, 0, 0, 0, "", 0, onWater)
local initCost = rule.initCost
local resources = faction.treasury_resources
if resources[0] < initCost[0] or resources[1] < initCost[1] or resources[2] < initCost[2] then
  addNotification(3)
  return
end
if unitType.supplyOn then
  local supplyCost = unitType.supply_cost
  if 0 < supplyCost then
    local supplyMax = faction.supply_limitMaximized
    local supplySum = faction.supply_sum
    if supplyCost > supplyMax - supplySum then
      addNotification(2)
    end
  end
end
command.f_buildPlanWork(clearTasks, planId)
