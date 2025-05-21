parentInterface = getParameter("parent")
dumpFileName = getParameter("dumpFileName")
mayStopTime = toBool(getParameter("mayStopTime"), true)
useVeil = getParameter("useVeil")
if useVeil == nil then
  useVeil = true
end
webVersion = root.system_platformName == "web"
local nodes = interface.nodes
nodes[47].visible = root.session_gameplay_streamMode == 0 and dumpFileName ~= nil
nodes[10].visible = not webVersion
