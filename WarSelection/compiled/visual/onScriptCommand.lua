for _, func in ipairs(onSpecialCommandFuncs) do
  local status, error = pcall(func[2], func[3])
  if not status then
    log("Caught an error in mod-" .. func[1] .. " on special command:", error)
  end
end
