local reason = getParameter("reason")
local unit = root.session_gameplay_gameplay_scene[0].units_list[getParameter("unit")]
if unit == nil then
  return
end
local vSession = root.session_visual
local myFaction = vSession.currentFaction
if unit.faction ~= myFaction then
  return
end
local res0 = getParameter("res0") // 1000
local res1 = getParameter("res1") // 1000
local res2 = getParameter("res2") // 1000
local x = unit.position_x
local y = unit.position_y
local z = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(x, y)
if z == nil then
  return
end
local vx = vSession.f_coordinateToVisual2(x)
local vy = vSession.f_coordinateToVisual2(y)
local vz = vSession.f_coordinateToVisual2(z) + 50
if reason == 0 or reason == 5 or reason == 6 then
  if res0 ~= 0 then
    vSession.f_createEmitters(0, 14, 1, true, vx + 25, vy, vz, 0, 0, 10, "+" .. res0, resourcesFontId)
    vSession.f_createEmitters(0, 15, 1, true, vx, vy, vz, 0, 0, 10)
  end
  if res1 ~= 0 then
    vSession.f_createEmitters(0, 16, 1, true, vx + 25, vy, vz, 0, 0, 10, "+" .. res1, resourcesFontId)
    vSession.f_createEmitters(0, 17, 1, true, vx, vy, vz, 0, 0, 10)
  end
  if res2 ~= 0 then
    vSession.f_createEmitters(0, 24, 1, true, vx + 25, vy, vz, 0, 0, 10, "+" .. res2, resourcesFontId)
    vSession.f_createEmitters(0, 25, 1, true, vx, vy, vz, 0, 0, 10)
  end
end
