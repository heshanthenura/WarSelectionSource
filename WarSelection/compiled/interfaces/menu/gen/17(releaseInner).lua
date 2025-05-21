if not editorMode then
  return
end
local seed = os.time()
local json = getDemoJson(seed)
table.remove(json.scriptsV, 4)
table.insert(json.scriptsV, "wFs1okaN4Ng_2")
log("Add task to start session singleplayer demo")
addStartSessionTask("startSingle", toJson(json))
