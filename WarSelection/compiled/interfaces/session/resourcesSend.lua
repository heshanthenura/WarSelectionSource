local command = getCommands()
if command == nil then
  return
end
local nodes = interface.nodes
nodes[1275].visible = true
nodes[1274].visible = false
nodes[74].visible = false
nodes[1579].disabled = true
local data = {
  fromFaction = sendResourcesFromFaction,
  toFaction = sendResourcesToFaction,
  percent = sendResourcesPercent,
  r0 = math.floor(tonumber(nodes[1449].widget_text_text) * 1000),
  r1 = math.floor(tonumber(nodes[1450].widget_text_text) * 1000),
  r2 = math.floor(tonumber(nodes[1455].widget_text_text) * 1000),
  r3 = math.floor(tonumber(nodes[391].widget_text_text) * 1000),
  r4 = math.floor(tonumber(nodes[398].widget_text_text) * 1000)
}
command.f_specialCommand(0, "command", "sendResources", "data", toJson(data))
