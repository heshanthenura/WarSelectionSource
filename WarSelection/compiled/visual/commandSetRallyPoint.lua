local command = root.session_visual_commands
if command == nil then
  return
end
local vSession = root.session_visual
local scene = root.session_gameplay_gameplay_scene[0]
if getParameter("gatherTarget") ~= nil then
  local env = scene.env[getParameter("gatherTarget")]
  gatherType = env.type
  local envType = root.session_gameplay_gameplay_envType[gatherType]
  local gatherTags = envType.searchTags_value
  local x = env.position_x
  local y = env.position_y
  local zg = scene.landscape.f_getHeight(x, y)
  if zg ~= nil then
    local onWater = underWater(zg)
    command.f_rallyPointSet(x, y, gatherTags)
    local x = vSession.f_coordinateToVisual2(x)
    local y = vSession.f_coordinateToVisual2(y)
    local kRadius = 65535 / envType.radius
    local radius = 8.5 / kRadius
    vSession.f_createEmitters(0, 4, radius, true, x, y, 0, 0, 0, 0, "", 0, onWater)
    vSession.f_createEmitters(0, 1644, 1, true, x, y, 0, 0, 0, 0, "", 0, onWater)
  end
else
  local xg = getParameter("xg")
  local yg = getParameter("yg")
  command.f_rallyPointSet(xg, yg)
  local x = getParameter("x")
  local y = getParameter("y")
  local zg = scene.landscape.f_getHeight(xg, yg)
  if zg ~= nil then
    local onWater = underWater(zg)
    vSession.f_createEmitters(0, 1645, 1, true, x, y, 0, 0, 0, 0, "", 0, onWater)
  end
end
