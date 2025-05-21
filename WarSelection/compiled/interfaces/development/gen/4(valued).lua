local value = getParameter("value")
local researchState = root.session_gameplay_gameplay_faction[root.session_visual_currentFaction].researchState
for i = researchState.size, 146 do
  researchState.f_create()
end
researchState[3].quantity = 0
researchState[4].quantity = 0
researchState[1].quantity = 0
researchState[2].quantity = 0
researchState[5].quantity = 0
researchState[6].quantity = 0
researchState[7].quantity = 0
researchState[8].quantity = 0
researchState[15].quantity = 0
researchState[16].quantity = 0
researchState[17].quantity = 0
researchState[9].quantity = 0
researchState[59].quantity = 0
researchState[61].quantity = 0
researchState[62].quantity = 0
researchState[63].quantity = 0
researchState[64].quantity = 0
researchState[65].quantity = 0
researchState[66].quantity = 0
researchState[67].quantity = 0
researchState[68].quantity = 0
researchState[69].quantity = 0
researchState[70].quantity = 0
researchState[71].quantity = 0
researchState[72].quantity = 0
researchState[73].quantity = 0
researchState[93].quantity = 0
researchState[114].quantity = 0
researchState[115].quantity = 0
researchState[116].quantity = 0
researchState[118].quantity = 0
researchState[121].quantity = 0
researchState[125].quantity = 0
researchState[126].quantity = 0
researchState[131].quantity = 0
researchState[135].quantity = 0
researchState[136].quantity = 0
researchState[145].quantity = 0
researchState[146].quantity = 0
if value == 0 then
elseif value == 1 then
  researchState[3].quantity = 1
elseif value == 2 then
  researchState[4].quantity = 1
elseif value == 3 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
elseif value == 4 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
elseif value == 5 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
elseif value == 6 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[6].quantity = 1
elseif value == 7 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
elseif value == 8 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
elseif value == 9 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
elseif value == 10 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[6].quantity = 1
  researchState[9].quantity = 1
elseif value == 11 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
  researchState[16].quantity = 1
elseif value == 12 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
elseif value == 13 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[59].quantity = 1
elseif value == 14 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[59].quantity = 1
  researchState[93].quantity = 1
elseif value == 15 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[64].quantity = 1
elseif value == 16 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[64].quantity = 1
  researchState[114].quantity = 1
elseif value == 17 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
  researchState[16].quantity = 1
  researchState[68].quantity = 1
elseif value == 18 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
  researchState[16].quantity = 1
  researchState[68].quantity = 1
  researchState[115].quantity = 1
elseif value == 19 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
  researchState[16].quantity = 1
  researchState[67].quantity = 1
elseif value == 20 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
  researchState[16].quantity = 1
  researchState[67].quantity = 1
  researchState[116].quantity = 1
elseif value == 21 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[63].quantity = 1
elseif value == 22 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[63].quantity = 1
  researchState[118].quantity = 1
elseif value == 23 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[6].quantity = 1
  researchState[9].quantity = 1
  researchState[65].quantity = 1
elseif value == 24 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[6].quantity = 1
  researchState[9].quantity = 1
  researchState[65].quantity = 1
  researchState[121].quantity = 1
elseif value == 25 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[62].quantity = 1
elseif value == 26 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[62].quantity = 1
  researchState[125].quantity = 1
elseif value == 27 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[70].quantity = 1
elseif value == 28 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[70].quantity = 1
  researchState[126].quantity = 1
elseif value == 29 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[73].quantity = 1
elseif value == 30 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[73].quantity = 1
  researchState[131].quantity = 1
elseif value == 31 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[6].quantity = 1
  researchState[9].quantity = 1
  researchState[72].quantity = 1
elseif value == 32 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[6].quantity = 1
  researchState[9].quantity = 1
  researchState[72].quantity = 1
  researchState[135].quantity = 1
elseif value == 33 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[61].quantity = 1
elseif value == 34 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[61].quantity = 1
  researchState[136].quantity = 1
elseif value == 35 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[8].quantity = 1
  researchState[17].quantity = 1
  researchState[69].quantity = 1
elseif value == 36 then
  researchState[4].quantity = 1
  researchState[2].quantity = 1
  researchState[7].quantity = 1
  researchState[16].quantity = 1
  researchState[69].quantity = 1
  researchState[145].quantity = 1
elseif value == 37 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[71].quantity = 1
elseif value == 38 then
  researchState[3].quantity = 1
  researchState[1].quantity = 1
  researchState[5].quantity = 1
  researchState[15].quantity = 1
  researchState[71].quantity = 1
  researchState[146].quantity = 1
else
  log(value)
  assert(false)
end
