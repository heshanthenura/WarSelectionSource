for _, func in ipairs(onDumpCreateFuncs) do
  if func[3] == nil then
    func[2]()
  else
    func[2](func[3])
  end
end
for _, modCode in ipairs(modCodes) do
  root.dataStorage.f_set(modCode, toJson(modVars[modCode]))
end
