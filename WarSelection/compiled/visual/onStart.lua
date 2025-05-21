if getParameter("fromDump") then
  for _, func in ipairs(onDumpStartFuncs) do
    local status, error = pcall(func[2], func[3])
    if not status then
      log("Caught an error in visual mod function " .. func[1] .. " on init from dump:", error)
    end
  end
else
  for _, func in ipairs(onStartFuncs) do
    local status, error = pcall(func[2], func[3])
    if not status then
      log("Caught an error in mod-" .. func[1] .. " on start:", error)
    end
  end
  onStartFuncs = nil
end
