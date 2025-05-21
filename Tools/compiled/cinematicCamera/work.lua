if cinematic == true then
  local cam = root.session_visual_scene[0].camera_controllers_complex[0]
  if cam.state ~= 1 and cam.state ~= 2 then
    cinematic = false
    if interface.nodes[5].widget_checked then
      hideInterfaces(false)
    end
  end
end
