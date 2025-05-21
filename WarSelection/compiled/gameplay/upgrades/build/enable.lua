local enable = true
if getParameter("enable") ~= nil then
  function toBool(v)
    if type(v) == "number" then
      return v ~= 0
    end
    if type(v) == "string" then
      if v == "true" then
        return true
      end
      local n = tonumber(v)
      return n ~= nil and n ~= 0
    end
    return false
  end
  
  enable = toBool(getParameter("enable"))
end
root.faction[getParameter("faction")].build[getParameter("id")].available = enable
