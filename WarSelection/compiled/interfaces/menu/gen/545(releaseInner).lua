local nodes = interface.nodes
nodes[505].visible = false
nodes[53].visible = true
privateMode = getParameter("mode")
nodes[63].disabled = false
nodes[218].widget_text_text = localize("<*defaultMatchName>")
nodes[781].visible = privateMode == "standard" and nodes[606].widget_checked
nodes[44].visible = privateMode == "standard" or privateMode == "survival"
nodes[364].visible = privateMode == "standard" or privateMode == "sandbox"
nodes[821].visible = privateMode == "survival"
nodes[57].visible = privateMode == "tugofwar"
nodes[254].visible = privateMode == "horde"
nodes[374].visible = privateMode == "sandbox"
nodes[787].visible = privateMode == "standard" or privateMode == "sandbox"
nodes[1547].visible = privateMode == "standard"
nodes[789].visible = privateMode == "standard"
nodes[785].visible = privateMode == "standard"
nodes[828].visible = false
if privateMode == "standard" then
  nodes[828].visible = true
  if nodes[606].widget_checked then
    nodes[482].widget_text = localize("<*gameModeMultiTeam>")
  else
    nodes[482].widget_text = localize("<*gameModeMultiFFA>")
  end
elseif privateMode == "sandbox" then
  nodes[828].visible = true
  nodes[482].widget_text = localize("<*gameModeSandbox>")
elseif privateMode == "survival" then
  nodes[482].widget_text = localize("<*gameModeSurvival>")
elseif privateMode == "tugofwar" then
  nodes[482].widget_text = localize("<*gameModeTugOfWar>")
elseif privateMode == "horde" then
  nodes[482].widget_text = localize("<*gameModeHorde>")
else
  nodes[482].widget_text = localize("<*gameModeCustomMap>")
end
nodes[486].visible = privateMode == "standard" or privateMode == "sandbox"
nodes[1241].widget_checked = false
if privateMode == "survival" then
  local hasCoop = isPropertyAvailable(0) == 2
  nodes[212].visible = not hasCoop
  nodes[63].disabled = not hasCoop
elseif privateMode == "sandbox" then
  local hasCoop = isPropertyAvailable(0) == 2
  nodes[372].visible = not hasCoop
  nodes[63].disabled = not hasCoop
end
mapCode = ""
nodes[1461].visible = false
nodes[1264].visible = false
nodes[1261].visible = false
