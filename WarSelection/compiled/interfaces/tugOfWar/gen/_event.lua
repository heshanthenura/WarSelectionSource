local eventName = getParameter("name")
if eventName == "playerEliminate" then
  local data = fromJson(getParameter("data"))
  local nodes = interface.nodes
  local pls = staticData.players[data.player]
  local id = playerInterfaces[pls.teamNum][pls.playerNum].lose
  nodes[id].visible = true
  return
end
if eventName == "chatPlayerClick" then
  showPlayerWindow(tonumber(getParameter("data")))
  return
end
if eventName == "changeGraphics" then
  root.session_visual_script_scripts.f_run(35, "level", tonumber(getParameter("data")))
  return
end
if eventName == "onPlacer" then
  local command = root.session_visual_commands
  if command ~= nil then
    local data = fromJson(getParameter("data"))
    if data.left then
      if data.house ~= nil then
        if canBuildHouse() == 1 then
          local unitTypeId = getMyCulture().house[1]
          command.f_specialCommand(0, "command", "buyHouse", "unit", unitTypeId, "x", data.xg, "y", data.yg)
        end
      elseif data.tower ~= nil then
        local myTeamPlayerD = getMyDinamic()
        if myTeamPlayerD.tower ~= 0 then
          local unitTypeId = getMyCulture().tower[1]
          command.f_specialCommand(0, "command", "buyTower", "unit", unitTypeId, "x", data.xg, "y", data.yg)
        end
      end
    end
  end
  return
end
if eventName == "getHotKeysRequest" then
  local requester = tonumber(getParameter("data"))
  root.interface[requester].f_sendEvent("getHotKeysResult", hotKeysResult)
end
