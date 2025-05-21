local pressed = toBool(getParameter("pressed"))
local move = root.session_visual_scene[0].camera_controllers_move
if pressed then
  baseMoveSpeed = move.moveSpeed
  speedUp = move.moveSpeed * fastMove
  if moveRightK ~= 0 or moveForwardK ~= 0 then
    move.moveSpeed = speedUp
  end
else
  move.moveSpeed = baseMoveSpeed
  speedUp = nil
end
