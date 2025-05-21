local nodes = interface.nodes
local parent = nodes[getParameter("widget")]
local widget = nodes[162]
widget.visible = toBool(getParameter("enter"))
widget.localLeft = parent.screenLeft + getParameter("x") - widget.sizeX - 15
widget.localTop = parent.screenTop + getParameter("y") - widget.sizeY - 15
local pls = getMyCulture()
local pl = getMyDinamic()
local house = pls.house
nodes[44].widget_text = getUnitName(house[1])
nodes[180].visible = true
nodes[193].visible = false
if pl.houses ~= nil and #pl.houses == staticData.maxHouses then
  local bestI
  local bestPrice = 100000000
  for i = 1, #pl.houses do
    local h = pl.houses[i]
    if h[2] ~= house[1] and bestPrice > h[3] then
      bestPrice = h[3]
      bestI = i
    end
  end
  if bestI == nil then
    widget.visible = false
    return
  end
  local bestH = pl.houses[bestI]
  local moneyReturn = bestH[3] * staticData.sellPercent // 100
  nodes[163].widget_text = house[2] // 1000 .. " - " .. moneyReturn // 1000 .. " = " .. (house[2] - moneyReturn) // 1000
  nodes[181].widget_text = house[3] .. "% - " .. bestH[4] .. "% = " .. house[3] - bestH[4] .. "%"
else
  nodes[163].widget_text = house[2] // 1000
  nodes[181].widget_text = house[3] .. "%"
end
