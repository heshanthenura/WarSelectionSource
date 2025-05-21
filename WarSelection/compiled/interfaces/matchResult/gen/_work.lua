if leaveSession ~= nil then
  if leaveSession == 0 then
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    local nodes = root.interface_menu_nodes
    nodes[1158].visible = false
    nodes[334].disabled = false
    root.session.f_break()
  else
    leaveSession = leaveSession - 1
  end
end
