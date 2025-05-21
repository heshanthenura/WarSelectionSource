log("Start")
exceptionList = {
  251,
  274,
  308,
  334,
  357,
  383,
  384,
  396,
  399,
  434,
  413,
  414,
  415,
  416,
  417,
  418,
  419,
  420,
  421,
  422,
  423,
  424,
  425,
  426,
  427,
  428,
  429,
  430,
  431,
  432,
  433,
  434,
  435,
  450,
  451
}
local maxWeapon = 3
local maxTurret = 3
local maxTurretWeapon = 1
local maxArmor = 3
s = "id,radius,viewRange,storageMultiplier,health"
for a = 0, maxArmor do
  s = s .. ",armor" .. a + 1 .. "p,armor" .. a + 1 .. "t"
end
s = s .. ",moveSpeed,rotationSpeed,pathTracker,supplyTake,supplyCost"
for t = 0, 63 do
  s = s .. ",tag" .. t
end
for t = 0, 63 do
  s = s .. ",sTag" .. t
end

function outHeaderWeapon(w, prefix)
  local s = "," .. prefix .. w + 1 .. "DistanceMin," .. prefix .. w + 1 .. "DistanceMax," .. prefix .. w + 1 .. "Spread," .. prefix .. w + 1 .. "RechargePeriod," .. prefix .. w + 1 .. "AttackPoints," .. prefix .. w + 1 .. "AttacksPerPoint," .. prefix .. w + 1 .. "DamagesCount," .. prefix .. w + 1 .. "DamageRadius," .. prefix .. w + 1 .. "Sector," .. prefix .. w + 1 .. "ProjSpeed," .. prefix .. w + 1 .. "DamageFriendly," .. prefix .. w + 1 .. "Buff"
  for i = 0, 63 do
    s = s .. "," .. prefix .. w + 1 .. "Damage" .. i
  end
  return s
end

for w = 0, maxWeapon do
  s = s .. outHeaderWeapon(w, "weapon")
end
for t = 0, maxTurret do
  s = s .. ",turret" .. t .. "Speed"
  for w = 0, maxTurretWeapon do
    s = s .. outHeaderWeapon(w, "turret" .. t .. "Weapon")
  end
end
s = s .. "\n"
local unitTypes = root.project.gameplay.unitType
local projTypes = root.project.gameplay.projectileType
local maxRadius = 0
local maxViewRange = 0
local maxStorageMultiplier = 0
local maxHealth = 0
local maxArmorThickness = 0
local maxMoveSpeed = 0
local maxRotationSpeed = 0
local maxWeaponDistance = 0
local maxSpread = 0
local maxProjectileSpeed = 0
local maxRechargePeriod = 0
local maxAttacks = 0
local maxDamageRadius = 0
local maxSectorAngle = 0
local maxDamage = 0
local maxSupply = 0

function updateWeaponMax(weapon)
  if weapon ~= nil then
    local damage = weapon.damage
    if weapon.distanceMax > maxWeaponDistance then
      maxWeaponDistance = weapon.distanceMax
    end
    if weapon.spread > maxSpread then
      maxSpread = weapon.spread
    end
    if weapon.rechargePeriod > maxRechargePeriod then
      maxRechargePeriod = weapon.rechargePeriod
    end
    if weapon.attackPoints > maxAttacks then
      maxAttacks = weapon.attackPoints
    end
    if damage.damagesCount > maxAttacks then
      maxAttacks = damage.damagesCount
    end
    if weapon.attacksPerPoint > maxAttacks then
      maxAttacks = weapon.attacksPerPoint
    end
    if damage.radius > maxDamageRadius then
      maxDamageRadius = damage.radius
    end
    if damage.sectorAngle > maxSectorAngle then
      maxSectorAngle = damage.sectorAngle
    end
    local projId = weapon.projectile
    if projId ~= nil and projTypes[projId].speed > maxProjectileSpeed then
      maxProjectileSpeed = projTypes[projId].speed
    end
    local damages = damage.damages
    for i = 0, 63 do
      local dmg = damages[i]
      if dmg ~= nil and dmg > maxDamage then
        maxDamage = dmg
      end
    end
  end
end

for i = 0, 1000 do
  local unitType = unitTypes[i]
  local exc = false
  for _, id in ipairs(exceptionList) do
    exc = exc or i == id
  end
  if not exc and unitType ~= nil then
    local deathability = unitType.deathability
    if deathability ~= nil then
      if maxRadius < unitType.radius then
        maxRadius = unitType.radius
      end
      if maxViewRange < unitType.viewRange then
        maxViewRange = unitType.viewRange
      end
      if maxStorageMultiplier < unitType.storageMultiplier then
        maxStorageMultiplier = unitType.storageMultiplier
      end
      if maxHealth < deathability.health then
        maxHealth = deathability.health
      end
      if deathability.armor.data ~= nil then
        for a = 0, maxArmor do
          local armor = deathability.armor.data[a]
          if armor ~= nil and maxArmorThickness < armor.object.thickness then
            maxArmorThickness = armor.object.thickness
          end
        end
      end
    end
    local movement = unitType.movement
    if movement ~= nil then
      if maxMoveSpeed < movement.moveSpeed then
        maxMoveSpeed = movement.moveSpeed
      end
      if maxRotationSpeed < movement.rotationSpeed then
        maxRotationSpeed = movement.rotationSpeed
      end
    end
    local supply = unitType.supply
    if supply ~= nil then
      if maxSupply < supply.takes then
        maxSupply = supply.takes
      end
      if maxSupply < supply.cost then
        maxSupply = supply.cost
      end
    end
    local attack = unitType.attack
    if attack ~= nil then
      for w = 0, maxWeapon do
        updateWeaponMax(attack.weapon[w])
      end
      for t = 0, maxTurret do
        local turret = attack.turret[t]
        if turret ~= nil then
          if maxRotationSpeed < turret.rotationSpeed then
            maxRotationSpeed = turret.rotationSpeed
          end
          for w = 0, maxTurretWeapon do
            updateWeaponMax(turret.weapon[w])
          end
        end
      end
    end
  end
end
maxProjectileSpeed = math.floor(math.sqrt(maxProjectileSpeed))

function outWeapon(weapon)
  local res = ""
  if weapon == nil then
    res = ",0,0,0,0,0,0,0,0,0,0,0,0"
    for i = 0, 63 do
      res = res .. ",0"
    end
  else
    local damage = weapon.damage
    local damages = damage.damages
    local projId = weapon.projectile
    res = res .. "," .. weapon.distanceMin / maxWeaponDistance .. "," .. weapon.distanceMax / maxWeaponDistance .. "," .. weapon.spread / maxSpread .. "," .. weapon.rechargePeriod / maxRechargePeriod .. "," .. weapon.attackPoints / maxAttacks .. "," .. weapon.attacksPerPoint / maxAttacks .. "," .. damage.damagesCount / maxAttacks .. "," .. damage.radius / maxDamageRadius .. "," .. damage.sectorAngle / maxSectorAngle
    if projId == nil then
      res = res .. ",0"
    else
      res = res .. "," .. math.floor(math.sqrt(projTypes[projId].speed)) / maxProjectileSpeed
    end
    if damage.damageFriendly then
      res = res .. ",1"
    else
      res = res .. ",0"
    end
    if damage.buff ~= nil then
      res = res .. ",1"
    else
      res = res .. ",0"
    end
    for i = 0, 63 do
      local dmg = damages[i]
      if dmg == nil then
        res = res .. ",0"
      else
        res = res .. "," .. dmg / maxDamage
      end
    end
  end
  return res
end

function outTurret(turret)
  local res = ""
  if turret == nil then
    res = ",0"
    for w = 0, maxTurretWeapon do
      res = res .. outWeapon(nil)
    end
  else
    res = res .. "," .. turret.rotationSpeed / maxRotationSpeed
    for w = 0, maxTurretWeapon do
      res = res .. outWeapon(turret.weapon[w])
    end
  end
  return res
end

root.system_files.f_saveData("unitsTrain.csv", s)
s = ""
for i = 0, 1000 do
  local unitType = unitTypes[i]
  local unitType = unitTypes[i]
  local exc = false
  for _, id in ipairs(exceptionList) do
    exc = exc or i == id
  end
  if not exc and unitType ~= nil then
    local deathability = unitType.deathability
    if deathability ~= nil then
      s = s .. i .. "," .. unitType.radius / maxRadius .. "," .. unitType.viewRange / maxViewRange .. "," .. unitType.storageMultiplier / maxStorageMultiplier
      s = s .. "," .. deathability.health / maxHealth
      if deathability.armor.data ~= nil then
        local probSum = 0
        for a = 0, maxArmor do
          local armor = deathability.armor.data[a]
          if armor ~= nil then
            probSum = probSum + armor.probability
          end
        end
        for a = 0, maxArmor do
          local armor = deathability.armor.data[a]
          if armor ~= nil then
            s = s .. "," .. armor.probability / probSum .. "," .. armor.object.thickness / maxArmorThickness
          else
            s = s .. ",0,0"
          end
        end
      else
        for a = 0, maxArmor do
          s = s .. ",0,0"
        end
      end
      local movement = unitType.movement
      if movement ~= nil then
        s = s .. "," .. movement.moveSpeed / maxMoveSpeed .. "," .. movement.rotationSpeed / maxRotationSpeed
        if movement.pathTracker == 1 then
          s = s .. ",0"
        else
          s = s .. ",1"
        end
      else
        s = s .. ",0,0,0"
      end
      local supply = unitType.supply
      if supply ~= nil then
        s = s .. "," .. supply.takes / maxSupply .. "," .. supply.cost / maxSupply
      else
        s = s .. ",0,0"
      end
      for t = 0, 63 do
        if unitType.tags[t] then
          s = s .. ",1"
        else
          s = s .. ",0"
        end
      end
      for t = 0, 63 do
        if unitType.searchTags[t] then
          s = s .. ",1"
        else
          s = s .. ",0"
        end
      end
      local attack = unitType.attack
      if attack ~= nil then
        for w = 0, maxWeapon do
          s = s .. outWeapon(attack.weapon[w])
        end
        for t = 0, maxTurret do
          s = s .. outTurret(attack.turret[t])
        end
      else
        for w = 0, maxWeapon do
          s = s .. outWeapon(nil)
        end
        for t = 0, maxTurret do
          s = s .. outTurret(nil)
        end
      end
      s = s .. "\n"
      root.system_files.f_saveData("unitsTrain.csv", s, true)
      s = ""
    end
  end
end
log("Done")
