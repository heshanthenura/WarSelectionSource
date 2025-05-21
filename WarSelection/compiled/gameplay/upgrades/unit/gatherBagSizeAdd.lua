if getParameter("gather") == nil then
  local sz = root.movement_gather_size
  for i = 0, sz - 1 do
    local gather = root.movement_gather[i]
    gather.bagSize = gather.bagSize + tonumber(getParameter("add"))
  end
else
  local gather = root.movement_gather[getParameter("gather")]
  gather.bagSize = gather.bagSize + tonumber(getParameter("add"))
end
