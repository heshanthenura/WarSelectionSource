local json = fromJson(account.lastMatchResult)
if json.replay == nil then
  return
end
interface.nodes[637].disabled = true
root.interface_replaysList.f_sendEvent("loadReplay", "rep-" .. json.replay)
