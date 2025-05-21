if not root.movementOn then
  return
end
local add = tonumber(getParameter("add"))
local mult = tonumber(getParameter("mult"))
local addR = tonumber(getParameter("addRotation"))
local multR = tonumber(getParameter("multRotation"))
if add == nil then
  add = 0
end
if mult == nil then
  mult = 100
end
if addR == nil then
  addR = 0
end
if multR == nil then
  multR = 100
end
root.movement_moveSpeed = root.movement_moveSpeed * mult // 100 + add
root.movement_rotationSpeed = root.movement_rotationSpeed * multR // 100 + addR
if root.notAgro == nil then
  root.movement_moveAgroSpeed = root.movement_moveAgroSpeed * mult // 100 + add
end
