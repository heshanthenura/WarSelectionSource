local color
while true do
  color = math.random(64)
  local success = true
  for i = 1, #factionsList do
    success = success and factionsList[i].color ~= color
  end
  if success then
    break
  end
end
table.insert(factionsList, {
  name = nonameFaction,
  color = color,
  relations = {},
  team = 1
})
local nodes = interface.nodes
if not nodes[256].widget_checked then
  for facId = 1, #factionsList - 1 do
    if factionsList[facId].team == 1 then
      factionsList[#factionsList].relations = deepCopy(factionsList[facId].relations)
      break
    end
  end
end
updateFactionsList()
markMapNotSaved()
