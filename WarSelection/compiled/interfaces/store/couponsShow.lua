local nodes = interface.nodes
if nodes[2].visible then
  nodes[2].visible = false
  return
end
closeAllWindows()
local widget = getParameter("widget")
for i = 1, #products do
  local co = products[i]
  if co.widgetsButton.couponBuy == widget or co.widgetsWindow ~= nil and co.widgetsWindow.couponBuy == widget then
    nodes[2].visible = true
    couponProduct = co.product
    nodes[4].widget_text = productNames[couponProduct + 1]
    nodes[5].widget_text_text = 1
    nodes[7].widget_checked = false
    nodes[6].visible = regionCoef < 100
    couponsUpdatePrice()
  end
end
