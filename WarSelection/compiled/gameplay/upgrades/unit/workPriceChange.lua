local mult = 100
if getParameter("mult") ~= nil then
  mult = tonumber(getParameter("mult"))
end
local add = 0
if getParameter("add") ~= nil then
  mult = tonumber(getParameter("add"))
end
local resource
if getParameter("resource") ~= nil then
  resource = tonumber(getParameter("resource"))
end
local work = root.ability_work[getParameter("work")]
local costOrder = work.costOrder
local costProcess = work.costProcess
local costStart = work.costStart
local processResource = function(resId)
  costOrder[resId] = costOrder[resId] * mult // 100 + add
  costProcess[resId] = costProcess[resId] * mult // 100 + add
  costStart[resId] = costStart[resId] * mult // 100 + add
end
if resource == nil then
  processResource(0)
  processResource(1)
  processResource(2)
else
  processResource(resource)
end
