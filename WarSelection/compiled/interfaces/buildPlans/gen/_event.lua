local eventName = getParameter("name")
if eventName == "onPlacer" then
  local data = fromJson(getParameter("data"))
  if data.left then
    local vSession = root.session_visual
    local hk = interface.hotKeys.f_check(16)
    local plan = tonumber(data.plan)
    if plan == nil then
      return
    end
    if hk then
      reinit = plan
    end
    local fac = root.session_gameplay_gameplay_faction[vSession.currentFaction]
    local wall = fac.build[plan].wall
    local directiong = data.directiong
    local faction = vSession.currentFaction
    if wall then
      vSession.commands.f_buildPlanLine(not hk, faction, plan, data.xg, data.yg, data.fxg, data.fyg, data.planStart, data.planFinish, data.unitStart, data.unitFinish)
    else
      vSession.commands.f_buildPlanAdd(not hk, faction, plan, data.xg, data.yg, directiong, data.targetEnv)
    end
    vSession.f_createEmitters(0, 102, 1, true, data.x, data.y)
  end
  if data.final then
    root.session_render_landscape_colorPassMap.f_hide()
    root.window_cursor = 0
    if reinit ~= nil then
      startPlacing(reinit)
      reinit = nil
    end
  end
  return
end
if eventName == "getHotKeysRequest" then
  local requester = tonumber(getParameter("data"))
  root.interface[requester].f_sendEvent("getHotKeysResult", hotKeysResult)
end
