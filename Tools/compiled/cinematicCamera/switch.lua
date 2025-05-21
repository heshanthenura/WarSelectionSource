local cam = root.session_visual_scene[0].camera_controllers_complex[0]
cam.f_switch(getParameter("value"))
updateCinCameraKeyTime()
