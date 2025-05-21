local nodes = interface.nodes
local widget = nodes[328]
if not toBool(getParameter("enter")) then
  widget.visible = false
  nodes[328].visible = false
  massUpdateId = nil
  return
end
local parent = nodes[537]
widget.visible = true
widget.localLeft = parent.screenLeft - widget.sizeX
widget.localTop = parent.screenTop
nodes[328].visible = true
massUpdateId = tonumber(getParameter("info"))
massUpdateMass = true
