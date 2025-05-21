if not canControl then
  return
end
if not getParameter("pressed") then
  movingCamera = false
  return
end
if trySendSignal(getParameter("x"), getParameter("y"), "lookLandscape") then
  return
end
movingCamera = getParameter("pressed")
if root.session_visual_scene[0].placer_on and not repositionWithPlacer then
  movingCamera = false
else
  cameraToMinimap(getParameter("x"), getParameter("y"))
end
local x, y, xg, yg = getPosition(getParameter("x"), getParameter("y"))
local data = {
  button = "left",
  x = x,
  y = y,
  xg = xg,
  yg = yg
}
root.interface.f_sendEvent("minimapPress", toJson(data))
