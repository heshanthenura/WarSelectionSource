if getParameter("border") ~= nil and not bordersScroll then
  return
end
local addRight = 0
if getParameter("right") ~= nil then
  addRight = tonumber(getParameter("right"))
end
local addForward = 0
if getParameter("forward") ~= nil then
  addForward = tonumber(getParameter("forward"))
end
if getParameter("pressed") ~= nil and not toBool(getParameter("pressed")) then
  addRight = -addRight
  addForward = -addForward
end
local move = root.session_visual_scene[0].camera_controllers_move
if toBool(getParameter("cursor")) then
  moveRightM = moveRightM + addRight
  moveForwardM = moveForwardM + addForward
else
  moveRightK = moveRightK + addRight
  moveForwardK = moveForwardK + addForward
end
if speedUp ~= nil then
  if moveRightK ~= 0 or moveForwardK ~= 0 then
    move.moveSpeed = speedUp
  else
    move.moveSpeed = baseMoveSpeed
  end
end
move.moveForward = 0 < moveForwardK + moveForwardM
move.moveBackward = 0 > moveForwardK + moveForwardM
move.moveRight = 0 < moveRightM + moveRightK
move.moveLeft = 0 > moveRightM + moveRightK
if getParameter("command") ~= nil then
  local command = getParameter("command")
  local pressed = toBool(getParameter("pressed"))
  if command == "turnLeft" then
    move.turnLeft = pressed
  elseif command == "turnRight" then
    move.turnRight = pressed
  elseif command == "moveDown" then
    move.moveDown = pressed
  elseif command == "moveUp" then
    move.moveUp = pressed
  end
end
