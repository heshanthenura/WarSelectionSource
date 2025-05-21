local interfaces = root.interface
interfaces.f_remove(interfaces.f_getIndex("cameraMove"))
interfaces.f_remove(interfaces.f_getIndex("cinematic"))
interfaces.f_remove(interfaces.f_getIndex("scene"))
interfaces.f_remove(interfaces.f_getIndex("settings"))
interfaces.f_remove(interfaces.f_getIndex("chat"))
interfaces.f_remove(interfaces.f_getIndex("minimap"))
interfaces.f_remove(interfaces.f_getIndex("bigminimap"))
interfaces.f_remove(unitsSelectedGroupInterface)
if interfaces.buildPlans ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("buildPlans"))
end
if interfaces.replay ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("replay"))
end
if interfaces.matchResult ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("matchResult"))
end
if interfaces.disconnectControl ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("disconnectControl"))
end
if interfaces.waitingStart ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("waitingStart"))
end
