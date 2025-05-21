local parameters = "abilities=\"" .. account.properties .. "\""
log("Add task to start session dump (abilities=" .. account.properties .. ")")
addStartSessionTask("startSingleDump", parameters, root.system_localFolder .. "/dump.dat", root.system_localFolder .. "/replay.rep")
