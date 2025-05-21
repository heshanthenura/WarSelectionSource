local vSession = root.session_visual
local vScene = vSession.scene[0]
placing = vScene.placer_on
if getParameter("pressed") then
  local x = getParameter("x")
  local y = getParameter("y")
  if trySendSignal("look", x, y) then
    return
  end
  if useFrame and not vScene.placer_on then
    frameStartPos = {x, y}
    root.session_render.f_selectionFrameStart()
    vScene.camera_controllers_move.f_lock(true)
  end
  if useDrag == 1 then
    vSession.f_dragCameraStart()
  end
  if useSingleSelect == 1 then
    local unitId = vSession.f_collideUnit(vSession.currentFaction, x, y)
    if unitId ~= nil then
      local clearSelection = true
      if addSelectionHotKey ~= nil then
        clearSelection = not vSession.hotKeys.f_check(addSelectionHotKey)
      end
      vScene.f_selectUnits3(unitId, clearSelection)
    else
      vScene.f_selectUnits3()
    end
  end
else
  if useFrame and frameStartPos ~= nil then
    local addSelection = false
    if addSelectionHotKey ~= nil then
      addSelection = vSession.hotKeys.f_check(addSelectionHotKey)
    end
    vScene.camera_controllers_move.f_lock(false)
    vScene.f_setSelectedEnv()
    local x = getParameter("x")
    local y = getParameter("y")
    local frameSize = math.max(math.abs(x - frameStartPos[1]), math.abs(y - frameStartPos[2]))
    if 20 <= frameSize then
      local uns = root.session_render.f_selectionFrameStop()
      vScene.f_selectUnits3(uns, not addSelection)
    else
      root.session_render.f_selectionFrameStop(false)
      vSession.f_selectUnderCursor(addSelection)
    end
  end
  if useDrag == 1 then
    vSession.f_dragCameraStop()
  end
  frameStartPos = nil
end
