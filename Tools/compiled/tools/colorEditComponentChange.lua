local component = getParameter("component")
local type = getParameter("type")
local value = 0
if type == nil or type == "10" then
  value = tonumber(getParameter("text"))
elseif type == "16" then
  local text = getParameter("text")
  if component == "S" then
    if #text ~= 6 then
      return
    end
  elseif #text ~= 2 then
    return
  end
  value = tonumber("0x" .. text)
else
  value = getParameter("value")
end
if value == nil then
  value = 0
end
if component ~= "S" and component ~= "P" then
  if value < 0 then
    value = 0
  end
  if 255 < value then
    value = 255
  end
end
if component == "R" then
  editingColor = editingColor & 4294967040 | value << 0
elseif component == "G" then
  editingColor = editingColor & 4294902015 | value << 8
elseif component == "B" then
  editingColor = editingColor & 4278255615 | value << 16
elseif component == "A" then
  editingColor = editingColor & 16777215 | value << 24
elseif component == "P" then
  hdr = value
  if type == "slider" then
    hdr = hdr + 100
  else
    local nodes = interface.nodes
    if hdr - 100 > nodes[39].widget_max / 2 then
      nodes[39].widget_max = (hdr - 100) * 2
    end
  end
elseif component == "S" then
  local r = value >> 16 & 255
  local g = value >> 8 & 255
  local b = value >> 0 & 255
  editingColor = editingColor & 4278190080 | r << 0 | g << 8 | b << 16
end
updateColor()
initPaletteFromColor(editingColor)
