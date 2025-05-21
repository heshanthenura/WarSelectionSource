local command = getCommands()
if command == nil then
  return
end
if unloadToPosition then
  root.session_visual_placer.f_free(nil, 1, "interface=" .. interfaceId .. ",type=commandUnload")
  root.window_cursor = 3
else
  command.f_unload(true)
end
