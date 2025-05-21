interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end
factionListWidgets = {
  {
    460,
    729,
    680,
    485,
    493,
    477,
    445,
    697,
    705,
    713
  },
  {
    459,
    730,
    681,
    486,
    494,
    478,
    446,
    698,
    706,
    714
  },
  {
    458,
    731,
    682,
    487,
    495,
    479,
    447,
    699,
    707,
    715
  },
  {
    457,
    732,
    683,
    488,
    496,
    480,
    448,
    700,
    708,
    716
  },
  {
    456,
    733,
    684,
    489,
    497,
    481,
    449,
    701,
    709,
    717
  },
  {
    455,
    734,
    685,
    490,
    498,
    482,
    450,
    702,
    710,
    718
  },
  {
    454,
    735,
    686,
    491,
    499,
    483,
    451,
    703,
    711,
    719
  },
  {
    453,
    736,
    687,
    492,
    500,
    484,
    452,
    704,
    712,
    720
  }
}
teamListWidgets = {
  {
    561,
    519,
    575,
    651,
    642,
    618,
    626,
    634
  },
  {
    562,
    520,
    576,
    652,
    643,
    619,
    627,
    635
  },
  {
    563,
    521,
    577,
    653,
    644,
    620,
    628,
    636
  },
  {
    564,
    522,
    578,
    654,
    645,
    621,
    629,
    637
  },
  {
    565,
    523,
    579,
    655,
    646,
    622,
    630,
    638
  },
  {
    566,
    524,
    580,
    656,
    647,
    623,
    631,
    639
  },
  {
    567,
    525,
    581,
    657,
    648,
    624,
    632,
    640
  },
  {
    568,
    526,
    582,
    658,
    649,
    625,
    633,
    641
  }
}
symmetryShow = {
  325,
  396,
  397,
  398,
  399,
  400
}

function toBool(v)
  if type(v) == "boolean" then
    return v
  end
  if type(v) == "number" then
    return v ~= 0
  end
  if type(v) == "string" then
    if v == "true" then
      return true
    end
    local n = tonumber(v)
    return n ~= nil and n ~= 0
  end
  return false
end

function setParameter(val)
  local mod = getEditingMod()
  local parameter = mod.parameters[editingParameter]
  if val == parameter.default then
    if mod.parametersParsed == nil then
      return
    end
    mod.parametersParsed[parameter.name] = nil
  else
    if mod.parametersParsed == nil then
      mod.parametersParsed = {}
    end
    mod.parametersParsed[parameter.name] = val
  end
  interface.nodes[261].visible = true
  markMapNotSaved()
end

function updateVeil()
  local nodes = interface.nodes
  nodes[72].visible = isUploading or root.interface_settings_active
  nodes[95].visible = isUploading
  nodes[166].visible = isUploading
  nodes[19].visible = root.interface_settings_active and not isUploading
end

function hideWindows()
  root.session_visual_placer.f_turnOff()
  local nodes = interface.nodes
  nodes[19].visible = false
  root.interface_settings_active = false
  nodes[132].visible = false
  nodes[81].visible = false
  nodes[754].visible = false
  nodes[42].visible = false
  nodes[177].visible = false
  nodes[40].visible = false
  nodes[41].visible = false
  nodes[29].disabled = false
  nodes[30].disabled = false
  nodes[32].disabled = false
  nodes[52].disabled = false
  nodes[53].disabled = false
  nodes[114].disabled = false
  updateVeil()
  root.interface[unitPlacingInterface].active = false
end

function deepCopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == "table" then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepCopy(orig_key)] = deepCopy(orig_value)
    end
    setmetatable(copy, deepCopy(getmetatable(orig)))
  else
    copy = orig
  end
  return copy
end

function removeRulerPoint(point)
  if ruler[point] == nil then
    return
  end
  local scene = root.session_gameplay_gameplay_scene[0]
  local id = ruler[point][3]
  if scene.env[id] ~= nil then
    scene.envs.f_remove(id)
  end
  ruler[point] = nil
  local nodes = interface.nodes
  if point == 1 then
    nodes[191].visible = false
  else
    nodes[195].visible = false
  end
  nodes[197].visible = false
  if rulerSteps ~= nil then
    for _, id in ipairs(rulerSteps) do
      if scene.env[id] ~= nil then
        scene.envs.f_remove(id)
      end
    end
    rulerSteps = nil
  end
end

function createRulerPoint(point, x, y)
  assert(ruler[point] == nil)
  assert(rulerSteps == nil)
  local scene = root.session_gameplay_gameplay_scene[0]
  local envs = scene.envs.f_create("mapeditor.ruler.end", 1, x, y, "landscape", 0)
  ruler[point] = {
    x,
    y,
    envs[1]
  }
  assert(ruler[point][3] ~= nil)
  if ruler[1] == nil or ruler[2] == nil then
    return
  end
  local dx = ruler[2][1] - ruler[1][1]
  local dy = ruler[2][2] - ruler[1][2]
  rulerSteps = {}
  for i = 1, 100 do
    local x = math.floor(ruler[1][1] + dx / 101 * i)
    local y = math.floor(ruler[1][2] + dy / 101 * i)
    local envs = scene.envs.f_create("mapeditor.ruler.step", 1, x, y, "landscape", 0)
    table.insert(rulerSteps, envs[1])
  end
  local nodes = interface.nodes
  nodes[197].visible = true
  nodes[179].widget_text = math.floor(math.sqrt(dx * dx + dy * dy) / 256)
end

function removeRuler()
  removeRulerPoint(1)
  removeRulerPoint(2)
end

function createRuler(xy1, xy2)
  if xy1 ~= nil then
    createRulerPoint(1, xy1[1], xy1[2])
  end
  if xy2 ~= nil then
    createRulerPoint(2, xy2[1], xy2[2])
  end
end

function openFactionsWindow()
  local nodes = interface.nodes
  nodes[237].visible = false
end

function getTeamsRelations()
  result = {}
  for i = 1, #teamsList do
    table.insert(result, {})
    for j = 1, #teamsList + 1 do
      table.insert(result[i], 0)
    end
  end
  for fromFac = 1, #factionsList do
    for toFac = 1, #factionsList do
      local fromTeam = factionsList[fromFac].team
      local toTeam = factionsList[toFac].team
      assert(0 < fromTeam)
      assert(0 < toTeam)
      assert(fromTeam <= #teamsList)
      assert(toTeam <= #teamsList)
      local r = result[fromTeam][toTeam]
      local rel = factionsList[fromFac].relations[toFac]
      if rel == nil then
        r = r | 1
      elseif rel == true then
        r = r | 2
      else
        r = r | 4
      end
      result[fromTeam][toTeam] = r
      result[fromTeam][#teamsList + 1] = result[fromTeam][#teamsList + 1] | r
    end
  end
  return result
end

function updateTeamsList()
  local nodes = interface.nodes
  local w = nodes[289].widget
  local scroll = w.verticalSlider_current
  local cur = w.currentLine
  if cur == nil then
    cur = 0
  end
  nodes[426].visible = #teamsList > 1
  nodes[424].visible = #teamsList < 64
  local o = w.discreetScrollValue
  local arr = {}
  for _, team in ipairs(teamsList) do
    table.insert(arr, team.name)
  end
  w.lines_createList = arr
  nodes[295].widget_lines_createList = arr
  if scroll > w.verticalSlider_max then
    scroll = w.verticalSlider_max
  end
  local teamsRelations = getTeamsRelations()
  local teamsRelationsChecker = not nodes[256].widget_checked
  local updateTeam = function(i, teamId, curTeamId)
    local team = teamsList[teamId]
    local rel = teamsRelations[curTeamId][teamId]
    nodes[teamListWidgets[i][1]].visible = true
    local id = teamListWidgets[i][3]
    nodes[id].visible = teamsRelations[teamId][#teamsList + 1] == 0
    if teamId == curTeamId then
      nodes[426].localTop = nodes[id].screenTop - nodes[423].screenTop
    end
    nodes[teamListWidgets[i][4]].visible = teamId == curTeamId
    nodes[teamListWidgets[i][5]].visible = not teamsRelationsChecker
    nodes[teamListWidgets[i][6]].widget_checked = 0 < rel & 2
    nodes[teamListWidgets[i][7]].widget_checked = rel & 1 > 0
    nodes[teamListWidgets[i][8]].widget_checked = 0 < rel & 4
    nodes[teamListWidgets[i][2]].visible = rel ~= teamsRelations[teamId][curTeamId]
  end
  if #teamsList <= #teamListWidgets then
    assert(o <= 0)
    for i = 1, #teamsList do
      updateTeam(i, i + o, cur + 1)
    end
    for i = #teamsList + 1, #teamListWidgets do
      nodes[teamListWidgets[i][1]].visible = false
    end
  else
    assert(#teamListWidgets + o <= #teamsList)
    for i = 1, #teamListWidgets do
      updateTeam(i, i + o, cur + 1)
    end
  end
  w.currentLine = cur
  w.verticalSlider_current = scroll
end

function factionSetRelation(fromFac, toFac, value, reciprocal)
  assert(0 < fromFac and fromFac <= #factionsList)
  assert(0 < toFac and toFac <= #factionsList)
  factionsList[fromFac].relations[toFac] = value
  if reciprocal then
    factionsList[toFac].relations[fromFac] = value
  end
end

function teamSetRelation(fromTeam, toTeam, value)
  local nodes = interface.nodes
  local reciprocal = nodes[249].widget_checked
  for fromFac = 1, #factionsList do
    if factionsList[fromFac].team == fromTeam then
      for toFac = 1, #factionsList do
        if factionsList[toFac].team == toTeam then
          factionSetRelation(fromFac, toFac, value, reciprocal)
        end
      end
    end
  end
end

function writeFactionName(widget, factionId)
  local faction = factionsList[factionId]
  local color = factionsColors[faction.color]
  widget.text = faction.name
  widget.font_textColor_value = color[1]
  widget.font_strokeColor_value = color[2]
end

function updateFactionsList()
  local nodes = interface.nodes
  local w = nodes[303].widget
  local scroll = w.verticalSlider_current
  local cur = w.currentLine
  if cur == nil then
    cur = 0
  end
  nodes[696].visible = false
  nodes[737].visible = #factionsList < 64
  local arr = {}
  for _, _ in ipairs(factionsList) do
    table.insert(arr, "")
  end
  w.lines_createList = arr
  local factions = root.session_visual_faction
  local teamsRelations = not nodes[256].widget_checked
  local updateFaction = function(i, facId, curFacId)
    local faction = factionsList[facId]
    local facWid = factionListWidgets[i]
    nodes[facWid[1]].visible = true
    writeFactionName(nodes[facWid[2]].widget, facId)
    local fac = factions[facId - 1]
    local color = factionsColors[faction.color]
    fac.maskColor_value = color[1]
    fac.minimapColor_value = color[1]
    fac.minimapBorderColor_value = color[2]
    local id = facWid[3]
    nodes[id].visible = facId == curFacId
    if facId == curFacId then
      nodes[696].localTop = nodes[id].screenTop - nodes[679].screenTop
      nodes[696].visible = #factionsList > 1
    end
    local rel = factionsList[curFacId].relations[facId]
    nodes[facWid[8]].visible = teamsRelations and rel == true
    nodes[facWid[9]].visible = teamsRelations and rel ~= nil and rel ~= true
    nodes[facWid[10]].visible = teamsRelations and rel == nil
    local id = facWid[4]
    nodes[id].visible = not teamsRelations
    nodes[id].widget_checked = rel == false
    local id = facWid[5]
    nodes[id].visible = not teamsRelations
    nodes[id].widget_checked = rel == true
    local id = facWid[6]
    nodes[id].visible = not teamsRelations
    nodes[id].widget_checked = rel == nil
    nodes[facWid[7]].visible = rel ~= faction.relations[curFacId]
  end
  w.currentLine = cur
  if scroll > w.verticalSlider_max then
    scroll = w.verticalSlider_max
  end
  w.verticalSlider_current = scroll
  local discreetScrollValue = w.discreetScrollValue
  if #factionsList <= #factionListWidgets then
    assert(discreetScrollValue <= 0)
    for i = 1, #factionsList do
      updateFaction(i, i + discreetScrollValue, cur + 1)
    end
    for i = #factionsList + 1, #factionListWidgets do
      nodes[factionListWidgets[i][1]].visible = false
    end
  else
    assert(#factionListWidgets + discreetScrollValue <= #factionsList)
    for i = 1, #factionListWidgets do
      updateFaction(i, i + discreetScrollValue, cur + 1)
    end
  end
end

function switchToFactions()
  local nodes = interface.nodes
  nodes[293].visible = true
  nodes[21].visible = false
  nodes[290].disabled = true
  nodes[676].disabled = false
  onFactionSelect(nodes[303].widget_currentLine + 1)
end

function switchToTeams()
  local nodes = interface.nodes
  nodes[293].visible = false
  nodes[21].visible = true
  nodes[290].disabled = false
  nodes[676].disabled = true
  onTeamSelect(nodes[289].widget_currentLine + 1)
end

function onTeamSelect(teamId)
  local nodes = interface.nodes
  local team = teamsList[teamId]
  nodes[252].widget_text_text = team.name
  local lines = nodes[659].widget_lines
  lines.f_clear()
  local hasFactions = false
  for _, fac in ipairs(factionsList) do
    if fac.team == teamId then
      hasFactions = true
      lines.f_create(fac.name)
    end
  end
  nodes[660].visible = hasFactions
  nodes[268].visible = not hasFactions
  updateTeamsList()
end

function onFactionSelect(factionId)
  local nodes = interface.nodes
  local faction = factionsList[factionId]
  nodes[294].widget_text_text = faction.name
  nodes[425].widget_color_value = factionsColors[faction.color][1]
  nodes[299].widget_color_value = factionsColors[faction.color][1]
  nodes[180].widget_checked = faction.notPlayable == nil
  nodes[295].widget_value = faction.team - 1
  if faction.externalData == nil then
    nodes[541].widget_text_text = ""
  else
    nodes[541].widget_text_text = faction.externalData
  end
  updateFactionsList()
end

function placeGrass(grassId, x, y, radiusInner, radiusOuter, density)
  local vSceneEdit = root.session_visual_scene[0].landscapeEdit
  vSceneEdit.f_grassCircle(x, y, radiusOuter, grassId, density, radiusOuter - radiusInner)
  if currentSymmetry ~= nil then
    local x, y = getSymmetricPosition(x, y)
    vSceneEdit.f_grassCircle(x, y, radiusOuter, grassId, density, radiusOuter - radiusInner)
  end
end

function updateTemplatePower()
  local nodes = interface.nodes
  nodes[603].widget_text = nodes[604].widget_current
  reinitPlacer()
end

function updateTexturingPower(onlyMin, onlyMax)
  local nodes = interface.nodes
  nodes[201].widget_text = nodes[204].widget_current
  if onlyMin then
    updateBrushSizeMin(nodes[202].widget, nodes[205].widget, nodes[203].widget, nodes[206].widget)
  end
  if onlyMax then
    updateBrushSizeMax(nodes[202].widget, nodes[205].widget, nodes[203].widget, nodes[206].widget)
  end
end

function updateGrassingPower(onlyMin, onlyMax)
  local nodes = interface.nodes
  nodes[318].widget_text = nodes[315].widget_current
  nodes[320].widget_text = nodes[319].widget_current
  nodes[323].widget_text = nodes[322].widget_current
  nodes[535].widget_text = nodes[544].widget_current
  if onlyMin then
    updateBrushSizeMin(nodes[599].widget, nodes[598].widget, nodes[593].widget, nodes[592].widget)
  end
  if onlyMax then
    updateBrushSizeMax(nodes[599].widget, nodes[598].widget, nodes[593].widget, nodes[592].widget)
  end
end

function updateTerrainPower(onlyMin, onlyMax)
  local nodes = interface.nodes
  nodes[233].widget_text = nodes[244].widget_current
  if onlyMin then
    updateBrushSizeMin(nodes[234].widget, nodes[245].widget, nodes[239].widget, nodes[247].widget)
  end
  if onlyMax then
    updateBrushSizeMax(nodes[234].widget, nodes[245].widget, nodes[239].widget, nodes[247].widget)
  end
end

function updateTerrainSmoothOutPower(onlyMin, onlyMax)
  local nodes = interface.nodes
  nodes[216].widget_text = nodes[219].widget_current
  if onlyMin then
    updateBrushSizeMin(nodes[217].widget, nodes[220].widget, nodes[218].widget, nodes[221].widget)
  end
  if onlyMax then
    updateBrushSizeMax(nodes[217].widget, nodes[220].widget, nodes[218].widget, nodes[221].widget)
  end
end

function updateEnvPower(onlyMin, onlyMax)
  envsPlacingTime = 0
  local nodes = interface.nodes
  nodes[105].widget_text = nodes[165].widget_current
  if onlyMin then
    updateBrushSizeMin(nodes[190].widget, nodes[168].widget, nodes[172].widget, nodes[189].widget)
  end
  if onlyMax then
    updateBrushSizeMax(nodes[190].widget, nodes[168].widget, nodes[172].widget, nodes[189].widget)
  end
end

function showConnectionError(fatal)
  local nodes = interface.nodes
  nodes[96].visible = true
  nodes[100].visible = fatal
  nodes[107].visible = not fatal
end

function showError(text)
  root.interface.f_sendEvent("showError", text)
end

function reinitPlacer()
  local nodes = interface.nodes
  root.session_visual_placer.f_turnOff()
  if nodes[132].visible then
    if nodes[37].visible then
      startPlacerTexturing()
    elseif nodes[134].visible then
      startPlacerGrassing()
    elseif nodes[574].visible then
      startPlacerTemplate()
    end
  elseif nodes[40].visible then
    startPlacerLeveling()
  elseif nodes[41].visible then
    startPlacerHeightChange()
  elseif nodes[81].visible then
    startPlacerEnvsAdd()
  elseif nodes[754].visible then
    startPlacerUnitsRemove()
  end
end

function updateBrushSizeMin(radiusMinText, radiusMinSlider, radiusMaxText, radiusMaxSlider)
  local value = radiusMinSlider.current
  if value > radiusMaxSlider.current then
    radiusMaxSlider.current = value
    updateBrushSizeMax(radiusMinText, radiusMinSlider, radiusMaxText, radiusMaxSlider)
  end
  radiusMinText.text = value
end

function updateBrushSizeMax(radiusMinText, radiusMinSlider, radiusMaxText, radiusMaxSlider)
  local value = radiusMaxSlider.current
  if value < radiusMinSlider.current then
    radiusMinSlider.current = value
    updateBrushSizeMin(radiusMinText, radiusMinSlider, radiusMaxText, radiusMaxSlider)
  end
  radiusMaxText.text = value
  reinitPlacer()
end

function startPlacerTexturePipette()
  interface.nodes[11].disabled = true
  root.session_visual_placer.f_free(placerAppearance, 100, "type=texturePipette,interface=" .. interfaceId)
end

function startPlacerEnvsPipette()
  interface.nodes[99].disabled = true
  root.session_visual_placer.f_free(placerAppearance, 100, "type=envsPipette,interface=" .. interfaceId)
end

function startPlacerRuler()
  root.session_visual_placer.f_free(placerAppearance, 100, "type=ruler,interface=" .. interfaceId, 0, 0, 0, 50)
end

function startPlacerEnvsAdd()
  envsPlacingTime = 0
  local nodes = interface.nodes
  if nodes[165].widget_current == 1 then
    nodes[665].visible = false
    nodes[694].visible = false
    local envId = nodes[83].widget_value
    root.session_visual_placer.f_env(envId, 0, true, "type=envsAdd,interface=" .. interfaceId, 0, 0, 0, 65280, 255, 1000, 0, 0, lastEnvDirection)
  else
    nodes[665].visible = true
    nodes[694].visible = true
    local sz = nodes[189].widget_current * brushSize
    root.session_visual_placer.f_free(placerAppearance, sz, "type=envsAdd,interface=" .. interfaceId, 0, 0, 0, 50)
  end
end

function startPlacerUnitsRemove()
  unitsPlacingTime = 0
  local sz = interface.nodes[265].widget_current * brushSize
  root.session_visual_placer.f_free(placerAppearance, sz, "type=unitsRemove,interface=" .. interfaceId, 0, 0, 0, 50)
end

function startPlacerTexturing()
  local sz = interface.nodes[206].widget_current * brushSize
  root.session_visual_placer.f_free(placerAppearance, sz, "type=texturing,interface=" .. interfaceId, 0, 0, 0, 50)
end

function startPlacerGrassing()
  local sz = interface.nodes[592].widget_current * brushSize
  root.session_visual_placer.f_free(placerAppearance, sz, "type=grassing,interface=" .. interfaceId, 0, 0, 0, 50)
end

function startPlacerTemplate()
  local sz = interface.nodes[604].widget_current * brushSize
  root.session_visual_placer.f_free(placerAppearance, sz, "type=template,interface=" .. interfaceId, 0, 0, 0, 50)
end

function startPlacerLeveling()
  local sz = interface.nodes[221].widget_current * brushSize
  root.session_visual_placer.f_free(placerAppearance, sz, "type=leveling,interface=" .. interfaceId, 0, 0, 0, 50)
end

function startPlacerHeightChange()
  local sz = interface.nodes[247].widget_current * brushSize
  root.session_visual_placer.f_free(placerAppearance, sz, "type=heightChange,interface=" .. interfaceId, 0, 0, 0, 50)
end

function texturingUsingChange()
  local nodes = interface.nodes
  nodes[5].visible = nodes[14].widget_checked
  nodes[13].visible = nodes[15].widget_checked
  nodes[17].visible = nodes[16].widget_checked
end

function updateEnvTypes()
  local nodes = interface.nodes
  local n = nodes[83]
  local array = root.session_gameplay_gameplay_envType
  local textFilter = nodes[6].widget_text_text
  local w = n.widget
  w.dropDown_hideEmptyLines = true
  local lines = w.lines
  lines.f_clear()
  local count = array.size
  local firstExists
  local b = 0
  while count > b do
    if array.f_exists(b) then
      local tag = array[b].createTag
      if string.find(tag, textFilter, 1, true) ~= nil then
        if firstExists == nil then
          firstExists = lines.size
        end
        lines.f_create(b .. " - " .. tag)
      else
        lines.f_create("")
      end
    else
      lines.f_create("")
      count = count + 1
    end
    b = b + 1
  end
  w.value = firstExists
end

function createUploadPostParameter(upload, name, value, compressed)
  assert(upload ~= nil)
  local post = root.system_upload[upload].postParams
  local p = post[post.f_create()]
  p.name = name
  p.value = value
  if compressed then
    p.compressionLevel = 1
  end
end

function uploadAddPostData(name, data, compressed)
  createUploadPostParameter(currentUpload, name, data, compressed)
end

function uploadAddGetData(name, data)
  assert(currentUpload ~= nil)
  local get = root.system_upload[currentUpload].getParams
  local p = get[get.f_create()]
  p.name = name
  p.value = data
end

function createUpload(url)
  local upload = root.system_upload.f_add(url, 60)
  createUploadPostParameter(upload, "ticket", root.lobby_ticket)
  return upload
end

function createUploadMod(command)
  assert(modUpload == nil)
  modUpload = root.system_upload.f_add("https://mods-api.warselect.io/" .. command, 60)
  createModUploadPostParameter("accountKey", root.lobby.f_makeAccountKey(1))
  local nodes = interface.nodes
  nodes[435].visible = true
end

function createModUploadPostParameter(name, value)
  assert(modUpload ~= nil)
  createUploadPostParameter(modUpload, name, value)
end

function startUploading(upload, info)
  log("Start uploading: " .. info)
  assert(upload ~= nil)
  root.system_upload[upload].f_start()
end

function startModUploading(info)
  currentModsUploadInfo = info
  assert(modUpload ~= nil)
  startUploading(modUpload, info)
end

function initUpload(command, uploadTask)
  assert(currentUpload == nil)
  currentUpload = createUpload("https://map-upload.warselect.io/" .. command)
  currentUploadTask = uploadTask
end

function startUpload()
  setAct = root.interface_settings_active
  root.interface_settings_active = false
  isUploading = true
  startUploading(currentUpload, currentUploadTask)
  updateVeil()
end

function finishUpload()
  assert(currentUpload ~= nil)
  root.system_upload.f_remove(currentUpload)
  currentUpload = nil
  isUploading = false
  updateVeil()
end

function saveMap()
  local nodes = interface.nodes
  assert(currentUpload == nil)
  if workingMapCode == nil then
    initUpload("create", "create", true)
  else
    local tempRuler = deepCopy(ruler)
    removeRuler()
    local gameplay = root.session_gameplay_gameplay
    local scene = gameplay.scene[0]
    local trh = scene.landscape.f_getDump()
    local trg = root.session_visual_scene[0].landscape.f_getDump()
    local lnd = scene.mapData.f_asJson()
    local env = scene.env.f_getDump()
    local unt
    if 0 < scene.unit.size then
      unt = scene.unit.f_getDump()
    end
    initUpload("save", "save", true)
    uploadAddGetData("code", workingMapCode)
    uploadAddPostData("map.trh", trh, true)
    uploadAddPostData("map.trg", trg, true)
    uploadAddPostData("map.lnd", lnd, true)
    uploadAddPostData("map.env", env, true)
    if unt ~= nil then
      uploadAddPostData("map.unt", unt, true)
    end
    for i, fac in ipairs(factionsList) do
      fac.units = {}
      local units = gameplay.faction[i - 1].statistics_units
      for j = 0, units.size - 1 do
        local unit = units[j]
        if 0 < unit.live then
          table.insert(fac.units, j)
        end
      end
    end
    local info = {
      factions = factionsList,
      teams = teamsList,
      modsG = modsG,
      modsV = modsV
    }
    local configData = {
      modsG = modsG,
      modsV = modsV
    }
    uploadAddPostData("map.dat", toJson(info), true)
    uploadAddPostData("map.cfg", toJson(configData), true)
    uploadAddPostData("info", toJson(info), false)
    createRuler(tempRuler[1], tempRuler[2])
  end
  uploadAddPostData("mapName", nodes[161].widget_text_text, false)
  startUpload()
  nodes[69].visible = true
  saveTime = os.time() + 60
  nodes[22].disabled = true
  nodes[271].visible = true
end

function releaseMap()
  assert(currentUpload == nil)
  assert(workingMapCode ~= nil)
  initUpload("release", "release", true)
  uploadAddGetData("code", workingMapCode)
  startUpload()
end

function markMapNotSaved()
  local nodes = interface.nodes
  nodes[94].visible = false
  nodes[22].visible = true
end

function markMapSaved()
  local nodes = interface.nodes
  nodes[94].visible = true
  nodes[22].visible = false
end

function updateProb()
  local nodes = interface.nodes
  local id = nodes[18].widget_currentLine
  if id == nil then
    return
  end
  assert(id + 1 <= #envsList)
  nodes[46].widget_text_text = envsList[id + 1][3]
  local sum = 0
  for _, env in ipairs(envsList) do
    sum = sum + env[3]
  end
  nodes[125].widget_text = sum
  local v = 100 * envsList[id + 1][3] / sum
  if 100 <= v then
    nodes[126].widget_text = string.format("%3.0f", v)
  elseif 10 <= v then
    nodes[126].widget_text = string.format("%2.1f", v)
  else
    nodes[126].widget_text = string.format("%1.2f", v)
  end
end

function startMyModsListUpload()
  createUploadMod("list")
  startModUploading("My mods")
  local nodes = interface.nodes
  nodes[534].visible = true
  nodes[439].visible = true
  nodes[469].visible = false
end

function getMyMod(code)
  for _, v in ipairs(myMods) do
    if v.code == code then
      return v
    end
  end
  return nil
end

function updateMyModsLists()
  local nodes = interface.nodes
  local linesG = nodes[410].widget_lines
  local linesV = nodes[411].widget_lines
  nodes[416].visible = false
  linesG.f_clear()
  linesV.f_clear()
  for _, modData in ipairs(myMods) do
    if modData.type == 0 then
      linesG.f_create("mod-" .. modData.code .. " " .. modData.name)
    else
      linesV.f_create("mod-" .. modData.code .. " " .. modData.name)
    end
  end
end

function getSymmetricPosition(x, y)
  local p = root.session_gameplay_gameplay_scene[0].landscape.f_getSymmetricPosition(currentSymmetry, x, y, true)
  return p[1], p[2]
end

function attachMod(code)
  local nodes = interface.nodes
  if modsTable[code] ~= nil then
    showError(localize("<*modAlertDoubledMod>"))
    return
  end
  createUploadMod("get?code=" .. code)
  startModUploading("Mod info")
  nodes[306].visible = false
end

function loadModsInfo()
  local codes = {}
  modsTable = {}
  local addCodes = function(container)
    for i, modData in ipairs(container) do
      local code = string.sub(modData[1], 1, 11)
      local version = tonumber(string.sub(modData[1], 13))
      table.insert(codes, code)
      local pp = {}
      for key, value in string.gmatch(modData[2], "(%w+)=([^,]+)") do
        pp[key] = value
      end
      modsTable[code] = {
        version = version,
        parametersStr = modData[2],
        parametersParsed = pp,
        description = "",
        name = modData[1]
      }
    end
  end
  addCodes(modsG)
  addCodes(modsV)
  createUploadMod("listByCodes")
  createModUploadPostParameter("ids", toJson(codes))
  startModUploading("Attached mods")
end

function getEditingMod()
  return modsTable[editingModCode]
end

function enableTexturingGrass(tex, grass)
  local nodes = interface.nodes
  nodes[37].visible = tex
  nodes[134].visible = grass
  nodes[574].visible = not tex and not grass
  nodes[281].disabled = grass
  nodes[313].disabled = tex
  nodes[572].disabled = not tex and not grass
  if nodes[132].visible then
    if tex then
      startPlacerTexturing()
    elseif grass then
      startPlacerGrassing()
    else
      startPlacerTemplate()
    end
  end
end

function addEnv(placingEnv, x, y, dir)
  local scene = root.session_gameplay_gameplay_scene[0]
  if placingEnv == nil or not scene.landscape.f_inRange(x, y) then
    return false
  end
  local envs = scene.envs
  envs.f_create(placingEnv, 1, x, y, "landscape", dir)
  if currentSymmetry ~= nil then
    local px, py = getSymmetricPosition(x, y)
    dir = dir + 524288
    if 1048575 < dir then
      dir = dir - 1048575
    end
    envs.f_create(placingEnv, 1, px, py, "landscape", dir)
  end
  markMapNotSaved()
  return true
end

hotKeysResult = {
  id = interfaceId,
  name = localize("<*mapEditorInterfaceName>"),
  hotKeys = {}
}
local list = fromJson("[" .. localize("<*mapEditorHotKeysList>") .. "]")
if list ~= nil then
  for _, v in ipairs(list) do
    local name = localize("<*mapEditorHotKeyName" .. v .. ">")
    table.insert(hotKeysResult.hotKeys, {v, name})
  end
end
hotKeysResult = toJson(hotKeysResult)
