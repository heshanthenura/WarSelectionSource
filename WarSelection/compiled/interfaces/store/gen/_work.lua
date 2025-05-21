if couponTime ~= nil then
  local nodes = interface.nodes
  local haveTime = couponTime - getCurrentServerTime()
  nodes[125].widget_text = toTimeStr(haveTime)
end
local dt = 1744621200
if dt ~= nil then
  local servTm = getCurrentServerTime()
  local dt = dt - servTm
  local dtPos = 0 < dt
  local nodes = interface.nodes
  if not dtPos then
    dt = 0
  end
  for _, co in ipairs(products) do
    if co.highPrice ~= nil then
      local tm = toTimeStr(dt)
      nodes[co.widgetsWindow.buyByTp].disabled = dtPos or techPoints < co.priceTp
      nodes[co.highPrice.buyWidget1].visible = dtPos
      nodes[co.highPrice.buyWidget2].visible = dtPos
      nodes[co.highPrice.timer1[1]].visible = dtPos
      nodes[co.highPrice.timer2[1]].visible = dtPos
      nodes[co.highPrice.timer1[2]].widget_text = tm
      nodes[co.highPrice.timer2[2]].widget_text = tm
    end
  end
end
