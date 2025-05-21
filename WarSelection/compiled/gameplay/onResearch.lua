local faction = getParameter("faction")
local research = getParameter("research")
for _, func in ipairs(onResearchDoneFuncs) do
  if func[3] == nil then
    func[2](faction, research)
  else
    func[2](func[3], faction, research)
  end
end
