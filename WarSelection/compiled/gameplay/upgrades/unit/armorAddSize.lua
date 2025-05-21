local armor = root.deathability_armor_data
local addVal = tonumber(getParameter("add"))
local add = function(armorId)
  local a = armor[armorId]
  a.probability = a.probability + addVal
end
add(tonumber(getParameter("armor")))
if getParameter("armor2") ~= nil then
  add(tonumber(getParameter("armor2")))
  if getParameter("armor3") ~= nil then
    add(tonumber(getParameter("armor3")))
  end
end
