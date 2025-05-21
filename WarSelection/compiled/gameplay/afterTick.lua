local time = root.time
for _, func in ipairs(onTickFuncs) do
  if func[3] == nil then
    func[2](time)
  else
    func[2](func[3], time)
  end
end
