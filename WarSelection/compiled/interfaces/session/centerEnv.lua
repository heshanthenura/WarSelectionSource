local vSes = root.session_visual
if vSes.scene[0].selection_env == nil then
  return
end
local id = vSes.scene[0].selection_env
local gEnv = root.session_gameplay_gameplay_scene[0].env[id]
local vx = vSes.f_coordinateToVisual2(gEnv.position_x)
local vy = vSes.f_coordinateToVisual2(gEnv.position_y)
vSes.scene[0].f_cameraShowPosition(vx, vy)
