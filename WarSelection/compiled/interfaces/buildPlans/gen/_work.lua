local vSession = root.session_visual
if vSession == nil then
  return
end
local gameplay = root.session_gameplay_gameplay
local myFactionId = vSession.currentFaction
local age = getAgeFaction(myFactionId)
local actualEra = age[1]
local actualNation = age[2]
local gFaction = gameplay.faction[myFactionId]
local statistics = gFaction.statistics_units
if actualEra == 0 then
  buildPlansId = 1
else
  buildPlansId = actualNation
end
local nodes = interface.nodes
for i, planId in ipairs(buildPlansAbilities[buildPlansId]) do
  local locked = false
  local disabled = false
  local but = nodes[buildButtons[i]]
  if 0 <= planId then
    but.visible = true
    local plan = gFaction.build[planId]
    local unavailable = gFaction.buildRulesUnavailable[planId]
    local building = plan.unit
    local set = but.widget_middle_set
    set.normal = unitIcons[building + 1]
    set.disabled = unitIcons[building + 1]
    locked = unavailable
    disabled = unavailable or not plan.available or not haveRequiredAll(plan.requirements, statistics, gFaction.researchState)
  else
    but.visible = false
  end
  but.disabled = disabled
  nodes[buildButtonsLockers[i]].visible = locked
end
if annTask ~= nil then
  local ann = root.ann
  local task = ann.task[annTask[2]]
  assert(task ~= nil)
  if task.state == 3 then
    ann.task.f_release(annTask[2])
    log("Ann: build house error")
    annTask = nil
  elseif task.state == 2 and task.state == 2 then
    local heat = task.output
    local best = {0, 0}
    local c = 0
    for i, v in ipairs(heat) do
      if v > best[2] then
        best = {i, v}
        c = 1
      end
    end
    local size = annTask[5]
    local pos = {
      (best[1] // size + 0.5) / size,
      (best[1] % size + 0.5) / size
    }
    local leftTopW = annTask[3]
    local rightBottomW = annTask[4]
    local plan = annTask[1]
    local bSize = annTask[6]
    annTask = nil
    local vSession = root.session_visual
    local factionId = vSession.currentFaction
    local xg = math.floor(leftTopW[1] + (rightBottomW[1] - leftTopW[1]) * pos[1])
    local yg = math.floor(leftTopW[2] + (rightBottomW[2] - leftTopW[2]) * pos[2])
    local pp = gameplay.scene[0].landscape.f_findFreePositionCircle(xg, yg, 894, bSize)
    if pp == nil then
      log(xg, yg, 894, bSize)
      vSession.commands.f_buildPlanAdd(true, factionId, plan, xg, yg, 0)
    else
      vSession.commands.f_buildPlanAdd(true, factionId, plan, pp[1], pp[2], 0)
    end
  end
end
