interface.nodes[3].visible = false
if getParameter("apply") == nil then
  local data = {
    color = colorStart
  }
  if hdrStart ~= nil then
    data.hdr = hdrStart
  end
  root.interface[parentInterface].f_sendEvent("toolsOnColor", toJson(data))
end
