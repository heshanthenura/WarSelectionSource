local command = root.session_visual_commands
if command ~= nil then
  if getParameter("unselect") ~= nil then
    command.f_unselect(getParameter("ids"))
    return
  else
    command.f_select(getParameter("clearSelection"), getParameter("ids"))
  end
end
local ids = getParameter("a_ids")
if ids == nil or #ids == 1 and ids[1] == "" then
  return
end
local vSession = root.session_visual
local myFaction = vSession.currentFaction
local gatherTarget = {}
local buildPlans = {}
local scene = root.session_gameplay_gameplay_scene[0]
local units = scene.unit
for i = 1, #ids do
  local unit = units[tonumber(ids[i])]
  if unit ~= nil and unit.faction == myFaction then
    local unitTasks = unit.task
    if 0 < unitTasks.size then
      local task0 = unitTasks[0]
      local taskType = task0.type
      if taskType == 0 then
        local xg = task0.data_position_x
        local yg = task0.data_position_y
        local xv = vSession.f_coordinateToVisual2(xg)
        local yv = vSession.f_coordinateToVisual2(yg)
        local zg = scene.landscape.f_getHeight(xg, yg)
        local onWater = zg ~= nil and underWater(zg)
        vSession.f_createEmitters(0, 8, 1, true, xv, yv, 0, 0, 0, 0, "", 0, onWater)
      end
      if taskType == 5 then
        target = task0.data_target_id
        gatherTarget[target] = task0.data_target
      end
      if taskType == 3 then
        plan = task0.data_plan
        buildPlans[plan] = true
      end
    end
  end
end
