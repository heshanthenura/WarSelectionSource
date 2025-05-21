local v = 5 * getParameter("value")
root.session_visual_scene[0].camera_lerpStatePeriod = v
root.storage.f_set("cameraInertia", v)
