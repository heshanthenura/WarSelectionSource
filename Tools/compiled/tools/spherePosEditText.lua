local nodes = interface.nodes
local h = tonumber(nodes[57].widget_text_text)
local v = tonumber(nodes[58].widget_text_text)
if h < 0 then
  h = 0
  nodes[57].widget_text_text = h
end
if h > nodes[55].widget_max then
  h = nodes[55].widget_max
  nodes[57].widget_text_text = h
end
if v < 0 then
  v = 0
  nodes[58].widget_text_text = v
end
if v > nodes[55].widget_max then
  v = nodes[56].widget_max
  nodes[58].widget_text_text = v
end
nodes[55].widget_current = h
nodes[56].widget_current = v
local h = nodes[55].widget_current / 1000 * math.pi
local d = nodes[56].widget_current / 500 * math.pi
local hh = math.sin(h)
local x = hh * math.cos(d) * sphereRadius
local y = hh * math.sin(d) * sphereRadius
local z = math.cos(h) * sphereRadius
sendEventVector(x, y, z)
