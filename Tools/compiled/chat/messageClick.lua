if not isModeNetwork then
  return
end
local strPos = #chatLog - tonumber(getParameter("string"))
local l = chatLog[strPos]
if l == nil then
  return
end
local player = l[1]
if player == root.session_gameplay_controlledPlayer then
  return
end
root.interface.f_sendEvent("chatPlayerClick", tostring(player))
