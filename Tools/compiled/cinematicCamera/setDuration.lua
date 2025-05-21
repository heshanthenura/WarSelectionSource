local nodes = interface.nodes
local cam = root.session_visual_scene[0].camera_controllers_complex[0]
local dur = tonumber(nodes[11].widget_text_text)
if dur == nil or dur <= 0 then
  return
end
cam.duration = dur
updateCinCameraKeyTime()
