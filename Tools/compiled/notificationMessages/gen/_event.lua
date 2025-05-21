if getParameter("name") ~= "addNotification" then
  return
end
local data = fromJson(getParameter("data"))
local text = data.text
local color = data.color
local player = {
  data.playerName,
  data.playerColorMain,
  data.playerColorBorder
}
table.insert(player, fonts[root.functions.f_detectLanguage(player[1])])
assert(player[4] ~= nil)
assert(text ~= nil)
local moment = os.time()
table.insert(notificationsListLog, {
  player,
  text,
  color,
  moment
})
if #notificationsListLog > #notificationsListStrings then
  table.remove(notificationsListLog, 1)
end
updateNotificationsList()
