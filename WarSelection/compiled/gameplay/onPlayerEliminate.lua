local playerId = getParameter("player")
local reason = getParameter("reason")
for _, func in ipairs(onPlayerEliminateFuncs) do
  if func[3] == nil then
    func[2](playerId, reason)
  else
    func[2](func[3], playerId, reason)
  end
end
