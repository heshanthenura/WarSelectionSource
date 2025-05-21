parentInterface = getParameter("parent")

function getColorR(color)
  return color >> 0 & 255
end

function getColorG(color)
  return color >> 8 & 255
end

function getColorB(color)
  return color >> 16 & 255
end

function getColorA(color)
  return color >> 24 & 255
end

function getColor(r, g, b, a)
  local res = (r << 0) + (g << 8) + (b << 16)
  if a ~= nil then
    res = res + (a << 24)
  else
    res = res + 4278190080
  end
  return res
end

function lerp(v1, v2, t)
  return v1 * (1 - t) + v2 * t
end

function lerpColor3(color1, color2, t)
  assert(type(color1) == "number")
  assert(type(color2) == "number")
  assert(type(t) == "number")
  return getColor(math.floor(lerp(getColorR(color1), getColorR(color2), t) + 0.5), math.floor(lerp(getColorG(color1), getColorG(color2), t) + 0.5), math.floor(lerp(getColorB(color1), getColorB(color2), t) + 0.5), getColorA(color1))
end

function lerpColor4(color1, color2, t)
  assert(type(color1) == "number")
  assert(type(color2) == "number")
  assert(type(t) == "number")
  return getColor(math.floor(lerp(getColorR(color1), getColorR(color2), t) + 0.5), math.floor(lerp(getColorG(color1), getColorG(color2), t) + 0.5), math.floor(lerp(getColorB(color1), getColorB(color2), t) + 0.5), math.floor(lerp(getColorA(color1), getColorA(color2), t) + 0.5))
end

function colorMult3(color, k)
  assert(0 <= k)
  assert(k <= 255)
  return getColor(getColorR(color) * k // 255, getColorG(color) * k // 255, getColorB(color) * k // 255, getColorA(color))
end

function initColorComponent(value, numberWidget, hexWidget, sliderWidget)
  numberWidget.text_text = value
  hexWidget.text_text = string.format("%02x", value)
  sliderWidget.current = value
end

function updateEditingColorFromPalete()
  assert(paletteColor ~= nil)
  local nodes = interface.nodes
  local a = getColorA(editingColor)
  editingColor = colorMult3(paletteColor, nodes[34].widget_current)
  editingColor = a << 24 | editingColor
end

function initPaletteFromColor(color)
  paletteColor = color
  local r = getColorR(color)
  local g = getColorG(color)
  local b = getColorB(color)
  local mn = math.min(r, g, b)
  local mx = math.max(r, g, b)
  local nodes = interface.nodes
  local n5 = nodes[5]
  local n6 = nodes[6]
  if mx == mn then
    n6.localTop = math.floor(n5.sizeY - n6.sizeY / 2 - 1)
  else
    r = r / mx
    g = g / mx
    b = b / mx
    mn = math.min(r, g, b)
    local mn_ = 1 - mn
    r = 1 - (1 - r) / mn_
    g = 1 - (1 - g) / mn_
    b = 1 - (1 - b) / mn_
    local x = 0
    if r == 1 then
      if 0 < g then
        x = g / 6
      else
        x = 1 - b / 6
        if x == 1 then
          x = 0
        end
      end
    elseif g == 1 then
      if 0 < r then
        x = 0.3333333333333333 - r / 6
      else
        x = 0.3333333333333333 + b / 6
      end
    elseif 0 < r then
      x = 0.6666666666666666 + r / 6
    else
      x = 0.6666666666666666 - g / 6
    end
    n6.localLeft = math.floor(x * n5.sizeX + 0.5 - n6.sizeX / 2)
    n6.localTop = math.floor(mn * n5.sizeY + 0.5 - n6.sizeY / 2)
  end
  n5.widget_color_value = getColor(mx, mx, mx)
  nodes[34].widget_current = mx
  nodes[33].widget_color_value = color
  nodes[33].widget_color_a = 255
  updateWhite()
end

function updateColor()
  local r = getColorR(editingColor)
  local g = getColorG(editingColor)
  local b = getColorB(editingColor)
  local a = getColorA(editingColor)
  local nodes = interface.nodes
  nodes[7].widget_color_value = editingColor
  nodes[22].widget_text_text = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
  initColorComponent(r, nodes[10].widget, nodes[12].widget, nodes[11].widget)
  initColorComponent(g, nodes[13].widget, nodes[15].widget, nodes[14].widget)
  initColorComponent(b, nodes[16].widget, nodes[18].widget, nodes[17].widget)
  initColorComponent(a, nodes[19].widget, nodes[21].widget, nodes[20].widget)
  local data = {
    color = editingColor
  }
  if hdr ~= nil then
    nodes[38].widget_text_text = hdr
    local v = hdr - 100
    if v < 0 then
      v = 0
    end
    nodes[39].widget_current = v
    data.hdr = hdr
  end
  root.interface[parentInterface].f_sendEvent("toolsOnColor", toJson(data))
end

function updateWhite()
  local nodes = interface.nodes
  local n5 = nodes[5]
  local n6 = nodes[6]
  local x = n6.localLeft + n6.sizeX // 2
  local y = n6.localTop + n6.sizeY // 2
  assert(0 <= x)
  assert(0 <= y)
  local colors = {
    255,
    65535,
    65280,
    16776960,
    16711680,
    16711935,
    255
  }
  local v = y / (n5.sizeY - 1)
  local dx = n5.sizeX / (#colors - 1)
  assert(0 < dx)
  local d = x // dx
  if 5 < d then
    d = 5
  end
  assert(0 <= d)
  assert(d <= 5)
  local p = (x - d * dx) / dx
  local c1 = colors[d + 1]
  local c2 = colors[d + 2]
  local c3 = lerpColor3(c1, c2, p)
  local gray = nodes[34].widget_current
  assert(0 <= v)
  assert(v <= 1)
  nodes[40].widget_current = math.floor(v * 255)
  nodes[41].widget_color_value = colorMult3(c3, gray)
  nodes[41].widget_color_a = 255
  nodes[36].widget_color_value = getColor(gray, gray, gray, 255)
end

function onPalleteChangePosition(x, y)
  local nodes = interface.nodes
  local n5 = nodes[5]
  local sx = n5.sizeX
  local sy = n5.sizeY - 1
  if x < 0 then
    x = 0
  end
  if y < 0 then
    y = 0
  end
  if sx <= x then
    x = sx - 1
  end
  if sy < y then
    y = sy
  end
  local n6 = nodes[6]
  n6.localLeft = x - n6.sizeX // 2
  n6.localTop = y - n6.sizeY // 2
  local colors = {
    255,
    65535,
    65280,
    16776960,
    16711680,
    16711935,
    255
  }
  local v = y / sy
  local dx = sx / (#colors - 1)
  local d = x // dx
  local p = (x - d * dx) / dx
  local c1 = colors[d + 1]
  local c2 = colors[d + 2]
  local c3 = lerpColor3(c1, c2, p)
  paletteColor = lerpColor3(c3, 16777215, v)
  updateEditingColorFromPalete()
  nodes[33].widget_color_value = paletteColor
  nodes[33].widget_color_a = 255
  updateWhite()
  updateColor()
end

function closeAllWindows()
  local nodes = interface.nodes
  nodes[3].visible = false
  nodes[47].visible = false
  nodes[52].visible = false
end

function sendSliderValue(value)
  root.interface[parentInterface].f_sendEvent("toolsOnNumber", tostring(value))
end

function numberSetValue(setValue)
  numValue = setValue
  local value = math.floor((numValue + 1.0E-5) / numStep)
  local nodes = interface.nodes
  local slider = nodes[46].widget
  if value < slider.min then
    value = slider.min
    numValue = minValue
  elseif value > slider.max then
    value = slider.max
    numValue = maxValue
  end
  slider.current = value
  sendSliderValue(numValue)
end

function sendEventVector(x, y, z)
  local data = {
    x = x,
    y = y,
    z = z
  }
  root.interface[parentInterface].f_sendEvent("toolsOnVector", toJson(data))
end

function spherePosUpdateFromSliders()
  local nodes = interface.nodes
  nodes[57].widget_text_text = nodes[55].widget_current
  nodes[58].widget_text_text = nodes[56].widget_current
  local h = nodes[55].widget_current / 1000 * math.pi
  local d = nodes[56].widget_current / 500 * math.pi
  local hh = math.sin(h)
  local x = hh * math.cos(d) * sphereRadius
  local y = hh * math.sin(d) * sphereRadius
  local z = math.cos(h) * sphereRadius
  sendEventVector(x, y, z)
end
