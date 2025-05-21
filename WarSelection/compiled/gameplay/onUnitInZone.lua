for _, func in ipairs(onUnitInZoneFuncs) do
  if func[3] == nil then
    func[2]()
  else
    func[2](func[3])
  end
end
