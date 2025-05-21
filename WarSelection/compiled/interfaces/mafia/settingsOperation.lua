local nodes = interface.nodes
if getParameter("finish") ~= nil then
  if root.session_gameplay_streamMode == 0 then
    root.session_gameplay_tickController_tickTime = 50
  end
  return
end
if getParameter("graphicsLevel") ~= nil then
  root.session_visual_script_scripts_run = {
    35,
    "level",
    getParameter("graphicsLevel")
  }
  return
end
root.interface_settings_active = true
if root.session_gameplay_streamMode == 0 then
  root.session_gameplay_tickController_tickTime = 10000000
end
