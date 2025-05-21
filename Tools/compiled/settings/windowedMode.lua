local value = getParameter("value")
root.storage.f_set("windowed", value)
local set = value == 0
root.window_fullScreen = set
if not set then
  root.window.f_maximize()
end
