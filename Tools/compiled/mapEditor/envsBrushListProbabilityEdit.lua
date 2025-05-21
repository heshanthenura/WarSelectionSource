local nodes = interface.nodes
local id = nodes[18].widget_currentLine
if id == nil then
  return
end
local e = envsList[id + 1]
local prob = tonumber(nodes[46].widget_text_text)
if prob == nil or prob <= 0 then
  return
end
e[3] = math.floor(prob)
nodes[18].widget_lines[id] = e[3] .. "p " .. e[1] .. " - " .. e[2]
updateProb()
