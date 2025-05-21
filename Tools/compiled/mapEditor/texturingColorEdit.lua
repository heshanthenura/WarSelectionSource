editingColor = tonumber(getParameter("color"))
local nodes = interface.nodes
local color = 0
if editingColor == 1 then
  color = nodes[5].widget_color_value
else
  color = nodes[13].widget_color_value
end
local data = {color = color, withAlpha = false}
root.interface[toolsInterface].f_sendEvent("colorStart", toJson(data))
