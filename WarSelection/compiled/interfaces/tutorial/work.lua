if leaveSession ~= nil then
  if leaveSession == 0 then
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    local nodes = root.interface_menu_nodes
    nodes[1158].visible = false
    nodes[334].disabled = false
    root.session_break = nil
  else
    leaveSession = leaveSession - 1
  end
end
local quest = root.session_gameplay_gameplay_dataStorage_quest
if quest ~= currentQuest then
  finishQuest(currentQuest)
  currentQuest = quest
  startQuest(currentQuest)
end
if quest == "trainWorkers1" then
  local nodesSes = getNodesSession()
  local nodes = interface.nodes
  nodes[37].visible = nodesSes[68].visible and nodesSes[153].visible and nodesSes[153].widget_middle_set_normal == workerImage and not nodesSes[58].visible
elseif quest == "sendInAttackMode" then
  local nodesSes = getNodesSession()
  local nodes = interface.nodes
  nodes[42].visible = nodesSes[945].visible
end
