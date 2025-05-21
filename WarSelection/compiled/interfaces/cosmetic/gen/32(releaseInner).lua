local button = tonumber(getParameter("button"))
local abilityId = statueAbilities[statuesOnButtons[button]]
root.session_visual_placer.f_free(79, 50, "interface=" .. interfaceId .. ",id=" .. abilityId)
