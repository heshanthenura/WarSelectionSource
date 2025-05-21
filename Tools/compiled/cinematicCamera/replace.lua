local nodes = interface.nodes
local cam = root.session_visual_scene[0].camera_controllers_complex[0]
local camNum = nodes[1].widget_currentLine
if camNum == nil then
  return
end
cam.f_replace(camNum)
updateCinCameraPositions()
