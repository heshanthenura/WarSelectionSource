for _, modCode in ipairs(modCodes) do
  local v = fromJson(root.dataStorage[modCode])
  tableReplaceProperties(modVars[modCode], v)
end
for _, func in ipairs(onDumpInitFuncs) do
  if func[3] == nil then
    func[2]()
  else
    local status, error = pcall(func[2], func[3])
    if not status then
      log("Caught an error in mod-" .. func[1] .. " on init from dump:", error)
    end
  end
end
