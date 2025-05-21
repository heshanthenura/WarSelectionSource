local gameplay = root.session_gameplay_gameplay
local storage = gameplay.dataStorage
local data = fromJson(storage.bxRNf7V9y4f)
if data == nil then
  return
end
local scene = gameplay.scene[0]
local nodes = interface.nodes
local myFactionId = root.session_visual_currentFaction
local faction = scene.faction[myFactionId]
local terSize = faction.territorySize // 100
local sizeTime = data.sizeTime
local time = gameplay.time
local wave = time // sizeTime
local avgCountryStartSize = data.avgCountryStartSize
nodes[3].widget_text = terSize
local countryMustSize = calcMustTerritorySize(wave, avgCountryStartSize)
if terSize < countryMustSize then
  nodes[5].widget_text = "0:00"
  nodes[6].widget_text = math.floor(countryMustSize // 100)
  nodes[12].visible = true
  nodes[1].visible = true
else
  local nextSizeTime = sizeTime - time % sizeTime
  nodes[5].widget_text = toTimeStr(nextSizeTime // 1000)
  local countryNextSize = calcMustTerritorySize(wave + 1, avgCountryStartSize)
  nodes[6].widget_text = math.floor(countryNextSize // 100)
  nodes[12].visible = false
  nodes[1].visible = false
end
