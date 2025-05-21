playersChatBan[complaintPlayer] = getParameter("value") > 0
root.session_visual_script_scripts_run = {
  38,
  "player",
  complaintPlayer,
  "block",
  getParameter("value") > 0
}
