local researchId
if getParameter("researchId") ~= nil then
  researchId = tonumber(getParameter("researchId"))
end
local req = root.faction[getParameter("faction")].build[getParameter("id")].requirements_research
if researchId == nil then
  req.f_clear()
elseif req[researchId] ~= nil then
  req.f_remove(researchId)
end
