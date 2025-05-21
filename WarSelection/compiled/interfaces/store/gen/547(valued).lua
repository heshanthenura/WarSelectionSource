local widget = getParameter("widget")
local value = getParameter("value") == 0
local nodes = interface.nodes
for _, co in ipairs(products) do
  if co.widgetsWindow ~= nil and co.widgetsWindow.confirmation == widget then
    nodes[co.widgetsWindow.buyPanel].disabled = value
    nodes[co.widgetsWindow.couponBuy].disabled = value
  end
end
