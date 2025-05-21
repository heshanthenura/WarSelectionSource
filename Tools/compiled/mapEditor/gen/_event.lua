local eventName = getParameter("name")
if eventName == "changeGraphics" then
  root.session_visual_script_scripts.f_run(cbGraphicsChange, "level", tonumber(getParameter("data")))
  return
end
if eventName == "unitPlace" then
  local data = fromJson(getParameter("data"))
  if data.left then
    local scene = root.session_gameplay_gameplay_scene[0]
    local x = tonumber(data.xg)
    local y = tonumber(data.yg)
    if scene.landscape.f_inRange(x, y) then
      scene.units.f_create(tonumber(data.unit), tonumber(data.count), tonumber(data.faction), x, y, tonumber(data.directiong))
    end
    markMapNotSaved()
    if not data.continue then
      startPlacerUnitsRemove()
    end
  elseif data.final then
  else
    root.session_visual_placer.f_turnOff()
    startPlacerUnitsRemove()
  end
end
if eventName == "onPlacer" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  if data.cancel then
    return
  end
  if data.startByTimer then
    root.session_visual_scene[0].landscapeEdit.f_makeTerrainCopy()
  end
  if data.type == "texturePipette" then
    nodes[11].disabled = false
    if data.left then
      local landscape = root.session_visual_scene[0].landscape
      nodes[5].widget_color_value = landscape.f_getColor1(data.xg, data.yg)
      nodes[13].widget_color_value = landscape.f_getColor2(data.xg, data.yg)
      choosenTexture = landscape.f_getTexture(data.xg, data.yg)
    end
    startPlacerTexturing()
  elseif data.type == "envsPipette" then
    nodes[99].disabled = false
    if data.left then
      local scene = root.session_gameplay_gameplay_scene[0]
      local envs = scene.envs
      local id = envs.f_searchNearest(data.xg, data.yg, 10000, 0)
      if id ~= nil then
        local env = envs.list[id]
        nodes[83].widget_value = env.type
      end
    end
    startPlacerEnvsAdd()
  elseif data.type == "ruler" then
    local point = 2
    if data.left then
      point = 1
    end
    local scene = root.session_gameplay_gameplay_scene[0]
    local r = scene.landscape.f_findFreePosition(data.xg, data.yg, 1)
    if r[1] == 0 then
      return
    end
    removeRulerPoint(point)
    createRulerPoint(point, r[2], r[3])
    if point == 1 then
      nodes[191].visible = true
    else
      nodes[195].visible = true
    end
  elseif data.type == "envsAdd" then
    if data.final and nodes[165].widget_current == 1 then
      if data.left then
        placingEnv = nodes[83].widget_value
        addEnv(placingEnv, data.xg, data.yg, data.directiong)
      end
      if data.direction ~= nil then
        lastEnvDirection = data.direction
      end
      envsPlacingTime = 0
      startPlacerEnvsAdd()
    elseif data.left then
      envsPlacingTime = envsPlacingTime + nodes[165].widget_current ^ 1.5
      local sz1 = nodes[168].widget_current * brushSize * 256
      local sz2 = nodes[189].widget_current * brushSize * 256
      assert(0 < sz2)
      local radius1 = sz1 // 2
      local radius2 = sz2 // 2
      local radiusD = radius2 - radius1
      while envsPlacingTime >= 20 do
        envsPlacingTime = envsPlacingTime - 20
        local pSum = 0
        local points = {}
        local x = data.xg
        local y = data.yg
        for i = 1, 100 do
          local xx = math.random(0, sz2) - radius2
          local yy = math.random(0, sz2) - radius2
          local d = math.sqrt(xx * xx + yy * yy)
          if radius2 >= d then
            local p = 100
            if radius1 < d then
              p = p * (radius2 - d) / radiusD
            end
            table.insert(points, {
              xx,
              yy,
              p
            })
            pSum = pSum + p
          end
        end
        local dx = 0
        local dy = 0
        assert(0 < pSum)
        local v = math.random(math.floor(pSum))
        for i = 1, #points do
          if v <= points[i][3] then
            dx = points[i][1]
            dy = points[i][2]
            break
          end
          v = v - points[i][3]
        end
        local placingEnv = ""
        if #envsList == 0 then
          placingEnv = nodes[83].widget_value
        else
          local sum = 0
          for i = 1, #envsList do
            assert(0 < envsList[i][3])
            sum = sum + envsList[i][3]
          end
          assert(0 < sum)
          local v = math.random(sum)
          for i = 1, #envsList do
            if v <= envsList[i][3] then
              placingEnv = envsList[i][1]
              break
            end
            v = v - envsList[i][3]
          end
        end
        addEnv(placingEnv, x + dx, y + dy, math.random(0, 1048575))
      end
    else
      envsPlacingTime = envsPlacingTime + nodes[165].widget_current
      local scene = root.session_gameplay_gameplay_scene[0]
      while envsPlacingTime > 50 do
        envsPlacingTime = envsPlacingTime - 20
        local sz = nodes[189].widget_current * brushSize * 128
        local envs = scene.envs
        local list = envs.f_search(data.xg, data.yg, sz)
        if #list == 0 then
          envsPlacingTime = 0
          return
        end
        local id = list[math.random(#list)]
        local env = envs.list[id]
        envs.f_remove(id)
        if currentSymmetry ~= nil then
          local px, py = getSymmetricPosition(env.position_x, env.position_y)
          local envsC = envs.f_search(px, py, 0)
          if #envsC ~= 0 then
            local env = scene.envs_list[envsC[1]]
            envs.f_remove(envsC[1])
          end
        end
        markMapNotSaved()
      end
    end
  elseif data.type == "unitsRemove" then
    local unitRemoveSpeed = 20
    unitsPlacingTime = unitsPlacingTime + unitRemoveSpeed
    local units = root.session_gameplay_gameplay_scene[0].units
    while 50 < unitsPlacingTime do
      unitsPlacingTime = unitsPlacingTime - 50
      local sz = nodes[265].widget_current * brushSize * 128
      local list = units.f_search2(data.xg, data.yg, sz)
      if #list == 0 then
        return
      end
      local id = list[math.random(#list)]
      units.f_remove(id)
      markMapNotSaved()
    end
  elseif data.type == "template" then
    local vSceneEdit = root.session_visual_scene[0].landscapeEdit
    local radius = nodes[604].widget_current * brushSize * 128
    if data.left then
      if not data.byTimer then
        return
      end
      local texture = nodes[609].widget_checked
      local colors = nodes[608].widget_checked
      local grass = nodes[610].widget_checked
      vSceneEdit.f_drawCirclePattern(data.xg, data.yg, radius, texture, colors, grass)
      if currentSymmetry ~= nil then
        local px, py = getSymmetricPosition(data.xg, data.yg)
        vSceneEdit.f_drawCirclePattern(px, py, radius, texture, colors, grass)
      end
    else
      vSceneEdit.f_smoothOutColorsCircle(data.xg, data.yg, radius, 1)
      if currentSymmetry ~= nil then
        local px, py = getSymmetricPosition(data.xg, data.yg)
        vSceneEdit.f_smoothOutColorsCircle(px, py, radius, 1)
      end
    end
    markMapNotSaved()
  elseif data.type == "texturing" then
    local vSceneEdit = root.session_visual_scene[0].landscapeEdit
    local power = nodes[204].widget_current / 100
    local radiusOuter = nodes[206].widget_current * brushSize * 128
    if data.left then
      if not data.byTimer then
        return
      end
      local color1 = nodes[5].widget_color_value
      local color2 = nodes[13].widget_color_value
      local texture = choosenTexture
      if not nodes[14].widget_checked then
        color1 = nil
      end
      if not nodes[15].widget_checked then
        color2 = nil
      end
      if not nodes[16].widget_checked then
        texture = nil
      end
      local radiusInner = nodes[205].widget_current * brushSize * 128
      if color1 ~= nil or color2 ~= nil then
        vSceneEdit.f_drawCircle(data.xg, data.yg, radiusOuter, color1, color2, texture, radiusOuter - radiusInner, power)
        if currentSymmetry ~= nil then
          local px, py = getSymmetricPosition(data.xg, data.yg)
          vSceneEdit.f_drawCircle(px, py, radiusOuter, color1, color2, texture, radiusOuter - radiusInner, power)
        end
      end
    else
      vSceneEdit.f_smoothOutColorsCircle(data.xg, data.yg, radiusOuter, power)
      if currentSymmetry ~= nil then
        local px, py = getSymmetricPosition(data.xg, data.yg)
        vSceneEdit.f_smoothOutColorsCircle(px, py, radiusOuter, power)
      end
    end
    markMapNotSaved()
  elseif data.type == "grassing" then
    local vSceneEdit = root.session_visual_scene[0].landscapeEdit
    if data.left then
      if not data.byTimer then
        return
      end
      local radiusInner = nodes[598].widget_current * brushSize * 128
      local radiusOuter = nodes[592].widget_current * brushSize * 128
      local density1 = math.floor(nodes[315].widget_current / 100 * 255)
      local density2 = math.floor(nodes[319].widget_current / 100 * 255)
      local density3 = math.floor(nodes[322].widget_current / 100 * 255)
      local density4 = math.floor(nodes[544].widget_current / 100 * 255)
      if nodes[135].widget_checked then
        density1 = 0
        density2 = 0
        density3 = 0
        density4 = 0
      end
      if nodes[314].widget_checked then
        placeGrass(0, data.xg, data.yg, radiusInner, radiusOuter, density1)
      end
      if nodes[321].widget_checked then
        placeGrass(1, data.xg, data.yg, radiusInner, radiusOuter, density2)
      end
      if nodes[324].widget_checked then
        placeGrass(2, data.xg, data.yg, radiusInner, radiusOuter, density3)
      end
      if nodes[549].widget_checked then
        placeGrass(3, data.xg, data.yg, radiusInner, radiusOuter, density4)
      end
    else
      local grassId = 0
      local power = 1
      local radius = nodes[592].widget_current * brushSize * 128
      vSceneEdit.f_smoothOutGrassCircle(data.xg, data.yg, radius, grassId, power)
      if currentSymmetry ~= nil then
        local px, py = getSymmetricPosition(data.xg, data.yg)
        vSceneEdit.f_smoothOutGrassCircle(px, py, radius, grassId, power)
      end
    end
    markMapNotSaved()
  elseif data.type == "leveling" then
    local power = math.floor(nodes[219].widget_current * 1.275)
    local radiusInner = nodes[220].widget_current * brushSize * 128
    local radiusOuter = nodes[221].widget_current * brushSize * 128
    if data.left then
      if not data.byTimer then
        return
      end
      root.session_gameplay_command.f_landscapeHeightSmooth(data.xg, data.yg, radiusInner, radiusOuter, power)
      if currentSymmetry ~= nil then
        local px, py = getSymmetricPosition(data.xg, data.yg)
        root.session_gameplay_command.f_landscapeHeightSmooth(px, py, radiusInner, radiusOuter, power)
      end
    else
      if data.startByTimer then
        levelingZ = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(data.xg, data.yg)
        return
      end
      if not data.byTimer then
        return
      end
      root.session_gameplay_command.f_landscapeHeightSmooth(data.xg, data.yg, radiusInner, radiusOuter, power, levelingZ)
      if currentSymmetry ~= nil then
        local px, py = getSymmetricPosition(data.xg, data.yg)
        root.session_gameplay_command.f_landscapeHeightSmooth(px, py, radiusInner, radiusOuter, power, levelingZ)
      end
    end
    markMapNotSaved()
  elseif data.type == "heightChange" then
    if not data.byTimer then
      return
    end
    local power = math.floor(nodes[244].widget_current / 8)
    local radiusInner = nodes[245].widget_current * brushSize * 128
    local radiusOuter = nodes[247].widget_current * brushSize * 128
    if not data.left then
      power = -power
    end
    root.session_gameplay_command.f_landscapeHeightChange(data.xg, data.yg, radiusInner, radiusOuter, power)
    if currentSymmetry ~= nil then
      local px, py = getSymmetricPosition(data.xg, data.yg)
      root.session_gameplay_command.f_landscapeHeightChange(px, py, radiusInner, radiusOuter, power)
    end
    markMapNotSaved()
  end
  return
end
if eventName == "getHotKeysRequest" then
  local requester = tonumber(getParameter("data"))
  root.interface[requester].f_sendEvent("getHotKeysResult", hotKeysResult)
end
if eventName == "toolsOnColor" then
  local data = fromJson(getParameter("data"))
  if data.color == nil then
    return
  end
  local nodes = interface.nodes
  if editingColor == 1 then
    nodes[5].widget_color_value = data.color
  else
    nodes[13].widget_color_value = data.color
  end
  return
end
