local val = getParameter("value") / 100
interface.sound_volume = val
root.storage.f_set("soundVolume", val)
