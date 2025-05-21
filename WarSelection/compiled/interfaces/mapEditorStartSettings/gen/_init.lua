function sendData()
  local nodes = interface.nodes
  
  local terrainNoiseScale = 100 + (100 - nodes[2].widget_current) * 13
  local heightScale = 50 + nodes[3].widget_current * 4
  local mountainsScale = 1400 + (100 - nodes[4].widget_current) * 23
  local woodScale = 100 + (100 - nodes[5].widget_current) * 13
  local woodSize = nodes[6].widget_current * 8 // 10
  local symmetry = nodes[7].widget_value
  if 6 < symmetry then
    symmetry = math.random(1, 6)
  end
  local data = {
    symmetry = symmetry,
    parameters = "woodScale=" .. woodScale .. ",woodSize=" .. woodSize .. ",terrainNoiseScale=" .. terrainNoiseScale .. ",terrainHeightScale=" .. heightScale .. ",terrainMountainsScale=" .. mountainsScale
  }
  root.interface[parentInterface].f_sendEvent("generatorData", toJson(data))
end
