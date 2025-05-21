local eventName = getParameter("name")
if eventName == "numberStart" then
  local data = fromJson(getParameter("data"))
  numValue = data.value
  startNumValue = numValue
  minValue = data.min
  maxValue = data.max
  minVisual = data.minVisual
  maxVisual = data.maxVisual
  if minVisual == nil then
    minVisual = minValue
  end
  if maxVisual == nil then
    maxVisual = maxValue
  end
  assert(minValue < maxValue)
  assert(minVisual <= minValue)
  assert(maxVisual >= maxValue)
  numStep = data.step
  closeAllWindows()
  local nodes = interface.nodes
  nodes[47].visible = true
  local slider = nodes[46].widget
  slider.min = math.floor((minValue + 1.0E-5) / numStep)
  slider.max = math.floor((maxValue + 1.0E-5) / numStep)
  slider.visualMin = math.floor((minVisual + 1.0E-5) / numStep)
  slider.visualMax = math.floor((maxVisual + 1.0E-5) / numStep)
  slider.current = math.floor((numValue + 1.0E-5) / numStep)
  nodes[42].widget_text_text = numValue
  return
end
if eventName == "colorStart" then
  local data = fromJson(getParameter("data"))
  editingColor = data.color
  hdr = data.hdr
  hdrStart = hdr
  colorStart = editingColor
  closeAllWindows()
  local nodes = interface.nodes
  nodes[3].visible = true
  nodes[27].visible = hdr ~= nil
  if hdr ~= nil then
    nodes[39].widget_max = hdr
  end
  nodes[35].visible = data.withAlpha
  if not data.withAlpha then
    editingColor = editingColor | 4278190080
  end
  local startColor = nodes[9].widget_color
  startColor.value = editingColor
  initPaletteFromColor(editingColor)
  updateColor()
  return
end
if eventName == "vectorStart" then
  local data = fromJson(getParameter("data"))
  closeAllWindows()
  local nodes = interface.nodes
  nodes[52].visible = true
  spherePos = {
    data.x,
    data.y,
    data.z
  }
  sphereRadius = math.sqrt(spherePos[1] * spherePos[1] + spherePos[2] * spherePos[2] + spherePos[3] * spherePos[3])
  local lx = spherePos[1] / sphereRadius
  local ly = spherePos[2] / sphereRadius
  local lz = spherePos[3] / sphereRadius
  local h = math.acos(lz) + 1.0E-6
  local d = 0
  if ly ~= 0 or lx ~= 0 then
    d = math.atan2(ly, lx)
    if d < 0 then
      d = d + math.pi * 2
    end
  end
  nodes[55].widget_current = math.floor(h * 1000 / math.pi)
  nodes[56].widget_current = math.floor(d * 500 / math.pi)
  nodes[57].widget_text_text = nodes[55].widget_current
  nodes[58].widget_text_text = nodes[56].widget_current
  return
end
if eventName == "cancel" then
  local nodes = interface.nodes
  nodes[3].visible = false
  nodes[47].visible = false
  nodes[52].visible = false
  return
end
