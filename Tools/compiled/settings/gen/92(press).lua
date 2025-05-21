local pr = getParameters()
if pr.event == 12 then
  pressedKeys[pr.key] = nil
  return
end
if hotKeyNames[pr.key] == nil then
  return
end
pressedKeys[pr.key] = true
fixedPressedKeys = {}
local s = ""
for v, _ in pairs(pressedKeys) do
  fixedPressedKeys[v] = true
  if s ~= "" then
    s = s .. "+"
  end
  local hkName = hotKeyNames[v]
  if hkName ~= nil then
    s = s .. hkName
  end
end
local nodes = interface.nodes
nodes[99].widget_text = s
nodes[106].visible = true
