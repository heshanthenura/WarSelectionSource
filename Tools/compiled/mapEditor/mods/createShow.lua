local nodes = interface.nodes
creatingModType = getParameter("modType")
if creatingModType == nil then
  nodes[434].visible = false
  return
end
nodes[434].visible = true
nodes[441].visible = creatingModType == "gameplay"
nodes[415].visible = creatingModType == "visual"
nodes[442].widget_text_text = ""
nodes[437].widget_text_text = ""
