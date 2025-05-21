local vSession = root.session_visual
local myFaction = vSession.currentFaction
local sceneId = vSession.currentScene
local gameplay = root.session_gameplay_gameplay
local scene = gameplay.scene[sceneId]
local landscape = scene.landscape
local unitsId = scene.units.f_findIdlers2(myFaction, 8)
local mass = getParameter("mass") == "true"
local units = scene.units_list
local vScene = vSession.scene[0]
if #unitsId < 1 then
  return
end
local selectionList = {}

function createParticles(gUnit, moveCamera)
  local gx = gUnit.position_x
  local gy = gUnit.position_y
  local vx = vSession.f_coordinateToVisual2(gx)
  local vy = vSession.f_coordinateToVisual2(gy)
  local kRadius = 65535 / gameplay.unitTypeModified[gUnit.typeModified].radius
  local radius = 5 / kRadius
  local zg = landscape.f_getHeight(gx, gy)
  local onWater = zg ~= nil and underWater(zg)
  vSession.f_createEmitters(0, 4, radius, false, vx, vy, 0, 0, 0, 0, "", 0, onWater)
  if moveCamera then
    vScene.f_cameraShowPosition(vx, vy)
  end
end

function onSelect(unitId, moveCamera)
  local gUnit = units[unitId]
  if gUnit == nil then
    return
  end
  local tr = gUnit.movement_transportingIn
  if tr ~= nil and tr.value ~= nil then
    if not mass then
      local tUnit = units[tr]
      if tUnit == nil then
        return
      end
      createParticles(tUnit, moveCamera)
      table.insert(selectionList, tr)
    end
    return
  end
  createParticles(gUnit, moveCamera)
  table.insert(selectionList, unitId)
end

if mass then
  for i = 1, #unitsId do
    onSelect(unitsId[i], false)
  end
else
  if idlerWorkerNum > #unitsId then
    idlerWorkerNum = 1
  end
  onSelect(unitsId[idlerWorkerNum], true)
  idlerWorkerNum = idlerWorkerNum + 1
end
local clearSelection = not root.session_visual_hotKeys.f_check(addSelectionHotKey)
vScene.f_selectUnits3(selectionList, clearSelection)
