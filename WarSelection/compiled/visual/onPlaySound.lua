local interface = root.interface_development
if interface == nil then
  return
end
local showSounds = interface.nodes[678].widget_checked
if not showSounds then
  return
end
local x = getParameter("x")
local y = getParameter("y")
local z = getParameter("z")
local vSession = root.session_visual
local url = vSession.sound_content[getParameter("id")].url
vSession.f_createEmitters(0, 185, 1, true, x, y, z, 0, 0, 10, url, 0)
vSession.f_createEmitters(0, 184, 1, true, x, y, z - 20, 0, 0, 10)
