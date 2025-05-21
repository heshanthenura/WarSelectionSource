factionColorsByTeams = not factionColorsByTeams
updateFactionsColors()
root.session_visual_script_scripts.f_run(19)
root.storage.f_set("factionColorsByTeams", factionColorsByTeams)
