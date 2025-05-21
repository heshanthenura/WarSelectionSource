local val = tonumber(getParameter("text"))
if val == nil then
  return
end
numberSetValue(val)
