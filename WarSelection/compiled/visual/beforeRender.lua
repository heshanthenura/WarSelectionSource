local time = root.time
for _, func in ipairs(onWorkFuncs) do
  if func[3] == nil then
    func[2](time)
  else
    func[2](func[3], time)
  end
end
local myFactionId = root.session_visual_currentFaction
if lastCurFac ~= myFactionId then
  lastCurFac = myFactionId
  setFactionsColors(factionColorsByTeam)
end
