local command = getCommands()
if command == nil then
  return
end
local s = ""
local b = false
for unitTypeId, _ in pairs(danceUnitTypes) do
  if b then
    s = s .. ","
  end
  s = s .. unitTypeId
  b = true
end
if b then
  command.dance = s
end
