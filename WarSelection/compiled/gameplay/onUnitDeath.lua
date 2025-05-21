for _, func in ipairs(onUnitDeathFuncs) do
  if func[3] == nil then
    func[2](getParameter("unitType"), getParameter("faction"), getParameter("killerFaction"))
  else
    func[2](func[3])
  end
end
