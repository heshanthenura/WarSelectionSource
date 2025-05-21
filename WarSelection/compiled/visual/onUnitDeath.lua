for _, func in ipairs(onUnitDeathFuncs) do
  func[2](func[3])
end
