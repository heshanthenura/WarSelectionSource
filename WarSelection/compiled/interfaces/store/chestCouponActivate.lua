if root.lobby.f_sendCommand(0, "\"" .. chestCoupon .. "\"") then
  local nodes = interface.nodes
  closeChestWindow()
  nodes[351].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
