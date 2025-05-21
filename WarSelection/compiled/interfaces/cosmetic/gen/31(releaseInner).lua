local nodes = interface.nodes
if statueChooseButton ~= nil then
  nodes[statueButtonChoose[statueChooseButton]].disabled = false
end
statueChooseButton = tonumber(getParameter("button"))
nodes[statueButtonChoose[statueChooseButton]].disabled = true
