local interface = root.interface_development
if interface == nil then
  return
end
local data = {
  x = getParameter("x"),
  y = getParameter("y"),
  z = getParameter("z"),
  damage = getParameter("damage")
}
interface.f_sendEvent("onDamage", toJson(data))
