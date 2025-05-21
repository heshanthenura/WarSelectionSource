if getParameter("pressed") then
  if trySendSignal("move", getParameter("x"), getParameter("y")) then
    return
  end
  if useFrame then
    local vSession = root.session_visual
    local scene = vSession.scene[0]
    if 0 < scene.selection_units_list_size and not scene.placer_on then
      local controlledFactions = vSession.controlledFactions_value
      local selectedMovableUnits = scene.f_selectedUnitsFilter(controlledFactions, true)
      movePlacer = true
      local appearance = directionAppearance
      if #selectedMovableUnits == 0 then
        appearance = nil
      end
      vSession.placer.f_free(appearance, 200, "interface=" .. interfaceId, 0, 0, 0, 0, true)
    end
  end
  if useDrag == 2 then
    root.session_visual.f_dragCameraStart()
  end
else
  local command = root.session_gameplay_command
  if command ~= nil and root.session_visual_scene[0].selection_units_list_size == 0 then
    local plan = root.session_visual.f_collideBuildPlan(getParameter("x"), getParameter("y"))
    if plan ~= nil then
      command.f_buildPlanRemove(plan)
    end
  end
  if useFrame and movePlacer then
    local vSession = root.session_visual
    if not vSession.scene[0].placer_isRotated then
      vSession.f_collideObjectAndSendCommand()
    elseif not vSession.f_sendMoveCommand() then
      vSession.f_collideObjectAndSendCommand()
    end
    vSession.placer.f_turnOff()
    movePlacer = false
  end
  if useDrag == 2 then
    root.session_visual.f_dragCameraStop()
  end
end
