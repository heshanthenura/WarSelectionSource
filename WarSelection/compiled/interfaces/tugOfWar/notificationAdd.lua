local signalType = getParameter("type")
local player = getParameter("player")
if signalType == "lookUnit" or signalType == "moveUnit" then
  addListNotification(player, "<*signalLookUnit/0>" .. unitNames[getParameter("unitType") + 1] .. "<*signalLookUnit/1>", 4285267843)
elseif signalType == "lookEnemy" or signalType == "moveEnemy" then
  addListNotification(player, "<*signalLookEnemy/0>" .. unitNames[getParameter("unitType") + 1] .. "<*signalLookEnemy/1>", 4285295871)
else
  addListNotification(player, "<*signalLookLandscape>", 4285267843)
end
