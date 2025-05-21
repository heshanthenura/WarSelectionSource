unitTypesAddress = getParameter("unitTypesAddress")
parentInterface = getParameter("parent")
if unitTypesAddress == nil then
  unitTypesAddress = "session.gameplay.gameplay.unitType"
end
local data = fromJson(getParameter("data"))
if data ~= nil then
  nationNames = data.nationNames
  unitNames = data.unitNames
  unitNations = data.unitNations
end
if nationNames ~= nil then
  local textAllCategories = localize("<*allCategories>")
  local nodes = interface.nodes
  local lines = nodes[302].widget_lines
  lines.f_clear()
  lines.f_create(textAllCategories)
  for i = 1, #nationNames do
    lines.f_create(nationNames[i])
  end
end
