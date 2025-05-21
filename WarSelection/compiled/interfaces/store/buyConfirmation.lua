local nodes = interface.nodes
nodes[17].visible = false
if getParameter("cancel") ~= nil then
  return
end
productBuy(productId)
