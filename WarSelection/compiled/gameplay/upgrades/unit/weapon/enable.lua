local weaponId = tonumber(getParameter("weapon"))
assert(weaponId ~= nil, "No 'weapon' parameter")
local turretId = tonumber(getParameter("turret"))
local enable = getParameter("enable")
if enable == nil then
  enable = true
end
local attack = root.attack
assert(attack ~= nil, "The unit does not have attack data")
local processWeapon = function(weapon)
  weapon.enabled = enable
end
if turretId == nil then
  local weapon = attack.weapon[weaponId]
  assert(weapon ~= nil, "The unit does not have a weapon with index " .. weaponId)
  processWeapon(weapon)
else
  local turret = attack.turret[turretId]
  assert(turret ~= nil, "The unit does not have a turret with index " .. turretId)
  local weapon = turret.weapon[weaponId]
  assert(weapon ~= nil, "The turret " .. turretId .. " of the unit does not have a weapon with index " .. weaponId)
  processWeapon(weapon)
end
attack.f_updateCachedData()
