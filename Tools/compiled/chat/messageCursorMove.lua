if not isModeNetwork then
  return
end
local strPos = #chatLog - tonumber(getParameter("string"))
local l = chatLog[strPos]
if l == nil then
  return
end
local player = l[1]
local show = getParameter("event") == 7 and player ~= root.session_gameplay_controlledPlayer
local nodes = interface.nodes
local parent = nodes[getParameter("widget")]
local widget = nodes[2]
widget.visible = show
widget.localLeft = parent.localLeft + 20
widget.localTop = parent.localTop
