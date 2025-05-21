cinematic = true
local cam = root.session_visual_scene[0].camera_controllers_complex[0]
if interface.nodes[5].widget_checked then
  hideInterfaces(true)
end
cam.f_play()
