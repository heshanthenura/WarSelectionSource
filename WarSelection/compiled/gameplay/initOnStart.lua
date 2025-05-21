for _, func in ipairs(onStartFuncs) do
  if func[3] == nil then
    local status, error = pcall(func[2])
    if not status then
      log("Caught an error in gameplay mod function " .. func[1] .. " on start:", error)
    end
  else
    local status, error = pcall(func[2], func[3])
    if not status then
      log("Caught an error in mod-" .. func[1] .. " on start:", error)
    end
  end
end
onStartFuncs = nil
