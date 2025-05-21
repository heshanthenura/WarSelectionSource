if isPropertyAvailable(0) ~= 2 then
  shopShow()
  return
end
if getParameter("difficulty") == nil then
  local nodes = interface.nodes
  nodes[793].visible = true
else
  newMatchMode = "horde"
  difficulty = tonumber(getParameter("difficulty"))
  applyGameMode()
  startMatch()
end
