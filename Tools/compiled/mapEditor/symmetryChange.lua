local nodes = interface.nodes
local prevSym = currentSymmetry
currentSymmetry = getParameter("value")
if currentSymmetry == 0 then
  currentSymmetry = nil
end
if prevSym == currentSymmetry then
  return
end
if prevSym ~= nil then
  nodes[symmetryShow[prevSym]].visible = false
end
if currentSymmetry ~= nil then
  nodes[symmetryShow[currentSymmetry]].visible = true
end
