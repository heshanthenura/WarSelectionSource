local data = root.session_gameplay_gameplay_scene[0].mapData_asStr
local sha1 = root.functions.cryptography.f_sha1(data)
root.system_clipboard.f_set("map-" .. string.sub(sha1, 1, 4) .. data)
