local nodes = interface.nodes
local cl = nodes[1175].visible
clearChooseModeWindows()
if cl then
  return
end
nodes[1175].visible = true
root.storage.f_set("shownCoupons", #account.coupons)
nodes[868].visible = false
nodes[1629].visible = #account.coupons > 0
