local vSession = root.session_visual
local units = root.session_gameplay_gameplay_scene[0].units
local unitId = searchUnit(units, vSession.currentFaction, 32)
if unitId == nil then
  return
end
local unit = units.list[unitId]
local scene = vSession.scene[0]
scene.f_cameraShowPosition(unit.position_x / 256, unit.position_y / 256)
if getParameter("select") ~= nil then
  scene.f_selectUnits3(unitId, true)
  local nodes = interface.nodes
  nodes[133].visible = false
end
