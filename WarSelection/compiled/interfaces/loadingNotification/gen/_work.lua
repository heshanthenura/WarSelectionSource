if root.activeLoadings > 0 or 0 < root.activeParsings then
  contentLoadingTime = os.time()
  interface.nodes[1].visible = true
elseif contentLoadingTime ~= nil and os.time() > contentLoadingTime + 1 then
  contentLoadingTime = nil
  interface.nodes[1].visible = false
end
