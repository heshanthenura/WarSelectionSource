local nodes = interface.nodes
local slider
if getParameter("slider") == "1" then
  slider = nodes[55].widget
else
  slider = nodes[56].widget
end
local v = slider.current + tonumber(getParameter("add"))
if v < 0 or v > slider.max then
  return
end
slider.current = v
spherePosUpdateFromSliders()
