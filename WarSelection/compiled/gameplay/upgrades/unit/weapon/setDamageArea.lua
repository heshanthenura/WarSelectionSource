local weaponId = tonumber(getParameter("weapon"))
local turretId = tonumber(getParameter("turret"))
local area = getParameter("area")
assert(area ~= nil, "No 'area' parameter")
local attack = root.attack
assert(attack ~= nil, "The unit does not have attack data")
local processWeapon = function(weapon)
  weapon.damage_area = area
end
local processWeapons = function(weapons)
  if weaponId == nil then
    for i = 0, weapons.size - 1 do
      processWeapon(weapons[i])
    end
  else
    local weapon = weapons[weaponId]
    assert(weapon ~= nil, "The unit does not have a weapon with index " .. weaponId)
    processWeapon(weapons[weaponId])
  end
end
if turretId == nil then
  processWeapons(attack.weapon)
elseif turretId < 0 then
  for i = 0, attack.turret_size - 1 do
    processWeapons(attack.turret[i].weapon)
  end
else
  local turret = attack.turret[turretId]
  assert(turret ~= nil, "The unit does not have a turret with index " .. turretId)
  processWeapons(turret.weapon)
end
