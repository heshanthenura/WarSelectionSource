playersChatBan[complaintPlayer] = getParameter("value") > 0
local data = {
  player = complaintPlayer,
  block = getParameter("value") > 0
}
root.interface.f_sendEvent("playerCommunicationBlock", toJson(data))
root.session_visual_script_scripts.f_run(9, "name", "signalsBlock", "player", complaintPlayer, "block", data.block)
