if getParameter("copy") ~= nil then
  workingMapCode = nil
  local nodes = interface.nodes
  nodes[67].visible = false
  nodes[50].widget_text_text = ""
  nodes[68].visible = false
  nodes[161].disabled = false
  markMapSaved()
end
saveMap()
