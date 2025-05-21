local cam = root.session_visual_scene[0].camera_controllers_complex[0]
local sz = cam.frames_size
autoCalcCinCameraTimes(sz + 1)
cam.add = 1
local nodes = interface.nodes
nodes[15].disabled = sz + 1 <= 1
nodes[4].disabled = sz + 1 <= 1
updateCinCameraPositions()
