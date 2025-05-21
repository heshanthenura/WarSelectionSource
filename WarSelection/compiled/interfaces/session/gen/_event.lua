local eventName = getParameter("name")
if eventName == "notification" then
  local data = fromJson(getParameter("data"))
  local id = data.id
  local nodes = interface.nodes
  local node = nodes[575]
  node.visible = true
  if id == 0 then
    node.widget.f_setText(localize("<*notificationSupply>"))
  elseif id == 1 then
    node.widget.f_setText(localize("<*notificationNoBuildAbility>"))
  elseif id == 2 then
    node.widget.f_setText(localize("<*notificationSupplyStopsBuild>"))
  elseif id == 3 then
    node.widget.f_setText(localize("<*notificationNoResourcesToStartBuild>"))
  elseif id == 4 then
    node.widget.f_setText(localize("<*notificationOutOfResourcesFood>"))
  elseif id == 5 then
    node.widget.f_setText(localize("<*notificationOutOfResourcesMaterials>"))
  elseif id == 6 then
    node.widget.f_setText(localize("<*notificationOutOfResourcesMetal>"))
  elseif id == 7 then
    node.widget.f_setText(localize("<*notificationBlockedSignals>"))
  else
    node.widget.f_setText("Unknown notification")
  end
  node.color_a = 200
  notificationEndTime = os.time() + 3
  if notifLerp ~= nil then
    root.functions.interpolator.f_remove(notifLerp)
    notifLerp = nil
  end
  return
end
if eventName == "playerEliminate" then
  local data = fromJson(getParameter("data"))
  if data.reason == nil then
    return
  end
  switchPlayerOff(data.player)
  if isModeReplay then
    return
  end
  if data.player ~= root.session_gameplay_controlledPlayer then
    return
  end
  gameIsEnded = data.reason
  return
end
if eventName == "chatPlayerClick" then
  showPlayerWindow(tonumber(getParameter("data")))
  return
end
if eventName == "replayRewind" then
  reinitPlayersList(false)
  return
end
if eventName == "changeGraphics" then
  root.session_visual_script_scripts.f_run(35, "level", tonumber(getParameter("data")))
  return
end
if eventName == "minimapPress" then
  local data = fromJson(getParameter("data"))
  if data.button == "left" then
    if root.window_cursor == 1 then
      root.window_cursor = 0
      root.session_visual_placer.f_turnOff()
      commandMoveAttack(data.x, data.y, data.xg, data.yg)
    end
  elseif root.session_visual_scene[0].placer_on then
    root.window_cursor = 0
    root.session_visual_placer.f_turnOff()
  else
    root.session_visual_script_scripts.f_run(11, "x", data.x, "y", data.y, "xg", data.xg, "yg", data.yg, "direction", 0)
  end
  return
end
if eventName == "onPlacer" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  if data.type == "attackGround" then
    root.window_cursor = 0
    if data.left then
      local command = root.session_visual_commands
      if command == nil then
        return
      end
      local vSession = root.session_visual
      local selector = vSession.scene[0].selection_units_list
      if selector.size == 0 then
        return
      end
      local clearTasks = not interface.hotKeys.f_check(addTaskHotKey)
      local zg = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(data.xg, data.yg)
      local onWater = zg ~= nil and underWater(zg)
      local list = fromJson(data.list)
      if list == nil then
        return
      end
      for unitTypeId, v in pairs(list) do
        list[unitTypeId] = toJson(v)
      end
      for unitTypeId, v in pairs(list) do
        if v ~= 0 then
          local unitTypes = {}
          for unitTypeId_, data_ in pairs(list) do
            if data_ == v then
              table.insert(unitTypes, unitTypeId_)
              list[unitTypeId_] = 0
            end
          end
          local uts = ""
          for i = 1, #unitTypes do
            if 1 < i then
              uts = uts .. ","
            end
            uts = uts .. unitTypes[i]
          end
          command.f_attackGround(clearTasks, data.xg, data.yg, v, true, uts)
        end
      end
      vSession.f_createEmitters(0, 1641, 1, true, data.x, data.y, 0, 0, 0, 0, "", 0, onWater)
    end
  elseif data.type == "commandUnload" then
    root.window_cursor = 0
    if data.left then
      local command = root.session_visual_commands
      if command == nil then
        return
      end
      local vSession = root.session_visual
      local selector = vSession.scene[0].selection_units_list
      if selector.size == 0 then
        return
      end
      local clearTasks = not interface.hotKeys.f_check(addTaskHotKey)
      local zg = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(data.xg, data.yg)
      local onWater = zg ~= nil and underWater(zg)
      command.f_unload(clearTasks, nil, data.xg, data.yg)
      vSession.f_createEmitters(0, 1646, 1, true, data.x, data.y, 0, 0, 0, 0, "", 0, onWater)
    end
  elseif data.type == "attackPlacer" then
    root.window_cursor = 0
    if data.left then
      commandMoveAttack(data.x, data.y, data.xg, data.yg)
    end
  elseif data.type == "specialAbility" then
    root.window_cursor = 0
    if data.left then
      local command = root.session_visual_commands
      if command == nil then
        return
      end
      local vSession = root.session_visual
      local selector = vSession.scene[0].selection_units_list
      if selector.size == 0 then
        return
      end
      local par = getParameters()
      if data.ability == "useWeapon" then
        local attackerType = tonumber(data.attackerType)
        if data.ground ~= nil then
          local clearTasks = not interface.hotKeys.f_check(addTaskHotKey)
          command.f_attackGround(clearTasks, data.xg, data.yg, "{\"weapon\":" .. data.weapon .. "}", toBool(data.single), data.attackerType)
          return
        else
          local target = vSession.f_underCursorAttackTarget(tonumber(data.tags), 0)
          if target == nil then
            return
          end
          commandAttack(target, tonumber(data.weapon), toBool(data.single), attackerType)
        end
      end
    end
  elseif data.type == "commandWorkAddWithRallyPoint" then
    root.window_cursor = 0
    if data.left then
      local command = root.session_visual_commands
      if command == nil then
        return
      end
      local vSession = root.session_visual
      if vSession.scene[0].selection_units_list_size == 0 then
        return
      end
      command.f_workAdd(tonumber(data.unitType), tonumber(data.work), tonumber(data.amount), true, true, data.xg, data.yg)
      local zg = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(data.xg, data.yg)
      local onWater = zg ~= nil and underWater(zg)
      vSession.f_createEmitters(0, 1640, 1, true, data.x, data.y, 0, 0, 0, 0, "", 0, onWater)
    end
  end
  return
end
if eventName == "getHotKeysRequest" then
  local requester = tonumber(getParameter("data"))
  root.interface[requester].f_sendEvent("getHotKeysResult", hotKeysResult)
end
if eventName == "hideInterfaces" then
  hideInterfaces_(toBool(getParameter("data")))
  return
end
if eventName == "quitSessionRequest" then
  local nodes = interface.nodes
  nodes[216].visible = true
  if nodes[220].visible and not teamSurrendered then
    nodes[266].visible = true
    nodes[233].visible = false
    if root.ann == nil then
      nodes[182].visible = true
    else
      addPredictionLeave()
    end
    nodes[182].visible = false
  end
  return
end
if eventName == "playerSurrender" then
  local data = root.session_gameplay_gameplay_dataStorage.f_get("surrender")
  updateSurrender(fromJson(data))
  return
end
if eventName == "onUnitsSelection" then
  currentSelectionUnitType = tonumber(getParameter("data"))
  return
end
