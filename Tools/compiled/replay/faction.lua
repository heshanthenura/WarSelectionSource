local id = getFactionOfPlayer(getParameter("value"))
root.session_visual_currentFaction = id
local controlledFactions = root.session_visual_controlledFactions
controlledFactions.value = 0
controlledFactions[id] = true
