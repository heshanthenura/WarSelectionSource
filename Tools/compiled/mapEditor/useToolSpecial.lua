local nodes = interface.nodes
local show = not nodes[42].visible or getParameter("show") ~= nil
hideWindows()
if show then
  openFactionsWindow()
  nodes[42].visible = true
  nodes[53].disabled = true
end
