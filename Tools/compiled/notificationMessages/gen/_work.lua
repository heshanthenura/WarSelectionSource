if #notificationsListLog > 0 and os.time() - notificationsListLog[1][4] > 5 then
  local id = notificationsListStrings[#notificationsListStrings - #notificationsListLog + 1][1]
  interface.nodes[id].visible = false
  table.remove(notificationsListLog, 1)
end
