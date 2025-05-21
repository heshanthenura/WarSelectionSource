local nodes = interface.nodes
local setValue = nodes[24].widget_current
if setValue < 50 then
  setInterfaceScale(0.5 + setValue / 100)
else
  setInterfaceScale(setValue / 50)
end
