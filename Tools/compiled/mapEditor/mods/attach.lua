local nodes = interface.nodes
local mod = nodes[273].widget_text_text
if mod == "" then
  return
end
if string.len(mod) ~= 15 then
  return
end
if string.sub(mod, 1, 4) ~= "mod-" then
  return
end
local code = string.sub(mod, 5, 15)
attachMod(code)
