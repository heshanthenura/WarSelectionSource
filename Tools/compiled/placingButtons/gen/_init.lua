interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end
buttons = {
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  2,
  21,
  22,
  23,
  24,
  25,
  26
}
texts = {
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  27,
  28,
  29,
  30,
  31,
  32,
  33
}

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

function getParameterBool(parameterName, defaultValue)
  local parameter = getParameter(parameterName)
  if parameter == nil then
    return defaultValue
  end
  return toBool(parameter)
end
