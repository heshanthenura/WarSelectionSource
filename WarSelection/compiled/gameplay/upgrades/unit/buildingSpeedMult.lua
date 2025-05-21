local buildings = root.movement_building
if getParameter("building") == nil then
  local size = buildings.size
  for i = 0, size - 1 do
    local building = buildings[i]
    building.tickProgress = building.tickProgress * tonumber(getParameter("mult")) // 100
  end
else
  local building = buildings[getParameter("building")]
  building.tickProgress = building.tickProgress * tonumber(getParameter("mult")) // 100
end
