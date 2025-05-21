local eventName = getParameter("name")
if eventName == "initOffsets" then
  local data = fromJson(getParameter("data"))
  initOffsets(data.left, data.right, data.top, data.bottom)
  return
end
