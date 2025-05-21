local nodes = interface.nodes
local cam = root.session_visual_scene[0].camera_controllers_complex[0]
local frame = nodes[1].widget_currentLine
local frames = cam.frames_size
nodes[15].disabled = frames - 1 <= 1
nodes[4].disabled = frames - 1 <= 1
if frames == 0 then
  return
end
cam.f_remove(frame)
autoCalcCinCameraTimes()
updateCinCameraPositions()
