local country = ""
if getParameter("country") ~= nil then
  country = getParameter("country")
end
local initiator = getParameter("initiator")
local scene = root.scene[0]
if country == "gb" then
  scene.units_operation.f_transform(initiator, 254)
elseif country == "in" then
  scene.units_operation.f_transform(initiator, 264)
elseif country == "tr" then
  scene.units_operation.f_transform(initiator, 271)
elseif country == "ge" then
  scene.units_operation.f_transform(initiator, 282)
elseif country == "ru" then
  scene.units_operation.f_transform(initiator, 302)
elseif country == "fr" then
  scene.units_operation.f_transform(initiator, 323)
elseif country == "cn" then
  scene.units_operation.f_transform(initiator, 337)
elseif country == "jp" then
  scene.units_operation.f_transform(initiator, 358)
elseif country == "pl" then
  scene.units_operation.f_transform(initiator, 372)
elseif country == "hu" then
  scene.units_operation.f_transform(initiator, 385)
elseif country == "ir" then
  scene.units_operation.f_transform(initiator, 402)
elseif country == "it" then
  scene.units_operation.f_transform(initiator, 436)
else
  scene.units_operation.f_transform(initiator, 190)
end
scene.faction[getParameter("faction")].f_removeBuildPlans()
local b = root.faction[getParameter("faction")].build
b[26].available = false
b[28].available = false
b[44].available = false
b[45].available = false
b[46].available = false
b[47].available = false
b[48].available = false
b[49].available = false
b[50].available = false
b[74].available = false
b[75].available = false
b[76].available = false
b[27].available = false
b[29].available = false
b[31].available = false
b[32].available = false
b[33].available = false
b[34].available = false
b[35].available = false
b[36].available = false
b[37].available = false
b[77].available = false
b[78].available = false
b[79].available = false
b[40].available = false
b[42].available = false
b[51].available = false
b[52].available = false
b[53].available = false
b[54].available = false
b[56].available = false
b[57].available = false
b[58].available = false
b[67].available = false
b[80].available = false
b[81].available = false
b[82].available = false
b[41].available = false
b[43].available = false
b[59].available = false
b[60].available = false
b[61].available = false
b[62].available = false
b[63].available = false
b[64].available = false
b[65].available = false
b[66].available = false
b[83].available = false
b[84].available = false
b[85].available = false
