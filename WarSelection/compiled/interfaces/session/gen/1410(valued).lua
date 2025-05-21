local setBan = getParameter("value") > 0
playersChatBan[complaintPlayer] = setBan
local data = {
  player = complaintPlayer,
  block = setBan
}
root.interface.f_sendEvent("playerCommunicationBlock", toJson(data))
root.session_visual_script_scripts.f_run(9, "name", "signalsBlock", "player", complaintPlayer, "block", setBan)
local bans = root.storage_bans
if bans ~= nil then
  bans = fromJson(bans)
end
if bans == nil then
  bans = {}
end
local localId = playersLocalId[complaintPlayer + 1]
if setBan then
  bans[localId] = root.system_time
else
  bans[localId] = nil
end
root.storage.f_set("bans", toJson(bans))
