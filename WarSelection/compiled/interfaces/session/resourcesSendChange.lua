local nodes = interface.nodes
local sendText = {
  1449,
  1450,
  1455,
  391,
  398
}
local recieveText = {
  1456,
  1457,
  1458,
  396,
  399
}
local sliders = {
  1441,
  1446,
  1452,
  386,
  397
}
local r = tonumber(getParameter("res"))
local val = 0
if getParameter("bySlider") ~= nil then
  val = getParameter("value")
elseif getParameter("bySend") ~= nil then
  val = tonumber(getParameter("text"))
  if val == nil then
    val = 0
  end
  val = math.floor(val)
else
  val = tonumber(getParameter("text"))
  if val == nil then
    val = 0
  end
  val = math.floor(val * 100 / sendResourcesPercent)
end
updateSendResourcesValue(r, val)
