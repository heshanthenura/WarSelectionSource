local works = root.ability_work
local add = tonumber(getParameter("add"))
if getParameter("work") == nil then
  local size = works.size
  for i = 0, size - 1 do
    local work = works[i]
    work.reserveLimit = work.reserveLimit + add
  end
  return
end
local work = works[getParameter("work")]
work.reserveLimit = work.reserveLimit + add
if getParameter("work2") ~= nil then
  local work = works[getParameter("work2")]
  work.reserveLimit = work.reserveLimit + add
  if getParameter("work3") ~= nil then
    local work = works[getParameter("work3")]
    work.reserveLimit = work.reserveLimit + add
  end
end
