local add = tonumber(getParameter("add"))
local mult = tonumber(getParameter("mult"))
if add == nil then
  add = 0
end
if mult == nil then
  mult = 100
end
root.viewRange = root.viewRange * mult // 100 + add
