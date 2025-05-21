local value = getParameter("value")
root.storage.f_set("vSync", value)
root.render_vSync = value == 1
