local value = getParameter("value")
root.storage.f_set("antialiasing", value)
root.render_quality_antialiasing = value
root.render.f_applyQualityChanges()
root.interface.f_sendEvent("graphicsChanged", "")
