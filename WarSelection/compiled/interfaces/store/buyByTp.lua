local widget = getParameter("widget")
for _, co in ipairs(products) do
  if co.widgetsWindow ~= nil and co.widgetsWindow.buyByTp == widget or co.highPrice ~= nil and co.highPrice.buyWidget == widget then
    if root.lobby.f_sendCommand(5, tostring(co.product)) then
      local nodes = interface.nodes
      nodes[1].disabled = true
    else
      showError(localize("<*menuErrorNoLobby>"))
    end
    return
  end
end
