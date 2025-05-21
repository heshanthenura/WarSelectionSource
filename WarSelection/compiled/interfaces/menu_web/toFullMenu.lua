root.interface_storeWeb_active = false
root.interface_menuWeb_active = false
root.interface_loading_active = true
if root.interface_menu == nil then
  root.lobby_enabled = false
  local interfaceScale = tonumber(root.storage_interfaceScale)
  if interfaceScale == nil then
    interfaceScale = 1
  end
  root.interface.f_create("/project/WarSelection/interfaces/menu", "menu", interfaceScale, interfaceScale)
end
root.interface_menu_active = true
