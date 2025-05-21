local works = root.ability_work
local mult = tonumber(getParameter("mult"))
if getParameter("work") == nil then
  local size = works.size
  for i = 0, size - 1 do
    local work = works[i]
    work.reserveTime = work.reserveTime * mult // 100
  end
  return
end
local work = works[getParameter("work")]
work.reserveTime = work.reserveTime * mult // 100
if getParameter("work2") ~= nil then
  local work = works[getParameter("work2")]
  work.reserveTime = work.reserveTime * mult // 100
  if getParameter("work3") ~= nil then
    local work = works[getParameter("work3")]
    work.reserveTime = work.reserveTime * mult // 100
  end
end
