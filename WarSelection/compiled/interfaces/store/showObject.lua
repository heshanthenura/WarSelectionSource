closeAllWindows()
local nodes = interface.nodes
local widget = getParameter("widget")
for _, co in ipairs(products) do
  if co.widgetsButton.button == widget then
    local ww = co.widgetsWindow
    if ww.confirmation ~= nil then
      nodes[ww.confirmation].widget_checked = false
      nodes[ww.buyPanel].disabled = true
      nodes[ww.couponBuy].disabled = true
    end
    nodes[ww.window].visible = true
    startMusicById(ww.music)
  end
end
