local sumX = 0
local sumY = 0
local vSession = root.session_visual
local list = vSession.scene[0].selection_units_list
local sz = list.size
if sz == 0 then
  return
end
local gameplay = root.session_gameplay_gameplay
local scene = gameplay.scene[0]
local myFactionId = vSession.currentFaction
local units = scene.units_list
for i = 0, sz - 1 do
  local uid = list[i]
  if uid ~= nil then
    local gUnit = units[uid]
    if gUnit ~= nil then
      local unitType = gameplay.unitTypeModified[gUnit.typeModified]
      assert(unitType ~= nil)
      if canShowUnit(scene, gUnit, unitType, myFactionId) then
        local pos = gUnit.position
        sumX = sumX + pos.x
        sumY = sumY + pos.y
      end
    end
  end
end
if sumX == 0 then
  return
end
local sumX = vSession.f_coordinateToVisual2(math.floor(sumX / sz))
local sumY = vSession.f_coordinateToVisual2(math.floor(sumY / sz))
vSession.scene[0].f_cameraShowPosition(sumX, sumY)
gameplay.dataStorage.f_set("selectGroupTime", gameplay.time)
