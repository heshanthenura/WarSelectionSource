local tower = getMyCulture().tower
if tower == nil then
  return
end
local nodes = interface.nodes
local parent = nodes[getParameter("widget")]
local widget = nodes[162]
widget.visible = toBool(getParameter("enter"))
widget.localLeft = parent.screenLeft + getParameter("x") - widget.sizeX - 15
widget.localTop = parent.screenTop + getParameter("y") - widget.sizeY - 15
nodes[44].widget_text = getUnitName(tower[1])
nodes[163].widget_text = tower[2] // 1000
nodes[180].visible = false
nodes[193].visible = false
