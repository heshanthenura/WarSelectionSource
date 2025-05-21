notificationsListStrings = {
  {
    2,
    13,
    7
  },
  {
    3,
    14,
    8
  },
  {
    4,
    15,
    9
  },
  {
    5,
    16,
    10
  },
  {
    6,
    17,
    12
  }
}
fonts = {
  ru = localize("<*font_ru>"),
  br = localize("<*font_br>"),
  cn = localize("<*font_cn>"),
  cs = localize("<*font_cs>"),
  sk = localize("<*font_sk>"),
  da = localize("<*font_da>"),
  de = localize("<*font_de>"),
  en = localize("<*font_en>"),
  es = localize("<*font_es>"),
  fr = localize("<*font_fr>"),
  hi = localize("<*font_hi>"),
  it = localize("<*font_it>"),
  ka = localize("<*font_ka>"),
  kr = localize("<*font_kr>"),
  pl = localize("<*font_pl>"),
  tr = localize("<*font_tr>"),
  nl = localize("<*font_nl>"),
  sr = localize("<*font_sr>"),
  hu = localize("<*font_hu>"),
  tw = localize("<*font_tw>"),
  hr = localize("<*font_hr>"),
  ja = localize("<*font_ja>"),
  th = localize("<*font_th>"),
  fa = localize("<*font_fa>"),
  unk = localize("<*font_unk>")
}

function updateNotificationsList()
  local nodes = interface.nodes
  for i = #notificationsListStrings, 1, -1 do
    local pos = #notificationsListLog + i - #notificationsListStrings
    if 1 <= pos then
      nodes[notificationsListStrings[i][1]].visible = true
      local notification = notificationsListLog[pos]
      local player = notification[1]
      local w = nodes[notificationsListStrings[i][2]].widget
      w.text = notification[2]
      w.font_textColor_value = notification[3]
      local w = nodes[notificationsListStrings[i][3]].widget
      w.text = player[1]
      w.fontName = player[4]
      w.font_textColor_value = player[2]
      w.font_strokeColor_value = player[3]
    else
      nodes[notificationsListStrings[i][1]].visible = false
    end
  end
end
