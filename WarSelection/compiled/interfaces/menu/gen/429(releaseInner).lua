local key = root.lobby.f_makeAccountKey(5)
root.system.f_openLink("https://discord-connect.warselect.io?accountKey=" .. key)
