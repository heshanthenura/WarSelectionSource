assert(root.dataStorage ~= nil, "This upgrade can not be applied to a unit")
local mult = tonumber(root.dataStorage.supplyMult)
local add = tonumber(getParameter("add"))
assert(add ~= nil, "The 'add' parameter is not set")
if mult == nil then
  mult = 100
end
local factionId = getParameter("faction")
local supply = root.scene[0].faction[factionId].supply
supply.limitMax = supply.limitMax + math.floor(add * mult // 100)
