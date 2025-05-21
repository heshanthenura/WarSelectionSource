local nodes = interface.nodes
local line = nodes[2].widget_currentLine
local f = friends[line + 1]
assert(f[4] ~= nil)
local d = fromJson(f[4])
if d ~= nil and d.private ~= nil then
  root.interface.f_sendEvent("joinPrivate", d.private.code)
end
