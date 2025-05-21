local name = getParameter("name")
if name == "mapSignal" then
  local data = fromJson(getParameter("data"))
  local signalType = data.type
  local p = positionVisualToScreen(data.x, data.y)
  local n5 = interface.nodes[5]
  local npx = n5.localLeft
  local npy = n5.localTop
  local sx = n5.sizeX
  local sy = n5.sizeY
  local x = npx + p[1]
  local y = npy + p[2]
  local particles = interface.particles
  if signalType == "lookLandscape" then
    particles.f_create(0, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(3, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(2, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "moveLandscape" then
    particles.f_create(0, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(3, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(1, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "openGate" then
    particles.f_create(8, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(9, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "closeGate" then
    particles.f_create(8, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(9, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "lookUnit" then
    particles.f_create(0, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(3, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(2, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "moveUnit" then
    particles.f_create(0, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(3, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(1, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "lookEnemy" then
    particles.f_create(6, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(7, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "moveEnemy" then
    particles.f_create(6, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(7, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "lookDeposit" then
    particles.f_create(4, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(5, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "moveDeposit" then
    particles.f_create(4, x, y, 0.9, npx, npy, sx, sy)
    particles.f_create(5, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "firecracker" then
    particles.f_create(10, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "fireworks" then
    particles.f_create(11, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "snowfall" then
    particles.f_create(12, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "cursedGround" then
    particles.f_create(18, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "wonder" then
    particles.f_create(13, x, y, 0.9, npx, npy, sx, sy)
  elseif signalType == "meteorPumpkin" then
    particles.f_create(19, x, y, 0.9, npx, npy, sx, sy)
  end
  return
end
if name == "minimapLayer" then
  local data = fromJson(getParameter("data"))
  local nodes = interface.nodes
  if data.layer == "camera" then
    nodes[1].visible = data.on
  elseif data.layer == "fow" then
    nodes[2].visible = data.on
  elseif data.layer == "units" then
    nodes[3].visible = data.on
  elseif data.layer == "envs" then
    nodes[6].visible = data.on
  elseif data.layer == "factions" then
    nodes[4].visible = data.on
  end
end
