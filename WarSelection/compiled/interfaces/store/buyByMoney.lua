local nodes = interface.nodes
local widget = getParameter("widget")
for i = 1, #products do
  local co = products[i]
  if co.widgetsButton.buyByMoney == widget or co.widgetsWindow ~= nil and co.widgetsWindow.buyByMoney == widget then
    productId = co.product
    local isCountry = co.widgetsWindow ~= nil and co.widgetsWindow.priceByTp ~= nil
    nodes[17].visible = true
    nodes[18].visible = isCountry
    nodes[19].visible = regionCoef < 0.99
    nodes[20].widget_text = 100 - math.floor(regionCoef * 100) .. "%"
    return
  end
end
