local nodes = interface.nodes
local w = nodes[303].widget
local scroll = w.verticalSlider_current
local toFac = tonumber(getParameter("line"))
local o = w.lines_size - 8
if 0 < o then
  toFac = toFac + math.floor(o * scroll / w.verticalSlider_max + 0.5)
end
local setRel = tonumber(getParameter("rel"))
local factionId = w.currentLine + 1
local value
if setRel == 0 then
  value = false
elseif setRel == 1 then
  value = true
else
  value = nil
end
factionSetRelation(factionId, toFac, value, nodes[249].widget_checked)
updateFactionsList()
markMapNotSaved()
