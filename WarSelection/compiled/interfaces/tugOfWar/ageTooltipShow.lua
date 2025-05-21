local nodes = interface.nodes
local myCultureS = getMyCulture()
local button = tonumber(getParameter("button"))
local parent = nodes[getParameter("widget")]
local widget = nodes[162]
if toBool(getParameter("enter")) then
  if #myCultureS.nextCultures == nil or button > #myCultureS.nextCultures then
    return
  end
  widget.visible = true
  widget.localLeft = parent.screenLeft + getParameter("x") - widget.sizeX - 15
  widget.localTop = parent.screenTop + getParameter("y") - widget.sizeY - 15
  local culture = myCultureS.nextCultures[button][1]
  local price = myCultureS.nextCultures[button][2]
  nodes[44].widget_text = cultureNames[culture]
  nodes[163].widget_text = price // 1000
  nodes[180].visible = false
  nodes[193].visible = false
else
  widget.visible = false
end
