root.launcher_reportEngineReady = nil
root.interface_loading_active = false
local nodes = interface.nodes
local storage = root.storage
if storage.tutorialDone ~= "1" then
  nodes[1195].visible = true
  nodes[1192].visible = false
else
  nodes[1195].visible = false
  nodes[1192].visible = true
end
root.window_cursor = 0
local storage = root.storage
local gamma = math.floor(tonumber(storage.gamma2))
if gamma < nodes[1127].widget_min then
  gamma = nodes[1127].widget_min
end
setGamma(gamma)
nodes[1127].widget_current = gamma
root.render_vSync = toBool(storage.vSync)
nodes[304].widget_checked = toBool(storage.vSync)
nodes[341].widget_checked = toBool(storage.windowed)
nodes[221].widget_value = math.floor(tonumber(storage.rQuality))
setScaleWidget()
updateViewportSize()
if root.interface_friends ~= nil then
  root.interface_friends_active = true
end
