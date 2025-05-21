local nodes = interface.nodes
local storage = root.storage
nodes[23].widget_value = math.floor(tonumber(storage.rQuality))
nodes[62].visible = nodes[23].widget_value == 4
local notVolFow = tonumber(root.storage_notVolFow)
if notVolFow == nil then
  notVolFow = 0
end
nodes[63].widget_checked = 1 - notVolFow
nodes[29].widget_current = math.floor(tonumber(storage.soundVolume) * 100)
local v = math.floor(tonumber(storage.musicVolume) * 250)
if 100 < v then
  v = 100
end
nodes[28].widget_current = v
nodes[19].widget_current = math.floor(tonumber(storage.cameraSpeed) / 40) - 20
nodes[18].widget_current = math.floor(tonumber(storage.cameraInertia) / 5)
nodes[17].widget_checked = toBool(storage.bordersScroll)
nodes[26].widget_value = 3 - math.floor(tonumber(storage.showHealthBarMode))
nodes[21].widget_checked = toBool(storage.windowed)
nodes[20].widget_checked = toBool(storage.vSync)
root.render_quality_antialiasing = toBool(storage.antialiasing)
root.render.f_applyQualityChanges()
nodes[25].widget_checked = root.render_quality_antialiasing
nodes[59].visible = false
nodes[49].visible = false
nodes[90].visible = false
nodes[92].visible = false
nodes[16].visible = root.interface_cinematic ~= nil
local scale = tonumber(root.storage_interfaceScale)
assert(scale ~= nil)
setInterfaceScale(scale)
setScaleWidget()
if root.session_gameplay_streamMode == 0 then
  if useVeil then
    interface.nodes[1].visible = true
  end
  if mayStopTime then
    stoppedTime = root.session_gameplay_tickController_tickTime
    root.session_gameplay_tickController_tickTime = 10000000
  end
end
