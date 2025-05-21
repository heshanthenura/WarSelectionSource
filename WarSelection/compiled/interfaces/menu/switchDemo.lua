local nodes = interface.nodes
local wId = getParameter("widget")
local on = nodes[wId].widget_checked
root.storage.f_set("showDemo", on)
local n = nodes[986]
n.visible = not on
if on then
  if sessionWork then
    nodes[wId].widget_checked = false
    n.visible = false
    return
  end
  assert(startSessionTask == nil)
  assert(not sessionWork)
  assert(root.session.gameplay == nil)
  startDemo()
else
  if root.session.gameplay == nil then
    nodes[wId].widget_checked = true
    n.visible = true
    return
  end
  root.session.f_break(true)
  demoSessionWork = false
  n.color_a = 255
  demoShowTime = nil
  unloadObscuringPicture()
end
