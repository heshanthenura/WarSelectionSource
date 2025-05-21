local nodes = interface.nodes
local widgetId = getParameter("widget")
local widget = nodes[widgetId].widget
local s = widget.lines[getParameter("value")]
editingMyModCode = string.sub(s, 5, 15)
local myMod = getMyMod(editingMyModCode)
if widgetId == 410 then
  nodes[411].widget_currentLine = nil
else
  nodes[410].widget_currentLine = nil
end
nodes[416].visible = true
nodes[422].visible = not myMod.released
nodes[419].visible = myMod.released
nodes[418].widget_text_text = "mod-" .. editingMyModCode
nodes[427].widget_text = myMod.name
nodes[428].widget_text = myMod.description
