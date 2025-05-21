local char = getParameter("char")
if char == 27 then
  local nodes = interface.nodes
  nodes[22].widget_text_text = ""
  nodes[28].visible = false
  nodes[1].visible = false
  chatFocused = false
  return
end
if char == 9 then
  local nodes = interface.nodes
  local all = not nodes[23].visible
  nodes[23].visible = all
  nodes[24].visible = not all
  return
end
if char == 13 then
  local nodes = interface.nodes
  local text = nodes[22].widget_text_text
  nodes[22].widget_text_text = ""
  text = string.gsub(text, "\n", "")
  text = string.gsub(text, "\r", "")
  nodes[28].visible = false
  nodes[1].visible = false
  chatFocused = false
  local command = root.session_gameplay_command
  if command ~= nil and #text ~= 0 and #text < 500 then
    local destination
    local destinationV = 0
    if nodes[23].visible then
      destination = "all"
      destinationV = 0
    else
      destination = "team"
      destinationV = 0
      local myTeam = getPlayerTeam(root.session_gameplay_controlledPlayer)
      local plr = root.session_gameplay_gameplay_player
      local players = plr.size
      for i = 0, players - 1 do
        local team = getPlayerTeam(i)
        if team == myTeam then
          destinationV = destinationV + (1 << i)
        end
      end
    end
    local font = nodes[22].widget_text_fontName
    command.f_specialCommand(destinationV, "command", "chat", "text", text, "destination", destination, "font", font)
  end
end
