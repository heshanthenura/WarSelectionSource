local planId = buildPlansAbilities[buildPlansId][tonumber(getParameter("button"))]
if planId < 0 then
  return
end
startPlacing(planId)
