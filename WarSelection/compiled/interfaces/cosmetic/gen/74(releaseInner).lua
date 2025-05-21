local nodes = interface.nodes
editingButton = tonumber(getParameter("button"))
nodes[58].visible = true
for _, id in ipairs(statueButtonChoose) do
  nodes[id].disabled = false
end
statueChooseButton = statuesOnButtonsTemp[editingButton]
if statueChooseButton ~= nil then
  nodes[statueButtonChoose[statueChooseButton]].disabled = true
end
