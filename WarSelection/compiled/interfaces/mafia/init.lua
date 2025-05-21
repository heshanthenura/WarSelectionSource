interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
interfaceScale = interface.scaleWidgets

function toBool(v)
  if type(v) == "number" then
    return v ~= 0
  end
  if type(v) == "string" then
    if v == "true" then
      return true
    end
    local n = tonumber(v)
    return n ~= nil and n ~= 0
  end
  return false
end

local nodes = interface.nodes
root.interface.f_create("/project/Tools/cameraMove", "cameraMove", interfaceScale, interfaceScale, "bordersScroll", toBool(root.storage_bordersScroll))
root.interface_cameraMove_active = true
root.interface_cameraMove_priority = 100
root.interface.f_create("/project/Tools/scene", "scene", interfaceScale, interfaceScale, "cbInterfaceLeft", interfaceId, "cbScriptLeft", 6)
root.interface_scene_active = true
root.interface_scene_priority = -100
root.interface.f_create("/project/Tools/settings", "settings", interfaceScale, interfaceScale, "cbInterface", interfaceId, "cbScript", 3, "healthBarAppDefault", 2, "healthBarAppColored", 1027, "dumpFileName", root.system_localFolder .. "/dump.dat")
root.interface_settings_active = false
root.interface_settings_priority = 90
