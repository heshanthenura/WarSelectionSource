local add = tonumber(getParameter("add"))
local value = getParameter("value")
local nodes = interface.nodes
if add ~= nil then
  value = nodes[5].widget_current + add
  if value < 1 or value > nodes[5].widget_max then
    return
  end
  nodes[5].widget_current = value
end
root.session_gameplay_tickController_tickTime = speeds[value]
nodes[25].visible = true
nodes[25].widget_text = speedsPercent[value]
if repSpeedLerp ~= nil then
  root.functions.interpolator.f_remove(repSpeedLerp)
  repSpeedLerp = nil
end
repSpeedLerp = root.functions.interpolator.f_lerp("interface.replay.nodes.25.color.a", 1, 200, 0, 1000, "interface.replay.nodes.25.visible", false)
