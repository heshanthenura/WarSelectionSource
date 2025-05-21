local volume = getParameter("value") / 250
root.storage.f_set("musicVolume", volume)
interface.sound_musicVolume = volume
root.interface_store_sound_musicVolume = volume
