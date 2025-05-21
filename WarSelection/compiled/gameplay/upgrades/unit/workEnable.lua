local id = tonumber(getParameter("id"))
assert(id ~= nil, "No 'id' parameter")

function toBool(v)
  if type(v) == "number" then
    return v ~= 0
  end
  if type(v) == "string" then
    if v == "true" then
      return true
    end
    local n = tonumber(v)
    return n ~= nil and n ~= 0
  end
  return true
end

local enable = toBool(getParameter("enable"))
local work = root.ability_work[id]
assert(work ~= nil, "The unit has no work with index " .. id)
work.enabled = enable
