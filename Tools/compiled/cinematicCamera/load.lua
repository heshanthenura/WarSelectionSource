local res = root.session_visual_scene[0].camera_controllers_complex[0].f_load(root.system_localFolder .. "/camera.cin")
if res == 1 then
  return
end
updateCinCameraPositions()
local nodes = interface.nodes
nodes[15].disabled = false
nodes[4].disabled = false
