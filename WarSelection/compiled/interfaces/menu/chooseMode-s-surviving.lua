if isPropertyAvailable(0) ~= 2 then
  shopShow()
  return
end
if getParameter("difficulty") == nil then
  local nodes = interface.nodes
  nodes[148].visible = true
else
  newMatchMode = "survival"
  difficulty = tonumber(getParameter("difficulty"))
  applyGameMode()
  startMatch()
end
