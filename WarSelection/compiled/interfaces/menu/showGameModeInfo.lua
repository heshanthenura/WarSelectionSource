local nodes = interface.nodes
local mode = getParameter("mode")
local node = nodes[298]
if not toBool(getParameter("enter")) then
  node.visible = false
  return
end
local parent = nodes[getParameter("widget")]
node.visible = true
node.localLeft = parent.screenLeft - math.floor(node.sizeX * 0.8)
node.localTop = parent.screenTop
local soon = false
local modeNameWidget = nodes[299].widget
local modeTextWidget = nodes[297].widget
if mode == "team" then
  modeNameWidget.text = localize("<*gameModeMultiTeam>")
  modeTextWidget.text = localize("<*gameModeMultiTeamAbout>")
elseif mode == "br" then
  modeNameWidget.text = localize("<*gameModeMultiBattleRoyale>")
  modeTextWidget.text = localize("<*gameModeMultiBattleRoyaleAbout>")
elseif mode == "ffa" then
  modeNameWidget.text = localize("<*gameModeMultiFFA>")
  modeTextWidget.text = localize("<*gameModeMultiFFAAbout>")
elseif mode == "1x1" then
  modeNameWidget.text = localize("<*gameModeMultyRate1x1>")
  modeTextWidget.text = localize("<*gameModeMultyRate1x1About>")
elseif mode == "2x2" then
  modeNameWidget.text = localize("<*gameModeMultyRate2x2>")
  modeTextWidget.text = localize("<*gameModeMultyRate2x2About>")
elseif mode == "sandbox" then
  modeNameWidget.text = localize("<*gameModeSandbox>")
  modeTextWidget.text = localize("<*gameModeSandboxAbout>")
elseif mode == "sandboxmp" then
  modeNameWidget.text = localize("<*gameModeSandbox>")
  modeTextWidget.text = localize("<*gameModeSandboxMultyAbout>")
elseif mode == "survival" then
  modeNameWidget.text = localize("<*gameModeSurvival>")
  modeTextWidget.text = localize("<*gameModeSurvivalAbout>")
elseif mode == "horde" then
  modeNameWidget.text = localize("<*gameModeHorde>")
  modeTextWidget.text = localize("<*gameModeHordeAbout>")
elseif mode == "tugofwar" then
  modeNameWidget.text = localize("<*gameModeTugOfWar>")
  modeTextWidget.text = localize("<*gameModeTugOfWarAbout>")
elseif mode == "campaign" then
  modeNameWidget.text = localize("<*gameModeSingleCampaign>")
  modeTextWidget.text = localize("<*gameModeSingleCampaignAbout>")
  soon = true
elseif mode == "skirmish" then
  modeNameWidget.text = localize("<*gameModeSkirmish>")
  modeTextWidget.text = localize("<*gameModeSkirmishAbout>")
  soon = true
end
nodes[296].visible = soon
