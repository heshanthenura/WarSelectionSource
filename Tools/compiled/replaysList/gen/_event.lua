local eventName = getParameter("name")
if eventName == "clearList" then
  mathcesList = nil
  interface.nodes[4].visible = false
  return
end
if eventName == "loadReplay" then
  local replayCode = getParameter("data")
  startLoadingReplay(replayCode)
  return
end
