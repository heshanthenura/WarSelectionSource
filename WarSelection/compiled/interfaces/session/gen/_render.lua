local vSession = root.session_visual
local vScene = vSession.scene[0]
local sel = vScene.selection_units_list
if sel.size == 1 then
  local myFactionId = vSession.currentFaction
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local unitsList = scene.units_list
  local gUnit = unitsList[sel[0]]
  if gUnit ~= nil and gUnit.movement ~= nil and gUnit.faction == myFactionId then
    local path = gUnit.movement.pathTracker
    if path ~= nil then
      local renderTasks = root.session_render_tasks
      local landscape = scene.landscape
      local gx = gUnit.position_x
      local gy = gUnit.position_y
      local p1 = {
        vSession.f_coordinateToVisual2(gx),
        vSession.f_coordinateToVisual2(gy),
        vSession.f_coordinateToVisual2(gUnit.position_z)
      }
      local p = 0
      while true do
        local p2 = path.f_getPosition(p)
        if p2 == nil then
          break
        end
        p2 = landscape.passability.f_passPointToWorld(p2[1], p2[2])
        p2[3] = landscape.f_getHeight(p2[1], p2[2])
        if p2[3] < 130200 then
          p2[3] = 130200
        end
        p2 = {
          vSession.f_coordinateToVisual2(p2[1]),
          vSession.f_coordinateToVisual2(p2[2]),
          vSession.f_coordinateToVisual2(p2[3])
        }
        local color
        if p == 0 then
          color = 4294932480
        else
          color = 4278228435
        end
        renderTasks.f_addTexturedLine(p2[1], p2[2], p2[3], p1[1], p1[2], p1[3], color, color, 209, 6, false, true)
        p1 = p2
        p = p + 1
      end
    end
  end
end
if root.window_cursor == 2 then
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local unitsList = scene.units_list
  local placerPos = vScene.placer_position
  local renderTasks = root.session_render_tasks
  for i = 0, sel.size - 1 do
    local selId = sel[i]
    if selId ~= nil then
      local gUnit = unitsList[selId]
      if gUnit ~= nil then
        local unitType = gameplay.unitTypeModified[gUnit.typeModified]
        local ag = getAttackGround(gUnit.type, unitType)
        if ag ~= nil then
          local distanceMin = 10000000000
          local distanceMax = 0
          if ag.weapon ~= nil then
            local weapon = unitType.attack_weapon[ag.weapon]
            distanceMin = weapon.distanceMin
            distanceMax = weapon.distanceMax
          end
          if ag.turrets ~= nil then
            for _, v in ipairs(ag.turrets) do
              local turret = unitType.attack_turret[v[1]]
              if turret ~= nil then
                local weapon = turret.weapon[v[2]]
                if distanceMin > weapon.distanceMin then
                  distanceMin = weapon.distanceMin
                end
                if distanceMax < weapon.distanceMax then
                  distanceMax = weapon.distanceMax
                end
              end
            end
          end
          if distanceMin > distanceMax then
            distanceMax = distanceMin
          end
          local gx = gUnit.position_x
          local gy = gUnit.position_y
          local vx = vSession.f_coordinateToVisual2(gx)
          local vy = vSession.f_coordinateToVisual2(gy)
          local vz = vSession.f_coordinateToVisual2(gUnit.position_z)
          local dx = gx - placerPos.x * 256
          local dy = gy - placerPos.y * 256
          local d = dx * dx + dy * dy
          local color = 4278255426
          if d < distanceMin * distanceMin or d > distanceMax * distanceMax then
            if unitType.movementOn then
              color = 4278221055
            else
              color = 4278190080
            end
          end
          renderTasks.f_addTexturedLine(vx, vy, vz, placerPos.x, placerPos.y, placerPos.z, color, color, 208, 6, false, false)
        end
      end
    end
  end
end
