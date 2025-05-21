local volume = getParameter("value") / 100
root.session_visual_sound_volume = volume
root.storage.f_set("soundVolume", volume)
root.interface.f_sendEvent("soundVolume", tostring(volume))
