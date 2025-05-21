local eventName = getParameter("name")
if eventName == "setFaction" then
  faction = tonumber(getParameter("data"))
  if faction == nil then
    faction = 0
  end
  setFaction(faction)
  local nodes = interface.nodes
  nodes[328].visible = faction >= 8
  nodes[3].visible = faction >= 8
  local fcs = root.session_gameplay_gameplay_faction_size
  local facs = root.session_visual_faction
  nodes[197].visible = 8 < fcs and faction < 8
  for f = 0, 63 do
    if f < fcs then
      local c1 = facs[f].minimapColor_value | 4278190080
      local c2 = facs[f].minimapBorderColor_value | 4278190080
      local id = factionButtons[f + 1]
      nodes[id].visible = true
      nodes[id].widget_bottom_set_normalColor_value = c1
      nodes[factionsTexts[f + 1]].widget_font_textColor_value = c2
    else
      nodes[factionButtons[f + 1]].visible = false
    end
  end
  return
end
