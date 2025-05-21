local nodes = interface.nodes
local widget = nodes[328]
if not toBool(getParameter("enter")) then
  widget.visible = false
  nodes[328].visible = false
  massUpdateId = nil
  massUpdateMass = true
  return
end
local parent = nodes[getParameter("widget")]
widget.visible = true
widget.localLeft = parent.screenLeft + parent.sizeX
widget.localTop = parent.screenTop - math.floor(150 * interfaceScale)
nodes[328].visible = true
massUpdateMass = false
