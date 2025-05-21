local interfaces = root.interface
interfaces.f_remove(interfaces.f_getIndex("scene"))
interfaces.f_remove(interfaces.f_getIndex("settings"))
interfaces.f_remove(interfaces.f_getIndex("chat"))
interfaces.f_remove(interfaces.f_getIndex("minimap"))
if interfaces.matchResult ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("matchResult"))
end
if interfaces.disconnectControl ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("disconnectControl"))
end
if interfaces.waitingStart ~= nil then
  interfaces.f_remove(interfaces.f_getIndex("waitingStart"))
end
