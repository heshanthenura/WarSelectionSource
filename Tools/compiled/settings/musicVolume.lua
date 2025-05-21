local volume = getParameter("value") / 250
root.session_visual_sound_musicVolume = volume
root.storage.f_set("musicVolume", volume)
root.interface.f_sendEvent("musicVolume", tostring(volume))
