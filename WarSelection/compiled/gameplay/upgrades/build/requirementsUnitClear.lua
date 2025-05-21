local unitId
if getParameter("unitId") ~= nil then
  unitId = tonumber(getParameter("unitId"))
end
local req = root.faction[getParameter("faction")].build[getParameter("id")].requirements_unit
if unitId == nil then
  req.f_clear()
elseif req[unitId] ~= nil then
  req.f_remove(unitId)
end
