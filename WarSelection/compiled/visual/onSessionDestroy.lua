local interface = root.interface
if interface ~= nil and createInterfaces ~= nil then
  for _, itf in ipairs(createInterfaces) do
    local id = interface.f_getIndex(itf[1])
    if id ~= nil then
      interface.f_remove(id)
    end
  end
end
