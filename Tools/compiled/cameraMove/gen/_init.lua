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

hotKeysResult = {
  id = root.interface.f_getIndex(getParameter("interfaceName")),
  name = localize("<*cameraMoveInterfaceName>"),
  hotKeys = {}
}
local list = fromJson("[" .. localize("<*cameraMoveHotKeysList>") .. "]")
if list ~= nil then
  for _, v in ipairs(list) do
    local name = localize("<*cameraMoveHotKeyName" .. v .. ">")
    table.insert(hotKeysResult.hotKeys, {v, name})
  end
end
hotKeysResult = toJson(hotKeysResult)
