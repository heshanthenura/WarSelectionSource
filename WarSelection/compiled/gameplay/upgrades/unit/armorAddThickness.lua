local armor = root.deathability_armor_data
local size = armor.size
local mod = function(armorId, add, mult)
  if add == nil then
    add = 0
  end
  if mult == nil then
    mult = 100
  end
  local a = armor[armorId]
  a.object_thickness = a.object_thickness * mult // 100 + add
end
if 0 < size then
  mod(tonumber(getParameter("armor")), tonumber(getParameter("add")), tonumber(getParameter("mult")))
  if 1 < size and getParameter("armor2") ~= nil then
    mod(tonumber(getParameter("armor2")), tonumber(getParameter("add2")), tonumber(getParameter("mult2")))
    if 2 < size and getParameter("armor3") ~= nil then
      mod(tonumber(getParameter("armor3")), tonumber(getParameter("add3")), tonumber(getParameter("mult3")))
      if 3 < size and getParameter("armor4") ~= nil then
        mod(tonumber(getParameter("armor4")), tonumber(getParameter("add4")), tonumber(getParameter("mult4")))
      end
    end
  end
end
