local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(getParameter("interfaceName"))
end
addTaskHotKey = 28
addSelectionHotKey = 0
addWorkMassHotKey1 = 84
addWorkMassHotKey2 = 102
removeWorkMassHotKey = 102
strEventIdleWorkers1 = localize("<*eventIdleWorkers/0>")
strEventIdleWorkers2 = localize("<*eventIdleWorkers/1>")
lastTickUpdate = 0
predictionsPeriod = 5000
timeLineUpdatePeriod = 30000
diagUpdatePeriod = timeLineUpdatePeriod
strTimeH0 = localize("<*timerHour/0>")
strTimeH1 = localize("<*timerHour/1>")
strTimeH2 = localize("<*timerHour/2>")
strTimeD0 = localize("<*timerDay/0>")
strTimeD1 = localize("<*timerDay/1>")
strTimeD2 = localize("<*timerDay/2>")
strTimeD3 = localize("<*timerDay/3>")
strTimeL0 = localize("<*timerLong/0>")
strTimeL1 = localize("<*timerLong/1>")
strTimeL2 = localize("<*timerLong/2>")
teamsColors = {
  {4278255360, 4278190080},
  {4278255615, 4278190080},
  {4278190335, 4278190080}
}
factionColorsBase = {
  {4286545791, 4280821800},
  {4292532954, 4280821800},
  {4278190335, 4278190080},
  {4282384319, 4280821800},
  {4294950656, 4280821800},
  {4278239231, 4280821800},
  {4286513343, 4280821800},
  {4294901887, 4280821800},
  {4290772736, 4278190080},
  {4278255615, 4278190080},
  {4286513407, 4280821800},
  {4286513152, 4284303427},
  {4286562175, 4280821800},
  {4294934272, 4282400833},
  {4278222847, 4280821800},
  {4290707647, 4278190080},
  {4278239039, 4280821800},
  {4286562239, 4280821800},
  {4286562303, 4280821800},
  {4278190207, 4278190138},
  {4284887859, 4284744192},
  {4278255423, 4278190080},
  {4286578687, 4278190080},
  {4286529535, 4280821800},
  {4294934399, 4280821800},
  {4282367871, 4280821800},
  {4278222783, 4280821800},
  {4294902015, 4280821800},
  {4294950847, 4280821800},
  {4286578559, 4280821800},
  {4290772991, 4280821800},
  {4290740223, 4280821800},
  {4290723647, 4280821800},
  {4286578655, 4280821800},
  {4290756607, 4280821800},
  {4294934527, 4280821800},
  {4290740031, 4282400833},
  {4282351423, 4280821793},
  {4286545919, 4280821800},
  {4294901951, 4282400833},
  {4294950783, 4280821800},
  {4278222592, 4278190080},
  {4286545855, 4280821800},
  {4290707583, 4278190080},
  {4294967231, 4280821800},
  {4278239167, 4280821800},
  {4282335167, 4281545523},
  {4282318911, 4286644353},
  {4290756352, 4280821800},
  {4278190271, 4280821793},
  {4294950911, 4280821800},
  {4286562048, 4280821800},
  {4282335103, 4280821800},
  {4290756479, 4280821800},
  {4278222719, 4282400833},
  {4278190143, 4278190207},
  {4290740159, 4280821800},
  {4290772927, 4280821800},
  {4286529407, 4281545523},
  {4294967040, 4280821800},
  {4290772863, 4280821800},
  {4286545664, 4282400833},
  {4286513279, 4283301966},
  {4289921024, 4282400833},
  {4290756543, 4280821800}
}
workButtonBlocks = {
  153,
  156,
  159,
  162,
  406,
  165,
  45,
  223,
  249,
  458,
  384
}
workButtons = {
  153,
  156,
  159,
  162,
  406,
  165,
  45,
  223,
  249,
  458,
  61
}
workReservePanels = {
  333,
  334,
  335,
  336,
  381,
  337,
  338,
  326,
  332,
  454,
  nil
}
workReserveNumbers = {
  339,
  340,
  341,
  342,
  404,
  343,
  344,
  345,
  346,
  455,
  nil
}
workUnavailableIcon = {
  251,
  266,
  267,
  268,
  353,
  269,
  270,
  271,
  272,
  413,
  nil
}
workReserveProgress = {
  953,
  954,
  955,
  956,
  371,
  957,
  958,
  959,
  960,
  414,
  nil
}
workQueueButtons = {
  169,
  240,
  173,
  172,
  171
}
workQueueNumbers = {
  26,
  28,
  29,
  66,
  67
}
storageBoxes = {
  411,
  238,
  258,
  259,
  409,
  410
}
playersListNames = {
  1219,
  1220,
  1221,
  1222,
  1223,
  1224,
  1225,
  1226,
  1227,
  1228,
  1229,
  1230,
  1231,
  1232,
  1233,
  1234,
  1235,
  1236,
  1237,
  1238,
  1185,
  1186,
  1187,
  1188,
  1189,
  1190,
  1191,
  1192,
  1193,
  1194,
  1195,
  1196,
  1197,
  1198,
  1199,
  1200,
  1201,
  1202,
  1203,
  1204
}
playersListStatus = {
  1183,
  1182,
  1181,
  1180,
  1179,
  1178,
  1177,
  1176,
  1175,
  1174,
  1173,
  1172,
  1171,
  1170,
  1169,
  1168,
  1167,
  1166,
  1165,
  1164,
  1287,
  1288,
  1289,
  1290,
  1291,
  1292,
  1293,
  1294,
  1295,
  1296,
  1297,
  1298,
  1299,
  1300,
  1301,
  1302,
  1303,
  1304,
  1305,
  1306
}
playersComplaintButton = {
  1518,
  1519,
  1520,
  1521,
  1522,
  1523,
  1524,
  1525,
  1526,
  1527,
  1528,
  1529,
  1530,
  1531,
  1532,
  1533,
  1534,
  1535,
  1536,
  1537,
  1538,
  1539,
  1540,
  1541,
  1542,
  1543,
  1544,
  1545,
  1546,
  1547,
  1548,
  1549,
  1550,
  1551,
  1552,
  1553,
  1554,
  1555,
  1556,
  1557
}
teamBlocks = {
  1307,
  1308,
  1309,
  1310,
  1311,
  1312,
  1313,
  1314,
  1315,
  1316,
  1317,
  1318,
  16,
  27,
  30,
  31
}
destroyListWidgets = {
  1153,
  1154,
  1155,
  1156,
  1157,
  1158,
  681
}
transformationButton = {
  648,
  649,
  650,
  294,
  376
}
transformationNumber = {
  660,
  661,
  662,
  293,
  347
}
culturesAbilities = {
  [9] = 5,
  [10] = 6,
  [11] = 7,
  [12] = 8,
  [13] = 9,
  [14] = 10,
  [15] = 11,
  [16] = 12,
  [17] = 13,
  [18] = 14,
  [19] = 26,
  [21] = 30
}
unitNations = {
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  0,
  0,
  0,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  0,
  2,
  2,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  3,
  2,
  2,
  2,
  3,
  3,
  3,
  3,
  3,
  3,
  0,
  3,
  3,
  3,
  3,
  2,
  4,
  5,
  0,
  2,
  4,
  5,
  4,
  5,
  4,
  5,
  0,
  0,
  3,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  2,
  5,
  2,
  5,
  5,
  2,
  2,
  2,
  6,
  7,
  6,
  7,
  6,
  7,
  6,
  7,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  2,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  0,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  2,
  2,
  7,
  6,
  6,
  6,
  6,
  6,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  7,
  8,
  8,
  8,
  8,
  8,
  2,
  2,
  2,
  2,
  3,
  3,
  3,
  3,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  2,
  3,
  1,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  2,
  3,
  4,
  4,
  4,
  4,
  4,
  5,
  5,
  5,
  5,
  5,
  6,
  6,
  6,
  6,
  6,
  7,
  7,
  7,
  7,
  7,
  5,
  8,
  6,
  8,
  4,
  5,
  6,
  7,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  6,
  8,
  20,
  8,
  8,
  9,
  9,
  9,
  8,
  9,
  9,
  9,
  9,
  9,
  9,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  11,
  11,
  11,
  20,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  8,
  8,
  8,
  12,
  12,
  12,
  12,
  8,
  13,
  13,
  13,
  8,
  13,
  13,
  13,
  13,
  13,
  13,
  0,
  13,
  13,
  8,
  8,
  1,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  12,
  9,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  14,
  20,
  14,
  14,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  15,
  9,
  12,
  20,
  16,
  16,
  16,
  16,
  16,
  16,
  8,
  8,
  16,
  16,
  16,
  16,
  8,
  3,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  17,
  20,
  20,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  18,
  20,
  1,
  1,
  20,
  8,
  12,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  19,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  20,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  21,
  16,
  21,
  21,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil
}
weaponBlock = {
  427,
  468,
  470,
  495
}
weaponDamageValue = {
  260,
  448,
  475,
  499
}
weaponDamageType = {
  428,
  418,
  503,
  539
}
weaponAdvancedInfo = {
  429,
  449,
  476,
  500
}
weaponRechargeTime = {
  431,
  450,
  480,
  504
}
weaponSpread = {
  {730, 435},
  {733, 451},
  {777, 481},
  {785, 505}
}
weaponDistance = {
  434,
  452,
  482,
  506
}
weaponAAD = {
  486,
  485,
  477,
  474
}
weaponWater = {
  492,
  550,
  556,
  557
}
weaponUnderwater = {
  593,
  601,
  605,
  611
}
weaponBuilding = {
  {645, 630},
  {646, 698},
  {647, 693},
  {651, 695}
}
weaponMainBuilding = {
  356,
  357,
  358,
  359
}
weaponDisassemblable = {
  666,
  667,
  668,
  684
}
weaponTypedDamage = {
  {
    {
      439,
      437,
      438
    },
    {
      440,
      442,
      443
    }
  },
  {
    {
      461,
      493,
      487
    },
    {
      462,
      494,
      488
    }
  },
  {
    {
      509,
      526,
      532
    },
    {
      510,
      527,
      533
    }
  },
  {
    {
      552,
      558,
      570
    },
    {
      553,
      559,
      571
    }
  }
}
hideResearchOnFinalAge = {
  [3] = 0,
  [4] = 0,
  [90] = 0,
  [91] = 0,
  [1] = 1,
  [2] = 1,
  [5] = 2,
  [6] = 2,
  [7] = 2,
  [8] = 2,
  [15] = 3,
  [9] = 3,
  [16] = 3,
  [17] = 3,
  [59] = 4,
  [61] = 4,
  [62] = 4,
  [63] = 4,
  [64] = 4,
  [65] = 4,
  [66] = 4,
  [67] = 4,
  [68] = 4,
  [69] = 4,
  [70] = 4,
  [71] = 4,
  [72] = 4,
  [73] = 4,
  [93] = 5
}
envNames = {
  [0] = localize("<*envName0>"),
  [1] = localize("<*envName1>"),
  [3] = localize("<*envNameTree>"),
  [4] = localize("<*envNameTree>"),
  [5] = localize("<*envNameTree>"),
  [6] = localize("<*envNameTree>"),
  [7] = localize("<*envNameTree>"),
  [8] = localize("<*envNameTree>"),
  [9] = localize("<*envNameTree>"),
  [10] = localize("<*envNameTree>"),
  [11] = localize("<*envNameTree>"),
  [12] = localize("<*envNameTree>"),
  [13] = localize("<*envNameTree>"),
  [14] = localize("<*envNameTree>"),
  [15] = localize("<*envNameTree>"),
  [16] = localize("<*envNameTree>"),
  [17] = localize("<*envNameTree>"),
  [18] = localize("<*envNameTree>"),
  [19] = localize("<*envNameTree>"),
  [20] = localize("<*envNameTree>"),
  [21] = localize("<*envNameTree>"),
  [22] = localize("<*envNameTree>"),
  [23] = localize("<*envNameTree>"),
  [24] = localize("<*envNameTree>"),
  [25] = localize("<*envNameTree>"),
  [26] = localize("<*envNameTree>"),
  [27] = localize("<*envNameTree>"),
  [28] = localize("<*envNameTree>"),
  [29] = localize("<*envNameTree>"),
  [30] = localize("<*envNameTree>"),
  [31] = localize("<*envNameTree>"),
  [32] = localize("<*envNameTree>"),
  [36] = localize("<*envName36>"),
  [37] = localize("<*envName37>"),
  [38] = localize("<*envName38>"),
  [39] = localize("<*envName39>"),
  [63] = localize("<*envNameTree>"),
  [64] = localize("<*envNameTree>"),
  [65] = localize("<*envNameTree>"),
  [66] = localize("<*envNameTree>"),
  [67] = localize("<*envNameTree>"),
  [68] = localize("<*envNameTree>"),
  [69] = localize("<*envNameMeat>"),
  [70] = localize("<*envNameMeat>"),
  [90] = localize("<*envName90>"),
  [103] = localize("<*envNameMeat>"),
  [274] = localize("<*envName274>"),
  [275] = localize("<*envName275>"),
  [276] = localize("<*envName276>"),
  [303] = localize("<*envNameTree>"),
  [323] = localize("<*envNameTree>"),
  [324] = localize("<*envNameTree>"),
  [325] = localize("<*envNameTree>"),
  [326] = localize("<*envNameTree>"),
  [327] = localize("<*envNameTree>"),
  [328] = localize("<*envNameTree>"),
  [329] = localize("<*envName1>"),
  [305] = localize("<*envName305>"),
  [87] = localize("<*envName87>"),
  [88] = localize("<*envName88>"),
  [89] = localize("<*envName89>"),
  [298] = localize("<*envNameMeat>")
}
unitTags = {
  localize("<*unitTag/0>"),
  localize("<*unitTag/1>"),
  localize("<*unitTag/2>"),
  localize("<*unitTag/3>"),
  localize("<*unitTag/4>"),
  localize("<*unitTag/5>"),
  localize("<*unitTag/6>"),
  localize("<*unitTag/7>"),
  localize("<*unitTag/8>"),
  localize("<*unitTag/9>"),
  localize("<*unitTag/10>"),
  localize("<*unitTag/11>"),
  localize("<*unitTag/12>"),
  localize("<*unitTag/13>"),
  localize("<*unitTag/14>"),
  localize("<*unitTag/15>"),
  localize("<*unitTag/16>"),
  localize("<*unitTag/17>"),
  localize("<*unitTag/18>"),
  localize("<*unitTag/19>"),
  localize("<*unitTag/20>"),
  localize("<*unitTag/21>"),
  localize("<*unitTag/22>"),
  localize("<*unitTag/23>")
}
ageNames = {
  localize("<*ageNames/0>"),
  localize("<*ageNames/1>"),
  localize("<*ageNames/2>"),
  localize("<*ageNames/3>"),
  localize("<*ageNames/4>"),
  localize("<*ageNames/5>"),
  localize("<*ageNames/6>"),
  localize("<*ageNames/7>")
}
workEnvCreateData = {
  ["nature.vegetation.grass.live.wheat"] = {
    90,
    localize("<*envWorkText90>")
  },
  ["nature.vegetation.grass.live.rice"] = {
    305,
    localize("<*envWorkText305>")
  }
}
nationNames = {
  localize("<*nationName0>"),
  localize("<*nationName1>"),
  localize("<*nationName2>"),
  localize("<*nationName3>"),
  localize("<*nationName4>"),
  localize("<*nationName5>"),
  localize("<*nationName6>"),
  localize("<*nationName7>"),
  localize("<*nationName8>"),
  localize("<*nationName9>"),
  localize("<*nationName10>"),
  localize("<*nationName11>"),
  localize("<*nationName12>"),
  {
    localize("<*nationName13/0>"),
    localize("<*nationName13/1>")
  },
  localize("<*nationName14>"),
  localize("<*nationName15>"),
  localize("<*nationName16>"),
  localize("<*nationName17>"),
  {
    localize("<*nationName18/0>"),
    localize("<*nationName18/1>")
  },
  {
    localize("<*nationName19/0>"),
    localize("<*nationName19/1>")
  },
  localize("<*nationName20>"),
  localize("<*nationName21>")
}
local gSes = root.session_gameplay
local gameplay = gSes.gameplay
researchNames = {}
researchTexts = {}
for i = 0, gameplay.researches_list_size + 10 do
  table.insert(researchNames, localize("<*upgrade" .. i .. "/0>"))
  table.insert(researchTexts, localize("<*upgrade" .. i .. "/1>"))
end
unitNames = {}
unitTexts = {}
for i = 0, gameplay.unitType_size + 10 do
  table.insert(unitNames, localize("<*unitName" .. i .. ">"))
  table.insert(unitTexts, localize("<*unitText" .. i .. ">"))
end
envResource = {
  [0] = 0,
  [1] = 0,
  [3] = 1,
  [4] = 1,
  [5] = 1,
  [6] = 1,
  [7] = 1,
  [8] = 1,
  [9] = 1,
  [10] = 1,
  [11] = 1,
  [12] = 1,
  [13] = 1,
  [14] = 1,
  [15] = 1,
  [16] = 1,
  [17] = 1,
  [18] = 1,
  [19] = 1,
  [20] = 1,
  [21] = 1,
  [22] = 1,
  [23] = 1,
  [24] = 1,
  [25] = 1,
  [26] = 1,
  [27] = 1,
  [28] = 1,
  [29] = 1,
  [30] = 1,
  [31] = 1,
  [32] = 1,
  [36] = 0,
  [37] = 2,
  [38] = 1,
  [39] = 2,
  [63] = 1,
  [64] = 1,
  [65] = 1,
  [66] = 1,
  [67] = 1,
  [68] = 1,
  [69] = 0,
  [70] = 0,
  [90] = 0,
  [103] = 0,
  [298] = 0,
  [274] = 2,
  [275] = 1,
  [276] = 2,
  [303] = 1,
  [305] = 0,
  [323] = 1,
  [324] = 1,
  [325] = 1,
  [326] = 1,
  [327] = 1,
  [328] = 1,
  [329] = 0
}
envIcons = {
  [298] = 0,
  [0] = 0,
  [1] = 0,
  [329] = 0,
  [3] = 0,
  [4] = 0,
  [5] = 0,
  [6] = 0,
  [7] = 0,
  [8] = 0,
  [9] = 0,
  [10] = 0,
  [11] = 0,
  [12] = 0,
  [13] = 0,
  [14] = 0,
  [15] = 0,
  [16] = 0,
  [17] = 0,
  [18] = 0,
  [19] = 0,
  [20] = 0,
  [21] = 0,
  [22] = 0,
  [23] = 0,
  [24] = 0,
  [25] = 0,
  [26] = 0,
  [27] = 0,
  [28] = 0,
  [29] = 0,
  [30] = 0,
  [31] = 0,
  [32] = 0,
  [36] = 0,
  [37] = 0,
  [274] = 0,
  [38] = 0,
  [275] = 0,
  [39] = 0,
  [276] = 0,
  [63] = 0,
  [64] = 0,
  [65] = 0,
  [66] = 0,
  [67] = 0,
  [68] = 0,
  [69] = 0,
  [70] = 0,
  [90] = 0,
  [103] = 0,
  [303] = 0,
  [305] = 0,
  [323] = 0,
  [324] = 0,
  [325] = 0,
  [326] = 0,
  [327] = 0,
  [328] = 0
}

function findImage(images, name)
  local id = images.f_find(name)
  if id == nil then
    log("Can't find image for '" .. name .. "'")
    return nil
  end
  if images[id] == nil then
    log("interface." .. interfaceId .. ".content.image: No image with id=" .. id .. " (name=" .. name .. ")")
  end
  return id
end

images = interface.content_image
for envId, data in pairs(envIcons) do
  envIcons[envId] = findImage(images, "env" .. envId .. ".png")
end
unitsWorkIconText = {
  [54] = {
    [0] = {
      envIcons[90],
      localize("<*unitOptionGrowWheat/0>"),
      localize("<*unitOptionGrowWheat/1>")
    }
  },
  [70] = {
    [0] = {
      envIcons[90],
      localize("<*unitOptionGrowWheat/0>"),
      localize("<*unitOptionGrowWheat/1>")
    }
  },
  [95] = {
    [0] = {
      envIcons[90],
      localize("<*unitOptionGrowWheat/0>"),
      localize("<*unitOptionGrowWheat/1>")
    }
  },
  [193] = {
    [0] = {
      envIcons[90],
      localize("<*unitOptionGrowWheat/0>"),
      localize("<*unitOptionGrowWheat/1>")
    }
  },
  [339] = {
    [0] = {
      envIcons[305],
      localize("<*unitOptionGrowRice/0>"),
      localize("<*unitOptionGrowRice/1>")
    }
  },
  [412] = {
    [0] = {
      envIcons[90],
      localize("<*unitOptionGrowWheat/0>"),
      localize("<*unitOptionGrowWheat/1>")
    }
  }
}
resourceIcons = {
  579,
  580,
  584,
  582,
  581
}
researchIcons = {}
local rs = gameplay.researches_list
for i = 1, rs.size do
  researchIcons[i] = findImage(images, "upgrade" .. i - 1 .. ".png")
end
unitIcons = {}
local ut = gameplay.unitType
for i = 1, ut.size do
  unitIcons[i] = findImage(images, "unit" .. i - 1 .. ".png")
end
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
unitsExtraData = {}
local ut = root.session_visual_unitType
for unitTypeId = 0, ut.size - 1 do
  local j = fromJson(ut[unitTypeId].externalData)
  if j ~= nil then
    unitsExtraData[unitTypeId] = j
    local ue = unitsExtraData[unitTypeId]
    if ue ~= nil and ue.customAbility ~= nil then
      for _, ca in pairs(ue.customAbility) do
        ca[2] = localize(ca[2])
        ca[3] = localize(ca[3])
        ca[4] = findImage(images, ca[4])
      end
    end
  end
end

function deepCopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == "table" then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepCopy(orig_key)] = deepCopy(orig_value)
    end
    setmetatable(copy, deepCopy(getmetatable(orig)))
  else
    copy = orig
  end
  return copy
end

function getPlayerFaction(player)
  local facs = root.session_gameplay_gameplay_player[player].controlledFactions
  for facId = 0, 63 do
    if facs[facId] then
      return facId
    end
  end
end

function getFactionColor(factionId)
  return factionColors[factionId + 1]
end

function getPlayerColor(playerId)
  return playersColors[playerId + 1]
end

function updateFactionsColors()
  local myFaction = root.session_visual_currentFaction
  local myPlayer = getPlayerOfFaction(myFaction)
  local factions = root.session_visual_faction
  local gameplay = root.session_gameplay_gameplay
  local relations = gameplay.scene[0].relation
  local players = gameplay.player
  local myFacs = players[myPlayer].controlledFactions
  local allFactionsUnderControl = 0
  for playerId = 0, players.size - 1 do
    allFactionsUnderControl = allFactionsUnderControl | players[playerId].controlledFactions_value
  end
  for factionId = 0, factions.size - 1 do
    local underControl = allFactionsUnderControl >> factionId & 1 == 1
    local color
    if factionColorsByTeams and underControl then
      if myFacs[factionId] then
        color = teamsColors[1]
      else
        local rel = getRelation(relations, myFaction, factionId)
        color = teamsColors[rel + 1]
      end
    else
      color = factionColorsBase[factionId + 1]
    end
    factionColors[factionId + 1][1] = color[1]
    factionColors[factionId + 1][2] = color[2]
    local minimapColor = factions[factionId].minimapColor
    local a = minimapColor.a
    minimapColor.value = color[1]
    minimapColor.a = a
    factions[factionId].minimapBorderColor_value = color[2]
  end
  for playerId = 0, root.session_gameplay_gameplay_player_size - 1 do
    playersColors[playerId + 1] = deepCopy(factionColors[getPlayerFaction(playerId) + 1])
  end
  root.interface.f_sendEvent("factionsColors", toJson(factionColors))
  reinitPlayersList(true)
end

function toBool(v)
  if type(v) == "number" then
    return v ~= 0
  end
  if type(v) == "string" then
    if v == "true" then
      return true
    end
    local n = tonumber(v)
    return n ~= nil and n ~= 0
  end
  return false
end

function getEnvName(envTypes, envType)
  local nm = envNames[envType]
  if nm == nil then
    return envTypes[envType].createTag
  else
    return nm
  end
end

function outCostDigit(showNode, digitNode, initCost, fullCost, hasRes, divider)
  showNode.visible = 0 < fullCost
  local w = digitNode.widget
  w.text = fullCost // divider
  if fullCost <= hasRes then
    w.font_textColor_value = 4294967295
  elseif initCost <= hasRes then
    w.font_textColor_value = 4278255615
  else
    w.font_textColor_value = 4278190335
  end
end

function getNationName(id, firstPeriod)
  if id >= #nationNames then
    return "---"
  end
  local result = nationNames[id + 1]
  if #result == 2 then
    if firstPeriod then
      return result[1]
    else
      return result[2]
    end
  else
    return result
  end
end

function getUnitNationName(unitTypeId, firstPeriod)
  local nationId = unitNations[unitTypeId + 1]
  if nationId == nil then
    return ""
  end
  return getNationName(nationId, firstPeriod)
end

function updateMassTransformationWindowInfo(nodes, myFaction, statistics, firstPeriod)
  local unitTypeId, workId
  local num = 1
  local gameplay = root.session_gameplay_gameplay
  if massUpdateMass then
    if massUpdateId == nil then
      return
    end
    if massUpdateId > #massUpdate then
      nodes[328].visible = false
      massUpdateId = nil
      return
    end
    local data = massUpdate[massUpdateId]
    unitTypeId = data[1]
    workId = data[2]
    local liveConstructed = statistics.f_liveConstructed(unitTypeId)
    local underTransformation = statistics.f_underTransformation(unitTypeId)
    num = liveConstructed - underTransformation
    nodes[548].widget_text = localize("<*upgradeUnit/1>")
  else
    nodes[548].widget_text = localize("<*upgradeUnit/0>")
    local state = workButtonsState[11]
    if not state.show or currentSelectionUnitType == nil then
      nodes[328].visible = false
      massUpdateId = nil
      return
    end
    local sel = currentSelectionUnitTypes[currentSelectionUnitType]
    unitTypeId = sel[1]
    assert(unitTypeId ~= nil)
    workId = state.workId
    sel[2] = sel[2] - currentSelectionUnderTransformation
    num = sel[2]
  end
  local fromUnit = gameplay.unitType[unitTypeId]
  if fromUnit == nil then
    return
  end
  local work = fromUnit.ability_work[workId]
  if work == nil then
    return
  end
  local ability = fromUnit.ability_ability[work.ability]
  assert(ability.type == 2)
  local nextUnitId = ability.data_unit
  local nextUnit = gameplay.unitType[nextUnitId]
  nodes[573].widget_text = unitNames[unitTypeId + 1]
  nodes[756].widget_middle_set_normal = unitIcons[unitTypeId + 1]
  nodes[594].widget_text = getUnitNationName(unitTypeId, firstPeriod)
  nodes[80].visible = 1 < num
  nodes[80].widget_text = num
  nodes[578].widget_text = unitNames[nextUnitId + 1]
  nodes[711].widget_middle_set_normal = unitIcons[nextUnitId + 1]
  nodes[709].widget_text = getUnitNationName(nextUnitId, firstPeriod)
  nodes[125].visible = 1 < num
  nodes[125].widget_text = num
  nodes[547].widget_text = work.makeTime // 1000
  local supply1 = 0
  if nextUnit.supplyOn then
    supply1 = nextUnit.supply_cost
  end
  local supply2 = 0
  if fromUnit.supplyOn then
    supply2 = fromUnit.supply_cost
  end
  local supply = supply1 - supply2
  if 0 < supply then
    nodes[349].visible = true
    nodes[536].widget_text = supply * num // 10
  else
    nodes[349].visible = false
  end
  if 0 < ability.requirements_unit_size then
    nodes[127].visible = true
    nodes[228].widget_text = getListOfRequiredUnits(ability.requirements_unit, ability.requirements_unitsAll)
  else
    nodes[127].visible = false
  end
  local costOrder = work.costOrder
  local costStart = work.costStart
  local costProcess = work.costProcess
  local i0 = costOrder[0] + costStart[0] + costProcess[0]
  local i1 = costOrder[1] + costStart[1] + costProcess[1]
  local i2 = costOrder[2] + costStart[2] + costProcess[2]
  local i3 = costOrder[3] + costStart[3] + costProcess[3]
  local i4 = costOrder[4] + costStart[4] + costProcess[4]
  local curFacId = root.session_visual_currentFaction
  local sFaction = gameplay.scene[0].faction[curFacId]
  local resources = sFaction.treasury_resources
  local r0 = resources[0]
  local r1 = resources[1]
  local r2 = resources[2]
  local r3 = resources[3]
  local r4 = resources[4]
  outCostDigit(nodes[350], nodes[530], i0, i0 * num, r0, 1000)
  outCostDigit(nodes[351], nodes[457], i1, i1 * num, r1, 1000)
  outCostDigit(nodes[352], nodes[383], i2, i2 * num, r2, 1000)
  outCostDigit(nodes[288], nodes[291], i3, i3 * num, r3, 1000)
  outCostDigit(nodes[278], nodes[287], i4, i4 * num, r4, 1000)
  nodes[296].visible = 0 < i3 or 0 < i4
end

function getUnitWorkIconText(unitTypeId, workId)
  local workIconText = unitsWorkIconText[unitTypeId]
  if workIconText == nil then
    return nil
  end
  return workIconText[workId]
end

function isResearchReadyForStart(researchesState, researchId)
  local size = researchesState.size
  if researchId >= size then
    return true
  end
  local researchState = researchesState[researchId]
  local quantityLimit = root.session_gameplay_gameplay_researches_list[researchId].quantity
  return not researchState.inProcess and quantityLimit > researchState.quantity
end

function isResearchCompleteF(researchesState, researchId)
  if researchId >= researchesState.size then
    return false
  end
  local researchState = researchesState[researchId]
  return researchState.quantity > 0
end

function isResearchComplete(faction, research)
  local factions = root.session_gameplay_gameplay_faction
  local researchesState = factions[faction].researchState
  return isResearchCompleteF(researchesState, research)
end

function haveRequiredUnit(requirement, statistics, noMax)
  local live = statistics.f_liveConstructed(requirement.type)
  return live >= requirement.min and (noMax or live <= requirement.max)
end

function haveRequiredUnitsAny(requirements, statistics)
  local sz = requirements.size
  for i = 1, sz do
    if haveRequiredUnit(requirements[i - 1], statistics, 5 <= sz) then
      return true
    end
  end
  return false
end

function haveRequiredUnitsAll(requirements, statistics)
  local sz = requirements.size
  for i = 1, sz do
    if not haveRequiredUnit(requirements[i - 1], statistics, 5 <= sz) then
      return false
    end
  end
  return true
end

function haveRequiredUnits(requirements, all, statistics)
  if all then
    return haveRequiredUnitsAll(requirements, statistics)
  else
    return haveRequiredUnitsAny(requirements, statistics)
  end
end

function haveRequiredResearchesAny(requirements, researchState)
  local sz = requirements.size
  if sz == 0 then
    return true
  end
  for i = 1, sz do
    local o = requirements[i - 1]
    if isResearchCompleteF(researchState, o.id) then
      return true
    end
  end
  return false
end

function haveRequiredResearchesAll(requirements, researchState)
  local sz = requirements.size
  for i = 1, sz do
    local o = requirements[i - 1]
    if not isResearchCompleteF(researchState, o.id) then
      return false
    end
  end
  return true
end

function haveRequiredResearches(requirements, all, researchState)
  if all then
    return haveRequiredResearchesAll(requirements, researchState)
  else
    return haveRequiredResearchesAny(requirements, researchState)
  end
end

function haveRequiredAll(requirements, statistics, researchState)
  return haveRequiredResearches(requirements.research, requirements.researchesAll, researchState) and haveRequiredUnits(requirements.unit, requirements.unitsAll, statistics)
end

function getCustomAbilityName(parameters)
  local abilityStart = string.find(parameters, "ability=")
  local ability = ""
  if abilityStart then
    local valueStart = abilityStart + 8
    local valueEnd = string.find(parameters, ",", valueStart)
    if valueEnd then
      ability = string.sub(parameters, valueStart, valueEnd - 1)
    else
      ability = string.sub(parameters, valueStart)
    end
  end
  return ability
end

function showWorkButton(nodes, myFaction, statistics, reserve, reserveProgress, unitTypeId, unitType, buttonId, workId, finalAge)
  local show = false
  local disabled = true
  local continue = true
  if workId < unitType.ability_work_size then
    local work = unitType.ability_work[workId]
    local ability = unitType.ability_ability[work.ability]
    local requirements = ability.requirements
    local hasReserve = work.reserveLimit > 0
    local id = workReservePanels[buttonId]
    if id ~= nil then
      nodes[id].visible = hasReserve
      if hasReserve then
        workReserveNumber = workReserveNumbers[buttonId]
        nodes[workReserveNumber].widget_text = reserve
      end
    end
    local enabledE = work.enabled
    local enabledR = haveRequiredResearches(requirements.research, requirements.researchesAll, myFaction.researchState)
    local enabledU = haveRequiredUnits(requirements.unit, requirements.unitsAll, statistics)
    local enabledSum = enabledE and enabledR and enabledU
    local id = workReserveProgress[buttonId]
    if id ~= nil then
      local node = nodes[id]
      if hasReserve and reserve == 0 and enabledSum then
        node.widget_current = reserveProgress * 100 // work.reserveTime
        node.visible = true
      else
        node.visible = false
      end
    end
    local available = true
    local normalIcon, disabledIcon
    local abilityType = ability.type
    if abilityType == 0 then
      workObject = ability.data_unit
      show = enabledR
      continue = not enabledSum
      normalIcon = unitIcons[workObject + 1]
      disabledIcon = unitIcons[workObject + 1]
    elseif abilityType == 1 then
      workObject = ability.data_research
      continue = not enabledR
      if isResearchReadyForStart(myFaction.researchState, workObject) then
        show = enabledR
        if show then
          local h = hideResearchOnFinalAge[workObject]
          if h ~= nil then
            show = finalAge > h
          end
        end
        available = not myFaction.researchesUnavailable[workObject]
        local icon = researchIcons[workObject + 1]
        normalIcon = icon
        disabledIcon = icon
      end
    elseif abilityType == 2 then
      workObject = ability.data_unit
      show = enabledE and enabledR
      continue = not show
      normalIcon = unitIcons[workObject + 1]
      disabledIcon = unitIcons[workObject + 1]
    elseif abilityType == 3 then
      workObject = ability.data_id
      continue = not enabledSum
      show = true
      normalIcon = 286
      disabledIcon = 286
    elseif abilityType == 7 then
      local vSession = root.session_visual
      local selectionList = vSession.scene[0].selection_units_list
      local selectionSize = selectionList.size
      local units = root.session_gameplay_gameplay_scene[0].units_list
      show = false
      for i = 0, selectionSize - 1 do
        local selUnit = selectionList[i]
        if selUnit ~= nil then
          local gUnit = units[selUnit]
          if gUnit ~= nil and gUnit.type == unitTypeId and gUnit.f_canDoCustomAbility() then
            show = true
            break
          end
        end
      end
      if show then
        local ue = unitsExtraData[unitTypeId]
        if ue ~= nil and ue.customAbility ~= nil then
          normalIcon = ue.customAbility[work.ability][4]
          disabledIcon = normalIcon
        end
      end
      continue = not enabledSum
    end
    disabled = not enabledSum or not available
    if show then
      local nodeButton = nodes[workButtonBlocks[buttonId]]
      nodeButton.visible = true
      local state = workButtonsState[buttonId]
      assert(state ~= nil)
      state.workId = workId
      state.show = true
      local set = nodes[workButtons[buttonId]].widget_middle_set
      set.normal = normalIcon
      set.disabled = disabledIcon
      nodeButton.disabled = disabled
      local id = workUnavailableIcon[buttonId]
      if id ~= nil then
        nodes[id].visible = not available
      end
      local iconText = getUnitWorkIconText(unitTypeId, workId)
      if iconText ~= nil then
        set.normal = iconText[1]
        set.disabled = iconText[1]
      end
    end
  end
  return {
    show,
    disabled,
    continue
  }
end

function forEachPlayerFaction(player, func)
  assert(player < 64)
  local facs = root.session_gameplay_gameplay_player[player].controlledFactions
  assert(facs ~= nil)
  for faction = 0, 63 do
    if facs[faction] then
      func(faction)
    end
  end
end

function showUnitTypeInfo()
  if currentSelectionUnitType == nil then
    return
  end
  local nodes = interface.nodes
  shownUnitTypeInfo = currentSelectionUnitTypes[currentSelectionUnitType][1]
  local unitType = root.session_gameplay_gameplay_unitTypeModified[currentSelectionUnitType]
  if unitType == nil then
    return
  end
  if unitType.movementOn then
    nodes[1072].visible = true
    nodes[1053].widget_text = unitType.movement_moveSpeed
  else
    nodes[1072].visible = false
  end
  if unitType.transportingOn then
    nodes[241].visible = true
    nodes[246].widget_text = unitType.transporting_volume
  else
    nodes[241].visible = false
  end
  if unitType.transportOn then
    nodes[675].visible = true
    nodes[653].widget_text = unitType.transport_volume
  else
    nodes[675].visible = false
  end
  if unitType.airplaneOn then
    local fuel = unitType.movement_airplane_fuel
    nodes[1405].visible = 0 < fuel
    if 0 < fuel then
      nodes[1404].widget_text = localize("<*timerSec/0>") .. fuel // 1000 .. localize("<*timerSec/1>")
    end
  else
    nodes[1405].visible = false
  end
  nodes[1009].visible = unitType.openFows[1]
  nodes[1029].visible = unitType.hiddenInFows[1]
  local sz = {
    0,
    0,
    0,
    0
  }
  local thickness = {
    0,
    0,
    0,
    0
  }
  if unitType.deathability_armor_type ~= 2 then
    sz[1] = 1
  else
    local armor = unitType.deathability_armor_data
    local armors = armor.size
    for i = 1, armors do
      local a = armor[i - 1]
      sz[i] = a.probability
      thickness[i] = a.object_thickness
    end
  end
  local szs = sz[1] + sz[2] + sz[3] + sz[4]
  if szs == 0 then
    szs = 1
  end
  local armorBarSize = 220 * interfaceScale
  local gsz0 = math.floor(armorBarSize * sz[1] / szs)
  local gsz1 = math.floor(armorBarSize * sz[2] / szs)
  local gsz2 = math.floor(armorBarSize * sz[3] / szs)
  local gsz3 = math.floor(armorBarSize * sz[4] / szs)
  local left0 = nodes[6].localLeft
  local left1 = left0 + gsz0
  local left2 = left1 + gsz1
  local left3 = left2 + gsz2
  
  function setSizeX(node, size)
    if size <= 0 then
      node.visible = false
    else
      node.visible = true
      node.sizeX = size
    end
  end
  
  setSizeX(nodes[6], gsz0)
  nodes[56].localLeft = left1
  setSizeX(nodes[56], gsz1)
  nodes[98].localLeft = left2
  setSizeX(nodes[98], gsz2)
  nodes[99].localLeft = left3
  setSizeX(nodes[99], gsz3)
  if gsz0 < 20 then
    left0 = left0 - (20 - gsz0)
    gsz0 = 20
  end
  nodes[261].widget_text = sz[1] * 100 // szs .. "%"
  nodes[261].localLeft = left0
  setSizeX(nodes[261], gsz0)
  nodes[362].widget_text = sz[2] * 100 // szs .. "%"
  nodes[362].localLeft = left1
  setSizeX(nodes[362], gsz1)
  nodes[363].widget_text = sz[3] * 100 // szs .. "%"
  nodes[363].localLeft = left2
  setSizeX(nodes[363], gsz2)
  nodes[364].widget_text = sz[4] * 100 // szs .. "%"
  nodes[364].localLeft = left3
  setSizeX(nodes[364], gsz3)
  nodes[388].widget_text = thickness[1] // 1000
  nodes[388].localLeft = left0
  setSizeX(nodes[388], gsz0)
  nodes[387].widget_text = thickness[2] // 1000
  nodes[387].localLeft = left1
  setSizeX(nodes[387], gsz1)
  nodes[366].widget_text = thickness[3] // 1000
  nodes[366].localLeft = left2
  setSizeX(nodes[366], gsz2)
  nodes[365].widget_text = thickness[4] // 1000
  nodes[365].localLeft = left3
  setSizeX(nodes[365], gsz3)
  local av = (sz[1] * thickness[1] + sz[2] * thickness[2] + sz[3] * thickness[3] + sz[4] * thickness[4]) // szs
  nodes[1391].widget_text = av // 1000 .. "." .. av // 100 % 10
  local weapons = {}
  if unitType.attackOn and shownUnitTypeInfo ~= 15 then
    local getDamageStr = function(damage, attacksPerAttack, weaponsCount)
      if damage == nil or damage == 0 then
        return "0"
      end
      local result = tostring(damage // 1000)
      if 1 < weaponsCount then
        result = result .. " x " .. weaponsCount
      end
      if 1 < attacksPerAttack then
        result = result .. " x " .. attacksPerAttack
      end
      return result
    end
    local addWeapon = function(weapon)
      for weaponId = 1, #weapons do
        local w = weapons[weaponId]
        local damages1 = weapon.damage.damages
        local damages2 = w.damage.damages
        local sameDamages = true
        for j = 1, 30 do
          sameDamages = sameDamages and damages1[j] == damages2[j]
        end
        if weapon.distanceMin == w.distanceMin and weapon.distanceMax == w.distanceMax and weapon.spread == w.spread and weapon.attacksPerPoint * weapon.attackPoints * weapon.damage.damagesCount == w.attacksCount and math.abs(weapon.rechargePeriod - w.rechargePeriod) < 500 and sameDamages then
          w.rechargePeriod = (w.rechargePeriod * w.count + weapon.rechargePeriod) / (1 + w.count)
          w.count = w.count + 1
          return
        end
      end
      if #weapons >= #weaponBlock then
        return
      end
      table.insert(weapons, {
        damage = weapon.damage,
        rechargePeriod = weapon.rechargePeriod,
        distanceMin = weapon.distanceMin,
        distanceMax = weapon.distanceMax,
        spread = weapon.spread,
        attacksCount = weapon.attacksPerPoint * weapon.attackPoints * weapon.damage.damagesCount,
        count = 1
      })
    end
    for i = 0, unitType.attack_weapon_size - 1 do
      addWeapon(unitType.attack_weapon[i])
    end
    for i = 0, unitType.attack_turret_size - 1 do
      local weapons_ = unitType.attack_turret[i].weapon
      for j = 0, weapons_.size - 1 do
        addWeapon(weapons_[j])
      end
    end
    for weaponId = 1, #weapons do
      local weapon = weapons[weaponId]
      nodes[weaponBlock[weaponId]].visible = true
      local damages = weapon.damage.damages
      local dmgMain = damages[0]
      local dmgBuilding = damages[2]
      local dmgMainBuilding = damages[5]
      local dmgDisassemblable = damages[8]
      local dmgLand = damages[15]
      local dmgFleet = damages[16]
      local dmgAad = damages[14]
      local dmgUnderwater = damages[20]
      local aad = dmgLand == 0 and dmgFleet == 0 and dmgUnderwater == 0 or dmgAad ~= nil and 0 < dmgAad
      local water = dmgLand == 0 and dmgAad == 0 and dmgUnderwater == 0 or dmgFleet ~= nil and 0 < dmgFleet and dmgMain == 0
      local underwater = dmgLand == 0 and dmgAad == 0 and dmgFleet == 0 or dmgUnderwater ~= nil and 0 < dmgUnderwater
      local building = dmgBuilding ~= nil and 0 < dmgBuilding
      nodes[weaponAAD[weaponId]].visible = aad
      nodes[weaponWater[weaponId]].visible = water
      nodes[weaponUnderwater[weaponId]].visible = underwater
      nodes[weaponMainBuilding[weaponId]].visible = dmgMainBuilding ~= nil and dmgMainBuilding == 0
      nodes[weaponDisassemblable[weaponId]].visible = dmgDisassemblable ~= nil and 0 < dmgDisassemblable
      nodes[weaponBuilding[weaponId][1]].visible = building
      if building then
        nodes[weaponBuilding[weaponId][2]].widget_text = getDamageStr(dmgBuilding, weapon.attacksCount, weapon.count)
      end
      if dmgAad ~= nil and 0 < dmgAad then
        dmgMain = dmgAad
      end
      nodes[weaponDamageValue[weaponId]].widget_text = getDamageStr(dmgMain, weapon.attacksCount, weapon.count)
      if weaponId > #weaponTypedDamage then
        return
      end
      local wtd = weaponTypedDamage[weaponId]
      local n = 0
      if not aad and not water and not underwater then
        for j = 1, 30 do
          local dmg = damages[j]
          if dmg ~= nil and j ~= 2 and j ~= 8 and ((j ~= 5 or 0 < dmg) and j ~= 14 and j ~= 17 and j ~= 20 or dmg ~= 0) then
            n = n + 1
            if n <= #wtd then
              local typedDamage = wtd[n]
              nodes[typedDamage[1]].visible = true
              nodes[typedDamage[2]].widget_text = unitTags[j]
              nodes[typedDamage[3]].widget_text = getDamageStr(dmg, weapon.attacksCount, weapon.count)
            end
          end
        end
      end
      for j = n + 1, 2 do
        local typedDamage = weaponTypedDamage[weaponId][j]
        nodes[typedDamage[1]].visible = false
      end
      nodes[weaponAdvancedInfo[weaponId]].visible = true
      local area = weapon.damage.area
      local widget = nodes[weaponDamageType[weaponId]].widget
      if area == 0 then
        widget.text = localize("<*damageArea/0>")
      elseif area == 1 then
        widget.text = localize("<*damageArea/1>")
      elseif area == 2 then
        widget.text = localize("<*damageArea/2>")
      end
      local rechargePeriod = math.floor(weapon.rechargePeriod)
      nodes[weaponRechargeTime[weaponId]].widget_text = rechargePeriod // 1000 .. "." .. rechargePeriod // 100 % 10
      local n = nodes[weaponSpread[weaponId][1]]
      if weapon.spread == 0 then
        n.visible = false
      else
        n.visible = true
        nodes[weaponSpread[weaponId][2]].widget_text = weapon.spread // 10 .. "%"
      end
      local w = nodes[weaponDistance[weaponId]].widget
      if weapon.distanceMin == 0 then
        w.text = weapon.distanceMax // 1000
      else
        w.text = weapon.distanceMin // 1000 .. " - " .. weapon.distanceMax // 1000
      end
    end
  end
  local parent = nodes[114]
  local widget = nodes[193]
  widget.visible = true
  widget.sizeY = math.floor((190 + #weapons * 103) * interfaceScale)
  widget.localLeft = parent.screenLeft - 10 - math.floor(250 * interfaceScale)
  widget.localTop = parent.screenTop - widget.sizeY - 10
  for i = #weapons + 1, #weaponBlock do
    nodes[weaponBlock[i]].visible = false
  end
end

function cameraToMinimap(x, y, minimapWidget)
  local nodes = interface.nodes
  local sz = root.session_visual_scene[0].landscape_size
  local n = nodes[minimapWidget]
  local lx = sz.x * (1 - x / n.sizeX)
  local ly = sz.y * (y / n.sizeY)
  root.session_visual_scene[0].f_cameraShowPosition(lx, ly)
end

function getAgeFactionIndustrial(researchesState, default)
  if isResearchCompleteF(researchesState, 93) then
    return {6, 8}
  end
  if isResearchCompleteF(researchesState, 59) then
    return {5, 8}
  end
  if isResearchCompleteF(researchesState, 114) then
    return {6, 9}
  end
  if isResearchCompleteF(researchesState, 64) then
    return {5, 9}
  end
  if isResearchCompleteF(researchesState, 115) then
    return {6, 10}
  end
  if isResearchCompleteF(researchesState, 68) then
    return {5, 10}
  end
  if isResearchCompleteF(researchesState, 116) then
    return {6, 11}
  end
  if isResearchCompleteF(researchesState, 67) then
    return {5, 11}
  end
  if isResearchCompleteF(researchesState, 118) then
    return {6, 12}
  end
  if isResearchCompleteF(researchesState, 63) then
    return {5, 12}
  end
  if isResearchCompleteF(researchesState, 121) then
    return {6, 13}
  end
  if isResearchCompleteF(researchesState, 65) then
    return {5, 13}
  end
  if isResearchCompleteF(researchesState, 125) then
    return {6, 14}
  end
  if isResearchCompleteF(researchesState, 62) then
    return {5, 14}
  end
  if isResearchCompleteF(researchesState, 126) then
    return {6, 15}
  end
  if isResearchCompleteF(researchesState, 70) then
    return {5, 15}
  end
  if isResearchCompleteF(researchesState, 131) then
    return {6, 16}
  end
  if isResearchCompleteF(researchesState, 73) then
    return {5, 16}
  end
  if isResearchCompleteF(researchesState, 135) then
    return {6, 17}
  end
  if isResearchCompleteF(researchesState, 72) then
    return {5, 17}
  end
  if isResearchCompleteF(researchesState, 136) then
    return {6, 18}
  end
  if isResearchCompleteF(researchesState, 61) then
    return {5, 18}
  end
  if isResearchCompleteF(researchesState, 145) then
    return {6, 19}
  end
  if isResearchCompleteF(researchesState, 69) then
    return {5, 19}
  end
  if isResearchCompleteF(researchesState, 146) then
    return {6, 20}
  end
  if isResearchCompleteF(researchesState, 71) then
    return {5, 20}
  end
  return {4, default}
end

function getAgeFaction(faction)
  local factions = root.session_gameplay_gameplay_faction
  local researchesState = factions[faction].researchState
  if isResearchCompleteF(researchesState, 3) then
    if not isResearchCompleteF(researchesState, 1) then
      return {1, 2}
    end
    if isResearchCompleteF(researchesState, 5) then
      if not isResearchCompleteF(researchesState, 15) then
        return {3, 4}
      end
      return getAgeFactionIndustrial(researchesState, 4)
    end
    if isResearchCompleteF(researchesState, 6) then
      if not isResearchCompleteF(researchesState, 9) then
        return {3, 5}
      end
      return getAgeFactionIndustrial(researchesState, 5)
    end
    return {2, 2}
  end
  if isResearchCompleteF(researchesState, 4) then
    if not isResearchCompleteF(researchesState, 2) then
      return {1, 3}
    end
    if isResearchCompleteF(researchesState, 7) then
      if not isResearchCompleteF(researchesState, 16) then
        return {3, 6}
      end
      return getAgeFactionIndustrial(researchesState, 6)
    end
    if isResearchCompleteF(researchesState, 8) then
      if not isResearchCompleteF(researchesState, 17) then
        return {3, 7}
      end
      return getAgeFactionIndustrial(researchesState, 7)
    end
    return {2, 3}
  end
  return {0, 1}
end

function setFlagColor(set, color)
  set.normalColor_value = color
  set.hoveredColor_value = color
  set.pressedColor_value = color
end

function toTimeStr(value)
  if value < 3600 then
    local min = value // 60
    local sec = value % 60
    return string.format(strTimeH0 .. "%u" .. strTimeH1 .. "%02d" .. strTimeH2, min, sec)
  end
  if value < 86400 then
    local hour = value // 3600
    local min = value % 3600 // 60
    local sec = value % 60
    return string.format(strTimeD0 .. "%u" .. strTimeD1 .. "%02d" .. strTimeD2 .. "%02d" .. strTimeD3, hour, min, sec)
  end
  local day = value // 86400
  local hour = value % 86400 // 3600
  return string.format(strTimeL0 .. "%u" .. strTimeL1 .. "%02d" .. strTimeL2, day, hour)
end

function getRelation(relations, fromFaction, toFaction)
  return relations[fromFaction][toFaction].value
end

function getPlayerNameFont(player)
  if playerNames == nil then
    return {
      "Noname",
      fonts.en
    }
  end
  local name = playerNames[player + 1]
  if name == nil then
    return {
      "Noname",
      fonts.en
    }
  end
  return {
    name,
    playerFonts[player + 1]
  }
end

function writePlayerToWidget(player, widget, textColor, strokeColor)
  local plnf = getPlayerNameFont(player)
  widget.text = plnf[1]
  widget.fontName = plnf[2]
  if textColor ~= nil then
    widget.font_textColor_value = textColor
  end
  if strokeColor ~= nil then
    widget.font_strokeColor_value = strokeColor
  end
end

function writePlayerToWidget_(player, widget)
  local col = getPlayerColor(player)
  writePlayerToWidget(player, widget, col[1], col[2])
end

function canShow(scene, x, y, myFaction)
  if not root.session_visual_scene[0].hideInFogOfWar then
    return true
  end
  return scene.f_checkFow(x, y, myFaction)
end

function canShowUnit(scene, unit, unitType, myFaction)
  if not root.session_visual_scene[0].hideInFogOfWar then
    return true
  end
  local rel = getRelation(scene.relation, myFaction, unit.faction)
  if rel == 1 then
    return true
  end
  return scene.f_checkFow(unit.position_x, unit.position_y, myFaction, unitType.hiddenInFows_value)
end

function getAttackGround(unitTypeId, unitType)
  if not unitType.attackOn then
    return nil
  end
  local ue = unitsExtraData[unitTypeId]
  if ue ~= nil and ue.groundAttack ~= nil then
    return ue.groundAttack
  end
  local weapons = unitType.attack_weapon
  if weapons.size == 0 then
    return nil
  end
  local w0 = weapons[0]
  if w0.enabled then
    local damage = w0.damage
    local area = damage.area
    if damage.area == 1 and w0.distanceMax >= 30000 or damage.area == 2 and damage.radius >= 50000 then
      return {weapon = 0}
    end
  end
  return nil
end

function blockedPath(landscape, x1, y1, x2, y2)
  local res = landscape.f_calcPath(x1, y1, x2, y2, 4202)
  if res[1] == 3 then
    return false
  end
  if res[1] ~= 4 then
    return true
  end
  local dx = res[2] - x1
  local dy = res[3] - y1
  local d = dx * dx + dy * dy
  return d < 1000000000000
end

function forEachWeaponW(weapons, weaponTypes, func)
  local weaponsNum = weapons.size
  for i = 1, weaponsNum do
    local weapon = weapons[i - 1]
    local weaponType = weaponTypes[i - 1]
    func(weapon, weaponType)
  end
end

function forEachWeapon(gUnit, unitType, func)
  local weapons = gUnit.attack_weapon
  local weaponTypes = unitType.attack_weapon
  forEachWeaponW(weapons, weaponTypes, func)
  local funcT = function(turret, turretType)
    local weapons = turret.weapon
    local weaponTypes = turretType.weapon
    forEachWeaponW(weapons, weaponTypes, func)
  end
  forEachTurret(gUnit, unitType, funcT)
end

function forEachTurret(gUnit, unitType, func)
  local turrets = gUnit.attack_turret
  if turrets == nil then
    return
  end
  local turretsNum = turrets.size
  local turretTypes = unitType.attack_turret
  for i = 1, turretsNum do
    local turret = turrets[i - 1]
    local turretType = turretTypes[i - 1]
    func(turret, turretType)
  end
end

function showEnvSelection()
  local nodes = interface.nodes
  local vSession = root.session_visual
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  currentSelectionUnitType = nil
  currentSelectionUnitFaction = nil
  nodes[22].visible = false
  nodes[423].visible = false
  nodes[679].visible = false
  local env = scene.env[vSession.scene[0].selection_env]
  if env ~= nil then
    local gx = env.position_x
    local gy = env.position_y
    local myFactionId = vSession.currentFaction
    if canShow(scene, gx, gy, myFactionId) then
      envType = env.type
      local icon = envIcons[envType]
      nodes[19].visible = true
      nodes[330].widget_text = getEnvName(gameplay.envType, envType)
      local resource = envResource[envType]
      if resource ~= nil then
        nodes[36].visible = true
        nodes[247].widget_set_normal = resourceIcons[resource + 1]
        local h = env.health
        if 0 < h and h < 1000 then
          h = 1000
        end
        nodes[248].widget_text = h // 1000
      else
        nodes[36].visible = false
      end
      if icon ~= nil then
        nodes[327].visible = true
        nodes[327].widget_middle_set_normal = icon
      else
        nodes[327].visible = false
      end
    else
      nodes[19].visible = false
    end
  else
    nodes[19].visible = false
  end
end

function updateUnitButtonsState(isMyFaction, gUnit, unitType)
  if not isMyFaction or not unitType.controllable then
    return
  end
  local unitTypeId = gUnit.type
  local movable = unitType.movementOn
  local battleUnit = unitType.attackOn
  buttonAttackMove = buttonAttackMove or movable and battleUnit
  if battleUnit and (unitsExtraData[unitTypeId] == nil or not unitsExtraData[unitTypeId].disableMindButton) then
    if gUnit.attack_priorityLimit == 0 then
      attackPriorityLimitZero = true
    else
      attackPriorityLimitHigh = true
    end
  end
  local ag = getAttackGround(unitTypeId, unitType)
  if ag ~= nil then
    buttonAttackGround = true
    attackGroundList[unitTypeId] = ag
  end
  local transporting = 0 < gUnit.transportingUnits_size
  buttonUnload = buttonUnload or transporting
  unloadToPosition = unloadToPosition or transporting and movable
  local tMovement = unitType.movement
  if tMovement ~= nil and tMovement.airplane ~= nil then
    buttonStop = buttonStop or gUnit.movement_targetAerodrome_value == nil and 0 < tMovement.airplane_aerodrome_tags
  else
    buttonStop = buttonStop or 0 < gUnit.task_size
  end
  if unitCanDance[unitTypeId] then
    danceUnitTypes[unitTypeId] = true
  end
  buttonGatherLast = buttonGatherLast or gUnit.hasLastGather
end

function showOneUnitSelection()
  local nodes = interface.nodes
  local vSession = root.session_visual
  local selectionUnit = vSession.scene[0].selection_units_list[0]
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local units = scene.units_list
  currentSelectionUnitType = nil
  currentSelectionUnitFaction = nil
  currentSelectionNum = 0
  local gUnit = units[selectionUnit]
  if gUnit == nil or gUnit.state < 3 or gUnit.presence == 2 then
    nodes[484].visible = false
    unitsShowWork = false
    return
  end
  faction = gUnit.faction
  local myFactionId = vSession.currentFaction
  local isMyFaction = faction == myFactionId or canSeeEnemySecrets
  local unitType = gameplay.unitTypeModified[gUnit.typeModified]
  assert(unitType ~= nil)
  if not isMyFaction and not canShowUnit(scene, gUnit, unitType, myFactionId) then
    nodes[484].visible = false
    unitsShowWork = false
  else
    local unitTypeId = gUnit.type
    local unitTypeModifiedId = gUnit.typeModified
    if unitTypeId ~= 331 and unitTypeId ~= 332 and unitTypeId ~= 335 and unitTypeId ~= 336 then
      local at = gUnit.attachedAirplane
      local ats = at.size
      local sum = ats
      if 0 < ats then
        for i = 0, ats - 1 do
          if at[i].value ~= nil then
            sum = sum - 1
          end
        end
      end
      if 0 < ats and sum == 0 then
        unitsShowWork = false
      end
    end
    updateUnitButtonsState(isMyFaction, gUnit, unitType)
    nodes[22].visible = not buttonUnload
    if buttonUnload then
      nodes[679].visible = true
    end
    currentSelectionUnitType = unitTypeModifiedId
    currentSelectionUnitFaction = faction
    currentSelectionNum = 1
    if (not isMyFaction or canSeeEnemySecrets) and faction > 1 then
      local n = nodes[988]
      n.visible = true
      local w = n.widget
      local rel = getRelation(scene.relation, myFactionId, faction)
      local pl = getPlayerOfFaction(faction)
      if pl ~= nil then
        writePlayerToWidget(pl, w, teamsColors[rel + 1][1])
        if rel == 1 then
          nodes[713].visible = true
        elseif rel == 2 then
          nodes[290].visible = true
        end
      else
        n.visible = false
      end
    else
      nodes[988].visible = false
    end
    currentSelectionUnitTypes[unitTypeModifiedId] = {unitTypeId, 1}
    local nation = unitNations[unitTypeId + 1]
    nodes[24].widget_text = unitNames[unitTypeId + 1]
    if nation == nil then
      nodes[252].widget_text = ""
    else
      local actualEra = getAgeFaction(faction)[1]
      nodes[252].widget_text = getNationName(nation, actualEra % 2 == 1)
    end
    local killsCounter = gUnit.attack_killsCounter
    if killsCounter ~= nil then
      nodes[1001].visible = 0 < killsCounter
      nodes[1003].widget_text = killsCounter
    else
      nodes[1001].visible = false
    end
    local maxHealth = unitType.deathability_health
    if maxHealth == nil then
      nodes[71].visible = false
    else
      nodes[71].visible = true
      local curHealth = gUnit.deathability_health
      if 0 < curHealth and curHealth < 1000 then
        curHealth = 1000
      end
      if showFullHealth then
        nodes[25].widget_text = curHealth // 1000 .. " / " .. maxHealth // 1000
      else
        nodes[25].widget_text = curHealth // 1000
      end
      if maxHealth < curHealth then
        curHealth = maxHealth
      end
      nodes[71].widget_current = curHealth * 100 // maxHealth
    end
    nodes[168].visible = false
    for i = 1, #workQueueButtons do
      nodes[workQueueButtons[i]].visible = false
    end
    if gUnit.state == 3 then
      danceUnitTypes = {}
      buttonGatherLast = false
      buttonStop = false
      buttonAttackGround = false
      buttonAttackMove = false
      attackPriorityLimitZero = false
      attackPriorityLimitHigh = false
      buttonUnload = false
      unitsShowWork = false
      if isMyFaction then
        nodes[423].visible = true
        nodes[35].visible = false
        local buildingProgress = gUnit.buildingProgress * 1000 // 8388608
        nodes[389].widget_text = buildingProgress // 10 .. " %"
        nodes[390].widget_current = buildingProgress
      end
    else
      if isMyFaction and gUnit.bag_amount > 999 and unitTypeId_ ~= 301 then
        nodes[35].visible = true
        nodes[39].widget_set_normal = resourceIcons[gUnit.bag_resource + 1]
        nodes[86].widget_text = gUnit.bag_amount // 1000
      else
        nodes[35].visible = false
      end
      local storage = unitType.storageMultiplier
      nodes[34].visible = storage ~= 0
      if storage ~= 0 then
        nodes[33].widget_text = storage * 100 // 65536 .. " %"
        for j = 1, #storageBoxes do
          local g = 65536 * (1 + j / 10)
          nodes[storageBoxes[j]].visible = storage >= g
        end
      end
      if gUnit.state >= 4 and isMyFaction then
        if not buttonUnload then
          local tasks = gUnit.task
          if 0 < tasks.size then
            local task = tasks[0]
            local data = task.data
            local taskType = task.type
            if taskType == 0 or taskType == 1 or taskType == 17 then
              if task.strict then
                nodes[739].visible = true
              else
                nodes[546].visible = true
              end
              taskPositionX = data.position_x
              taskPositionY = data.position_y
            elseif taskType == 12 then
              nodes[1119].visible = true
              taskPositionX = data.position_x
              taskPositionY = data.position_y
            elseif taskType == 2 then
              local targetId = data.target
              local unit = units[targetId]
              if unit ~= nil then
                local weaponId = data.weapon
                nodes[735].visible = true
                taskPositionX = unit.position_x
                taskPositionY = unit.position_y
                local unitType = gameplay.unitTypeModified[unit.typeModified]
                nodes[750].widget_middle_set_normal = unitIcons[unit.type + 1]
                local color = getFactionColor(unit.faction)[1]
                setFlagColor(nodes[753].widget_set, color)
                nodes[754].widget_current = unit.deathability_health * 100 // unitType.deathability_health
                local dmg = scene.unit.f_averageDamage(selectionUnit, targetId)
                if dmg < 10000 then
                  nodes[748].widget_text = dmg // 1000 .. "." .. dmg // 100 % 10
                else
                  nodes[748].widget_text = dmg // 1000
                end
                local chance = scene.unit.f_hitChance(selectionUnit, targetId, weaponId)
                if chance < 100 then
                  nodes[1399].widget_text = chance // 10 .. "." .. chance % 10 .. "%"
                else
                  nodes[1399].widget_text = chance // 10 .. "%"
                end
              end
            elseif taskType == 3 then
              planId = data.plan
              local plan = scene.faction_buildPlan[planId]
              if plan ~= nil then
                nodes[738].visible = true
                rule = plan.rule
                taskPositionX = plan.position_x
                taskPositionY = plan.position_y
                local id = gameplay.build[rule].unit
                nodes[762].widget_middle_set_normal = unitIcons[id + 1]
                local color = getFactionColor(faction)[1]
                setFlagColor(nodes[776].widget_set, color)
                nodes[764].widget_current = 0
              end
            elseif taskType == 4 then
              local unit = units[data.target]
              if unit ~= nil then
                nodes[738].visible = true
                taskPositionX = unit.position_x
                taskPositionY = unit.position_y
                nodes[762].widget_middle_set_normal = unitIcons[unit.type + 1]
                local color = getFactionColor(unit.faction)[1]
                setFlagColor(nodes[776].widget_set, color)
                nodes[764].widget_current = unit.buildingProgress * 100 // 8388608
              end
            elseif taskType == 5 and unitTypeId_ ~= 301 then
              local env = scene.env[data.target]
              if env ~= nil then
                local gather = unitType.movement_gather
                if gather ~= nil then
                  nodes[736].visible = true
                  taskPositionX = env.position_x
                  taskPositionY = env.position_y
                  envTypeId = env.type
                  local envType = gameplay.envType[envTypeId]
                  nodes[755].widget_middle_set_normal = envIcons[envTypeId]
                  nodes[774].widget_current = env.health * 100 // envType.health
                  nodes[784].widget_text = "---"
                  local targetTags = data.targetTags_value
                  for i = 1, gather.size do
                    local tags = gather[i - 1].envTags_value
                    if 0 < tags & targetTags then
                      local val = gather[i - 1].perTick * 20
                      nodes[784].widget_text = val // 1000 .. "." .. val // 100 % 10
                    end
                  end
                end
              end
            elseif taskType == 6 then
              local unit = units[data.target]
              if unit ~= nil then
                nodes[737].visible = true
                taskPositionX = unit.position_x
                taskPositionY = unit.position_y
                nodes[758].widget_middle_set_normal = unitIcons[unit.type + 1]
                local color = getFactionColor(unit.faction)[1]
                setFlagColor(nodes[775].widget_set, color)
              end
            elseif taskType == 15 then
              local targetId = gUnit.movement_targetAerodrome
              if targetId ~= nil then
                local unit = units[targetId]
                if unit ~= nil then
                  nodes[1326].visible = true
                  taskPositionX = unit.position_x
                  taskPositionY = unit.position_y
                  nodes[1381].widget_middle_set_normal = unitIcons[unit.type + 1]
                end
              end
            elseif taskType == 9 then
              local targetId = data.target
              local unit = units[targetId]
              if unit ~= nil then
                nodes[740].visible = true
                taskPositionX = unit.position_x
                taskPositionY = unit.position_y
                local unitType = gameplay.unitTypeModified[unit.typeModified]
                nodes[768].widget_middle_set_normal = unitIcons[unit.type + 1]
                local color = getFactionColor(unit.faction)[1]
                setFlagColor(nodes[772].widget_set, color)
                nodes[771].widget_current = unit.deathability_health * 100 // unitType.deathability_health
              end
            end
          end
        end
        if unitType.ability ~= nil and 0 < unitType.ability_work_size then
          local worksState = gUnit.work
          queueSize = worksState.queue_size
          if 0 < queueSize then
            nodes[58].visible = true
          end
          nodes[59].visible = 5 < queueSize
          if 0 < queueSize then
            local workTime = worksState.queue[0].time
            local workProgress = 1000
            if 0 < workTime then
              workProgress = worksState.progress * 1000 // workTime
            end
            nodes[168].visible = true
            nodes[168].widget_text = workProgress // 10 .. " %"
            nodes[64].widget_current = workProgress
            for i = 1, 5 do
              local workState = worksState.queue[i - 1]
              if i <= queueSize then
                nodes[workQueueButtons[i]].visible = true
                local set = nodes[workQueueButtons[i]].widget_middle_set
                local iconText = getUnitWorkIconText(currentSelectionUnitTypes[currentSelectionUnitType][1], workState.work)
                local work = unitType.ability_work[workState.work]
                local ability = unitType.ability_ability[work.ability]
                finalizedWork = finalizedWork or work.final
                local abilityType = ability.type
                if iconText ~= nil then
                  set.normal = iconText[1]
                elseif abilityType == 0 then
                  workObject = ability.data_unit
                  set.normal = unitIcons[workObject + 1]
                elseif abilityType == 1 then
                  workObject = ability.data_research
                  set.normal = researchIcons[workObject + 1]
                elseif abilityType == 2 then
                  workObject = ability.data_unit
                  set.normal = unitIcons[workObject + 1]
                else
                  workObject = ability.data_id
                  set.normal = 286
                end
                local amount = workState.amount
                local n = nodes[workQueueNumbers[i]]
                n.visible = 1 < amount
                if 1 < amount then
                  n.widget_text = amount
                end
              else
                nodes[workQueueNumbers[i]].visible = false
              end
            end
            for i = 6, queueSize do
              local id = worksState.queue[i - 1].work
              local work = unitType.ability_work[id]
              assert(work ~= nil)
              finalizedWork = finalizedWork or work.final
            end
          end
        end
      end
    end
  end
end

function showUnitsSelection()
  local nodes = interface.nodes
  nodes[71].visible = false
  nodes[679].visible = false
  local unitsList = root.session_visual_scene[0].selection_units_list
  local gameplay = root.session_gameplay_gameplay
  local units = gameplay.scene[0].units_list
  local myFactionId = root.session_visual_currentFaction
  local notFramedAny = true
  local currentSelectionButtonsTypes = {}
  faction = nil
  local unitsCount = 0
  for i = 1, unitsList.size do
    local vUnit = unitsList[i - 1]
    if vUnit ~= nil then
      local gUnit = units[vUnit]
      if gUnit ~= nil and gUnit.state >= 3 and gUnit.presence ~= 2 then
        unitsCount = unitsCount + 1
        local fac = gUnit.faction
        if faction == nil or fac == faction then
          faction = fac
          local unitTypeId = gUnit.type
          local unitTypeModifiedId = gUnit.typeModified
          currentSelectionButtonsTypes[i] = unitTypeModifiedId
          local unitType = gameplay.unitTypeModified[gUnit.typeModified]
          updateUnitButtonsState(faction == myFactionId or canSeeEnemySecrets, gUnit, unitType)
          if unitTypeModifiedId == currentSelectionUnitType then
            notFramedAny = false
          end
          local a = currentSelectionUnitTypes[unitTypeModifiedId]
          if a == nil then
            currentSelectionUnitTypes[unitTypeModifiedId] = {unitTypeId, 1}
          else
            a[2] = a[2] + 1
          end
        end
      end
    end
  end
  if unitsCount == 0 then
    currentSelectionUnitType = nil
    currentSelectionUnitFaction = nil
    nodes[484].visible = false
    unitsShowWork = false
  end
  if notFramedAny then
    currentSelectionUnitType = nil
    currentSelectionUnitFaction = nil
    for k, v in pairs(currentSelectionButtonsTypes) do
      currentSelectionUnitType = v
      currentSelectionUnitFaction = faction
      break
    end
  end
end

function updateSelection(statistics)
  local nodes = interface.nodes
  buttonAttackMove = false
  attackPriorityLimitZero = false
  attackPriorityLimitHigh = false
  buttonAttackGround = false
  attackGroundList = {}
  buttonUnload = false
  unloadToPosition = false
  buttonStop = false
  danceUnitTypes = {}
  buttonGatherLast = false
  unitsShowWork = false
  currentSelectionUnderTransformation = 0
  nodes[885].visible = false
  nodes[866].visible = false
  workButtonsState = {
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0},
    {show = false, workId = 0}
  }
  local vSession = root.session_visual
  if vSession.scene[0].selection_env ~= nil then
    showEnvSelection()
    root.interface[unitsSelectedGroupInterface].active = false
  else
    local gameplay = root.session_gameplay_gameplay
    local scene = gameplay.scene[0]
    local units = scene.units_list
    nodes[19].visible = false
    nodes[22].visible = false
    nodes[423].visible = false
    nodes[679].visible = false
    nodes[713].visible = false
    nodes[290].visible = false
    local selectionList = vSession.scene[0].selection_units_list
    local selectionSize = selectionList.size
    finalizedWork = false
    currentSelectionUnitTypes = {}
    if selectionSize == 0 then
      currentSelectionUnitType = nil
      currentSelectionUnitFaction = nil
      root.interface[unitsSelectedGroupInterface].active = false
    else
      nodes[484].visible = true
      unitsShowWork = true
      root.interface[unitsSelectedGroupInterface].active = hiddenInterfaces == nil
      if selectionSize == 1 then
        showOneUnitSelection()
      else
        showUnitsSelection()
      end
    end
    if currentSelectionUnitType ~= nil then
      local landscape = root.session_gameplay_gameplay_scene[0].landscape
      if shownUnitTypeInfo ~= nil and shownUnitTypeInfo ~= currentSelectionUnitTypes[currentSelectionUnitType][1] then
        showUnitTypeInfo()
      end
      local currentSelectionTypeCount = currentSelectionUnitTypes[currentSelectionUnitType]
      nodes[114].widget_middle_set_normal = unitIcons[currentSelectionTypeCount[1] + 1]
      if currentSelectionTypeCount ~= nil then
        nodes[466].visible = 1 < currentSelectionTypeCount[2]
        nodes[466].widget_text = currentSelectionTypeCount[2]
        nodes[535].visible = 1 < currentSelectionTypeCount[2]
        nodes[1378].visible = false
        nodes[199].visible = false
        nodes[1385].visible = false
        nodes[1000].visible = false
        if currentSelectionTypeCount[2] == 1 then
          local selUnit = selectionList[0]
          if selUnit ~= nil then
            local gUnit = units[selUnit]
            if gUnit ~= nil and gUnit.state >= 4 and gUnit.presence ~= 2 then
              local unitType = gameplay.unitTypeModified[gUnit.typeModified]
              local rechTm = 0
              local rechMax = 5000
              if unitType.attackOn then
                local checkWeapon = function(weapon, weaponType)
                  local rechargeTime = weapon.rechargeTime
                  if 0 <= rechargeTime then
                    local rechargePeriod = weaponType.rechargePeriod
                    if rechargePeriod >= rechMax then
                      rechTm = rechargeTime
                      rechMax = rechargePeriod
                    end
                  end
                end
                forEachWeapon(gUnit, unitType, checkWeapon)
              end
              if 0 < rechTm then
                nodes[199].visible = true
                nodes[117].widget_current = 1000 - rechTm * 1000 // rechMax
              end
              local dieTime = gUnit.dieTime
              local lifeTime = gUnit.movement_fuel
              if lifeTime == nil then
                lifeTime = 0
              end
              local lifeLimit = unitType.movement_airplane_fuel
              if lifeLimit == nil then
                lifeLimit = 0
              end
              if dieTime ~= nil and dieTime < 100000000 then
                local lf = dieTime - gameplay.time
                local lim = dieTime - gUnit.bornTime
                if lf < lim then
                  lifeTime = lf
                  lifeLimit = lim
                end
              end
              if 0 < lifeTime then
                local n = nodes[1378]
                n.visible = true
                n.widget_current = lifeTime * 1000 // lifeLimit
              end
              if unitType.attackOn then
                do
                  local weapon0 = unitType.attack_weapon[0]
                  if weapon0 ~= nil and 0 < weapon0.charges then
                    local charges = gUnit.attack_weapon[0].charges
                    nodes[1385].visible = true
                    if 0 < charges then
                      nodes[323].visible = true
                      nodes[323].sizeX = math.floor(6 * interfaceScale * charges)
                    else
                      nodes[323].visible = false
                    end
                    nodes[312].sizeX = math.floor(6 * interfaceScale * weapon0.charges)
                  end
                  local weapon1 = unitType.attack_weapon[1]
                  if weapon1 ~= nil and 0 < weapon1.charges then
                    local charges = gUnit.attack_weapon[1].charges
                    nodes[1000].visible = true
                    if 0 < charges then
                      nodes[999].visible = true
                      nodes[999].sizeX = math.floor(6 * interfaceScale * charges)
                    else
                      nodes[999].visible = false
                    end
                    nodes[998].sizeX = math.floor(6 * interfaceScale * weapon1.charges)
                  end
                end
              end
            end
          end
        end
        local color = getFactionColor(faction)[1]
        setFlagColor(nodes[385].widget_set, color)
        local isMyFaction = faction == vSession.currentFaction or canSeeEnemySecrets
        if isMyFaction and unitsShowWork then
          local unitType = gameplay.unitTypeModified[currentSelectionUnitType]
          if unitType ~= nil then
            if unitType.tags[5] and HQ.id ~= nil then
              local landscape = root.session_gameplay_gameplay_scene[0].landscape
              local res = landscape.f_findFreePosition(math.floor(HQ.x * 256), math.floor(HQ.y * 256), 106)
              if res[1] == 1 then
                local x = res[2]
                local y = res[3]
                local sx = landscape.size_x - 10000
                local sy = landscape.size_y - 10000
                if blockedPath(landscape, x, y, 10000, 10000) and blockedPath(landscape, x, y, sx, sy) then
                  nodes[885].visible = true
                else
                  nodes[866].visible = true
                end
              end
            end
            local selTypeId = currentSelectionUnitTypes[currentSelectionUnitType][1]
            local reserves = {
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0
            }
            local reserveProgress = {
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0
            }
            local selCount = 0
            local checkNoTask = selTypeId == 288
            if unitType.ability ~= nil then
              local works = unitType.ability_work_size
              for i = 0, selectionSize - 1 do
                local selUnit = selectionList[i]
                if selUnit ~= nil then
                  local gUnit = units[selUnit]
                  if gUnit ~= nil and gUnit.state >= 4 and gUnit.presence ~= 2 then
                    if checkNoTask then
                      local tasks = gUnit.task
                      if tasks.size > 0 then
                        unitsShowWork = false
                      end
                    end
                    if gUnit.typeModified == currentSelectionUnitType then
                      if gUnit.underTransformation then
                        currentSelectionUnderTransformation = currentSelectionUnderTransformation + 1
                      end
                      selCount = selCount + 1
                      for j = 1, works do
                        local work = unitType.ability_work[j - 1]
                        assert(work ~= nil)
                        if 0 < work.reserveLimit then
                          local res = gUnit.work_reserve[j - 1]
                          reserves[j] = reserves[j] + res.amount
                          if reserveProgress[j] < res.time then
                            reserveProgress[j] = res.time
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            if unitsShowWork then
              finalizedWork = finalizedWork or currentSelectionUnderTransformation == selCount
              local showAny = false
              local myFaction = gameplay.faction[faction]
              local finalAge = tonumber(root.session_gameplay_gameplay_dataStorage_finalAge)
              if finalAge == nil then
                finalAge = 100
              end
              if finalizedWork then
                for buttonId = 1, 11 do
                  nodeButtonId = workButtonBlocks[buttonId]
                  nodes[nodeButtonId].visible = false
                end
              else
                local selTypeId = currentSelectionUnitTypes[currentSelectionUnitType][1]
                if unitType.ability ~= nil then
                  local ue = unitsExtraData[selTypeId]
                  for buttonId = 1, 11 do
                    assert(workButtonsState[buttonId] ~= nil)
                    nodes[workButtonBlocks[buttonId]].visible = false
                    if ue ~= nil and ue.work ~= nil then
                      local workData = ue.work[buttonId]
                      if workData ~= nil then
                        for j = 1, #workData do
                          local w = workData[j]
                          local showDisabled = showWorkButton(nodes, myFaction, statistics, reserves[w + 1], reserveProgress[w + 1], selTypeId, unitType, buttonId, w, finalAge)
                          if showDisabled[1] then
                            showAny = true
                            if not showDisabled[3] then
                              break
                            end
                          end
                        end
                      else
                        nodeButtonId = workButtonBlocks[buttonId]
                        nodes[nodeButtonId].visible = false
                        workButtonsState[buttonId].show = false
                      end
                    else
                      local show = showWorkButton(nodes, myFaction, statistics, reserves[buttonId], reserveProgress[buttonId], selTypeId, unitType, buttonId, buttonId - 1, finalAge)
                      showAny = showAny or show[1]
                    end
                  end
                end
              end
              nodes[68].visible = showAny
            end
          end
        end
      end
    end
  end
  assert(currentSelectionUnitType == nil or currentSelectionUnitTypes[currentSelectionUnitType] ~= nil)
  nodes[1276].visible = attackPriorityLimitZero or attackPriorityLimitHigh
  nodes[901].visible = attackPriorityLimitZero and not attackPriorityLimitHigh
  nodes[1277].visible = attackPriorityLimitHigh and not attackPriorityLimitZero
  nodes[1278].visible = attackPriorityLimitHigh and attackPriorityLimitZero
  nodes[945].visible = buttonAttackMove
  nodes[119].visible = buttonStop
  nodes[201].visible = not isEmptyTable(danceUnitTypes)
  nodes[183].visible = buttonGatherLast
  nodes[456].visible = buttonAttackGround
  nodes[206].visible = buttonUnload
end

function isEmptyTable(tbl)
  return next(tbl) == nil
end

function updateMinimapIcons()
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local vSession = root.session_visual
  local icons = vSession.scene[0].minimap_icons
  if icons.size ~= 0 then
    for _, v in ipairs(showMinimapIcons) do
      icons.f_remove(v[1], v[2])
    end
  end
  showMinimapIcons = {}
  local canSeeTownHalls = isResearchComplete(vSession.currentFaction, 92)
  local unitsList = scene.units.f_findAll2(255, 32)
  if #unitsList == 0 then
    return
  end
  local list = scene.units_list
  for _, unitId in ipairs(unitsList) do
    local unit = list[unitId]
    local unitType = gameplay.unitTypeModified[unit.typeModified]
    local wonder = unitType.tags[9]
    if wonder or canSeeTownHalls then
      local iid = icons.f_create(0, 1000)
      table.insert(showMinimapIcons, {
        iid[1],
        iid[2]
      })
      local icon = icons[iid[1]]
      icon.color_value = 4294967295
      icon.position_x = vSession.f_coordinateToVisual2(unit.position.x)
      icon.position_y = vSession.f_coordinateToVisual2(unit.position.y)
      icon.scale = 22
      if wonder then
        icon.scale = icon.scale * 2
        if unit.faction == wwWinFaction then
          icon.billboard = 2
        else
          icon.billboard = 1
        end
      elseif canSeeTownHalls then
        icon.scale = icon.scale * 1.2
        icon.billboard = 0
      end
    end
  end
end

function setInterfaceScale(widgetsScale, fontsScale)
  interfaceScale = widgetsScale
  updateTeamBlocks()
  onResize()
end

function getPlayerOfFaction(faction)
  local plr = root.session_gameplay_gameplay_player
  for i = 0, plr.size - 1 do
    local player = plr[i].controlledFactions
    if player[faction] then
      return i
    end
  end
  return nil
end

function getPlayerTeam(player)
  local id = getPlayerFaction(player)
  return root.session_gameplay_gameplay_scene[0].faction[id].team
end

function underWater(z)
  return z < 130200
end

function updateTeamBlocks()
  local nodes = interface.nodes
  local teamsInitData = {
    list1 = 0,
    list2 = 0,
    blockId = 0,
    blockAddY = nodes[1184].localTop,
    blockSizeColumn = nodes[1143].screenLeft - nodes[1184].screenLeft,
    blockNode
  }
  local gameplay = root.session_gameplay_gameplay
  local players = gameplay.player_size
  local sFactions = gameplay.scene[0].faction
  local namesPerColumn = 20
  local currentFaction = root.session_visual_currentFaction
  local currentTeam = sFactions[currentFaction].team
  local teams = {}
  for plId = 1, players do
    local func = function(facId)
      local team = sFactions[facId].team
      if teams[team] == nil then
        teams[team] = {plId}
      else
        table.insert(teams[team], plId)
      end
    end
    forEachPlayerFaction(plId - 1, func)
  end
  local oneColumn = players <= 20
  if oneColumn then
    nodes[991].visible = true
  else
    nodes[1245].visible = true
  end
  for teamSize = 64, 1, -1 do
    for teamId, list in pairs(teams) do
      if #list == teamSize then
        local bestList = 0
        local blockStartPos = 0
        if oneColumn or teamsInitData.list1 <= teamsInitData.list2 then
          bestList = 1
          blockStartPos = teamsInitData.list1 + 1
        else
          bestList = 2
          blockStartPos = teamsInitData.list2 + namesPerColumn + 1
        end
        local teamed = 1 < #list
        local blockSize = 0
        for j = 1, #list do
          if teamed and teamsInitData.blockNode == nil then
            startTeamBlock(teamsInitData, blockStartPos, bestList, 1 < j, teamId == currentTeam)
          end
          blockSize = blockSize + 1
          local pl = list[j]
          if bestList == 1 then
            teamsInitData.list1 = teamsInitData.list1 + 1
            playersListPosition[pl] = teamsInitData.list1
            if namesPerColumn <= teamsInitData.list1 then
              finishTeamBlock(teamsInitData, blockStartPos, blockSize)
              bestList = 2
              blockStartPos = teamsInitData.list2 + namesPerColumn + 1
              blockSize = 0
            end
          else
            teamsInitData.list2 = teamsInitData.list2 + 1
            if namesPerColumn <= teamsInitData.list2 then
              return
            end
            playersListPosition[pl] = teamsInitData.list2 + namesPerColumn
            if namesPerColumn <= teamsInitData.list2 then
              finishTeamBlock(teamsInitData, blockStartPos, blockSize)
              bestList = 1
              blockStartPos = teamsInitData.list1 + 1
              blockSize = 0
            end
          end
        end
        finishTeamBlock(teamsInitData, blockStartPos, blockSize)
      end
    end
  end
end

function startTeamBlock(teamsInitData, startPos, bestList, connectColumns, myTeam)
  local nodes = interface.nodes
  teamsInitData.blockId = teamsInitData.blockId + 1
  teamsInitData.blockNode = nodes[teamBlocks[teamsInitData.blockId]]
  teamsInitData.blockNode.visible = true
  assert(startPos <= #playersListNames)
  local n = nodes[playersListNames[startPos]]
  teamsInitData.blockNode.localLeft = n.localLeft + 40 + math.floor((2 - bestList) * teamsInitData.blockSizeColumn - 5)
  if myTeam then
    teamsInitData.blockNode.widget_color_value = 1342242815
  else
    teamsInitData.blockNode.widget_color_value = 1342177408
  end
  teamsInitData.blockNode.localTop = n.localTop + math.floor(teamsInitData.blockAddY)
  teamsInitData.blockNode.sizeX = n.sizeX + 25
  if connectColumns then
    teamsInitData.blockNode.sizeX = teamsInitData.blockNode.sizeX + 9
    if bestList == 1 then
      teamsInitData.blockNode.localLeft = teamsInitData.blockNode.localLeft - 9
    end
  end
end

function finishTeamBlock(teamsInitData, startPos, blockSize)
  if teamsInitData.blockNode == nil then
    return
  end
  local nodes = interface.nodes
  local n = nodes[playersListNames[startPos + blockSize - 1]]
  local sy = n.localTop + n.sizeY + math.floor(teamsInitData.blockAddY) - teamsInitData.blockNode.localTop
  assert(0 < sy)
  teamsInitData.blockNode.sizeY = sy
  teamsInitData.blockNode = nil
end

function hideInterfaces(hide)
  local nodes = interface.nodes
  nodes[60].visible = not hide
  if hide then
    hiddenInterfaces = {}
    for i = 0, 100 do
      if i ~= interfaceId then
        local itf = root.interface[i]
        if itf ~= nil and itf.active and itf.name ~= "scene" and itf.name ~= "cinematic" and itf.name ~= "cameraMove" then
          itf.active = false
          table.insert(hiddenInterfaces, i)
        end
      end
    end
  else
    if hiddenInterfaces ~= nil then
      for i = 1, #hiddenInterfaces do
        root.interface[hiddenInterfaces[i]].active = true
      end
    end
    hiddenInterfaces = nil
  end
  onResize()
end

function getListOfRequiredUnits(requirements, all)
  local delimiter = "/"
  if all then
    delimiter = "+"
  end
  local s = ""
  local sz = requirements.size
  for i = 1, sz do
    local requirementUnit = requirements[i - 1]
    local num = requirementUnit.min
    if 0 < num then
      local unitType = requirementUnit.type
      if 1 < i then
        s = s .. " " .. delimiter .. " "
      end
      s = s .. unitNames[unitType + 1]
      if 1 < num then
        s = s .. " x" .. num
      end
    end
  end
  return s
end

function getListOfRequiredResearches(requirements, all)
  local delimiter = "/"
  if all then
    delimiter = "+"
  end
  local s = ""
  local sz = requirements.size
  for i = 1, sz do
    local requirementResearch = requirements[i - 1].id
    if 1 < i then
      s = s .. " " .. delimiter .. " "
    end
    s = s .. researchNames[requirementResearch + 1]
  end
  return s
end

function updateCostRequirements(requirements)
  local nodes = interface.nodes
  local hasRequiredUnit = requirements.unit_size > 0
  local hasRequiredResearch = 0 < requirements.research_size
  if hasRequiredUnit or hasRequiredResearch then
    nodes[18].visible = true
    if hasRequiredUnit then
      nodes[467].visible = true
      nodes[32].widget_text = getListOfRequiredUnits(requirements.unit, requirements.unitsAll)
    else
      nodes[467].visible = false
    end
    if hasRequiredResearch then
      nodes[543].visible = true
      nodes[453].widget_setText = getListOfRequiredResearches(requirements.research, requirements.researchesAll)
    else
      nodes[543].visible = false
    end
  else
    nodes[18].visible = false
  end
end

function searchUnit(units, faction, tags)
  return units.f_searchNearest2(0, 0, 1000000000, faction, tags)
end

function isAgeUpgrade(upgrade)
  if 1 <= upgrade and upgrade <= 9 then
    return true
  end
  if 15 <= upgrade and upgrade <= 17 then
    return true
  end
  if upgrade == 59 then
    return true
  end
  if 61 <= upgrade and upgrade <= 73 then
    return true
  end
  if upgrade == 93 then
    return true
  end
  if 114 <= upgrade and upgrade <= 116 or upgrade == 118 or upgrade == 121 or upgrade == 125 or upgrade == 126 or upgrade == 131 or upgrade == 135 or upgrade == 136 or upgrade == 145 or upgrade == 146 then
    return true
  end
  return false
end

function switchPlayerOff(player)
  if player >= #playersListPosition then
    return
  end
  local nodes = interface.nodes
  local pos = playersListPosition[player + 1]
  if pos == nil then
    return
  end
  local n = nodes[playersListStatus[pos]]
  n.widget_image = playerStatusOff
end

function reinitPlayersList(updateNames)
  if playersListPosition == nil then
    return
  end
  local gameplay = root.session_gameplay_gameplay
  local currentFaction = root.session_visual_currentFaction
  local currentPlayer = getPlayerOfFaction(currentFaction)
  local nodes = interface.nodes
  for pl, pos in pairs(playersListPosition) do
    if 40 < pos then
      break
    end
    local playerId = pl - 1
    local n = nodes[playersListNames[pos]]
    n.visible = true
    if updateNames then
      writePlayerToWidget_(playerId, n.widget)
    end
    local n = nodes[playersListStatus[pos]]
    n.visible = true
    if gameplay.player[playerId].eliminated then
      n.widget_image = playerStatusOff
    elseif playerId == currentPlayer then
      n.widget_image = playerStatusMe
    else
      n.widget_image = playerStatusOn
    end
  end
end

function prepareDiag(strips)
  assert(#timeline > 1)
  assert(1 < strips)
  local diag = interface.content_diagram[0]
  diag.f_resize(#timeline, strips)
  local colors = diag.colors
  for strip = 1, strips do
    local color = getPlayerColor(strip - 1)[1]
    colors[strip - 1].value = color
  end
end

function prepareDiagPredictions()
  local diag = interface.content_diagram[0]
  diag.f_resize(#victoryPredictions, 2)
  local colors = diag.colors
  colors[0].value = teamsColors[3]
  colors[1].value = teamsColors[2]
end

function getTimelineValueGather(gather)
  return gather[1] + gather[2] * 1.5 + gather[3] * 5
end

function getTimelineValueEconomy(workers, workersSum, gather, gatherSum)
  local w = 0
  if type(workers) == "number" then
    w = workers
  else
    w = workers[1]
  end
  local sum = 0
  local g = getTimelineValueGather(gather)
  if 0 < w then
    sum = sum + w / workersSum
  end
  if 0 < g then
    sum = sum + g / getTimelineValueGather(gatherSum)
  end
  return sum
end

function getTimelineValueWar(army, armySum, killed, killedSum)
  local sum = 0
  if 0 < army then
    sum = sum + army / armySum
  end
  if 0 < killed then
    sum = sum + killed / killedSum * 0.25
  end
  return sum
end

function getTimelineValueTotal(army, armySum, killed, killedSum, territory, territorySum, workers, workersSum, gather, gatherSum)
  local sum = getTimelineValueWar(army, armySum, killed, killedSum) + getTimelineValueEconomy(workers, workersSum, gather, gatherSum)
  if 0 < territory then
    sum = sum + territory / territorySum * 0.5
  end
  return sum
end

function updateTimelineTemplate(func)
  assert(#timeline > 1)
  local strips = interface.content_diagram[0].strips
  if timelineVictoryPrediction then
    prepareDiagPredictions()
    for i = 1, #victoryPredictions do
      local strip = strips[i - 1]
      local v = victoryPredictions[i]
      if v == nil or v < 0 then
        strip[0].value = 0
        strip[1].value = 0
      else
        strip[0].value = v
        strip[1].value = 1 - v
      end
    end
  elseif timelineByTeams then
    prepareDiag(timelineTeamsCount)
    for tm = 1, #timeline do
      local slice = timeline[tm]
      local sum = {
        0,
        0,
        0,
        0,
        {
          0,
          0,
          0
        }
      }
      for teamId, teamData in pairs(timelineTeams) do
        for plNum = 1, #teamData do
          local plId = math.floor(teamData[plNum])
          local facId = playersFactions[plId] + 1
          sum[1] = sum[1] + slice[1][facId]
          sum[2] = sum[2] + slice[2][facId]
          sum[3] = sum[3] + slice[3][facId]
          sum[4] = sum[4] + slice[4][facId]
          sum[5][1] = sum[5][1] + slice[5][facId][1]
          sum[5][2] = sum[5][2] + slice[5][facId][2]
          sum[5][3] = sum[5][3] + slice[5][facId][3]
        end
      end
      local strip = strips[tm - 1]
      local teamCounter = 0
      for teamId, teamData in pairs(timelineTeams) do
        local v = 0
        for plNum = 1, #teamData do
          local plId = math.floor(teamData[plNum])
          local facId = playersFactions[plId] + 1
          v = v + func(slice[1][facId], slice[2][facId], slice[3][facId], slice[4][facId], slice[5][facId], sum[1], sum[2], sum[3], sum[4], sum[5])
        end
        assert(0 <= v)
        strip[teamCounter].value = v
        teamCounter = teamCounter + 1
      end
    end
  else
    local playersCount = root.session_gameplay_gameplay_player_size
    prepareDiag(playersCount)
    for tm = 1, #timeline do
      local slice = timeline[tm]
      local sum = {
        0,
        0,
        0,
        0,
        {
          0,
          0,
          0
        }
      }
      for plId = 1, playersCount do
        local facId = playersFactions[plId] + 1
        sum[1] = sum[1] + slice[1][facId]
        sum[2] = sum[2] + slice[2][facId]
        sum[3] = sum[3] + slice[3][facId]
        local res = slice[4][facId]
        if type(res) == "number" then
          sum[4] = sum[4] + slice[4][facId]
        else
          sum[4] = sum[4] + slice[4][facId][1]
        end
        sum[5][1] = sum[5][1] + slice[5][facId][1]
        sum[5][2] = sum[5][2] + slice[5][facId][2]
        sum[5][3] = sum[5][3] + slice[5][facId][3]
      end
      local strip = strips[tm - 1]
      for plId = 1, playersCount do
        local facId = playersFactions[plId] + 1
        local v = func(slice[1][facId], slice[2][facId], slice[3][facId], slice[4][facId], slice[5][facId], sum[1], sum[2], sum[3], sum[4], sum[5])
        if 0 <= v then
          strip[plId - 1].value = v
        else
          strip[plId - 1].value = 0
        end
      end
    end
  end
  interface.f_updateDiagram(0)
end

function updateTimeline()
  if timeline == nil or #timeline < 2 then
    return
  end
  local nodes = interface.nodes
  nodes[1249].disabled = false
  nodes[1250].disabled = false
  nodes[1251].disabled = false
  nodes[1252].disabled = false
  nodes[1248].disabled = false
  nodes[1247].disabled = false
  nodes[1244].disabled = false
  nodes[1243].disabled = false
  nodes[1241].disabled = false
  nodes[1240].disabled = false
  nodes[1242].disabled = false
  nodes[2].visible = false
  nodes[93].visible = timelineByTeams
  timelineVictoryPrediction = false
  diagUpdatePeriod = timeLineUpdatePeriod
  local func
  if timelineType == "victory" then
    timelineVictoryPrediction = true
    diagUpdatePeriod = 50
    nodes[2].visible = true
    nodes[93].visible = true
    local v = victoryPredictions[#victoryPredictions]
    if v == nil then
      v = 0.5
    end
    nodes[148].widget_text = math.floor((1 - v) * 100 + 0.5)
    nodes[146].widget_text = math.floor(v * 100 + 0.5)
  elseif timelineType == "all" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return getTimelineValueTotal(v1, s1, v2, s2, v3, s3, v4, s4, v5, s5)
    end
    
    nodes[1249].disabled = true
  elseif timelineType == "war" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return getTimelineValueWar(v1, s1, v2, s2)
    end
    
    nodes[1250].disabled = true
  elseif timelineType == "army" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return v1
    end
    
    nodes[1251].disabled = true
  elseif timelineType == "killed" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return v2
    end
    
    nodes[1252].disabled = true
  elseif timelineType == "territory" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return v3
    end
    
    nodes[1248].disabled = true
  elseif timelineType == "economy" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return getTimelineValueEconomy(v4, s4, v5, s5)
    end
    
    nodes[1247].disabled = true
  elseif timelineType == "workers" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      if type(v4) == "number" then
        return v4
      else
        return v4[1]
      end
    end
    
    nodes[1244].disabled = true
  elseif timelineType == "gather" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return getTimelineValueGather(v5)
    end
    
    nodes[1243].disabled = true
  elseif timelineType == "gather_food" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return v5[1]
    end
    
    nodes[1241].disabled = true
  elseif timelineType == "gather_materials" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return v5[2]
    end
    
    nodes[1240].disabled = true
  elseif timelineType == "gather_metal" then
    function func(v1, v2, v3, v4, v5, s1, s2, s3, s4, s5)
      return v5[3]
    end
    
    nodes[1242].disabled = true
  end
  updateTimelineTemplate(func)
end

function updateTimelimeTimes()
  if timeline == nil then
    return
  end
  local nodes = interface.nodes
  local gameTime = #timeline * 30
  if timelineVictoryPrediction then
    gameTime = #victoryPredictions * predictionsPeriod // 1000
  end
  nodes[1265].widget_text = toTimeStr(gameTime // 4)
  nodes[1266].widget_text = toTimeStr(gameTime * 2 // 4)
  nodes[1267].widget_text = toTimeStr(gameTime * 3 // 4)
  nodes[1268].widget_text = toTimeStr(gameTime)
end

function prepareTimeline()
  root.session_gameplay_gameplay_scripts_scripts.f_run(6)
  local storage = root.session_gameplay_gameplay_dataStorage
  timeline = fromJson(storage.WvyVbqp8LDf).pointsTimeline
  updateTimelimeTimes()
end

function switchMatchResultsTab(tab)
  local nodes = interface.nodes
  if tab == "map" then
    nodes[1139].visible = false
    nodes[1150].visible = true
    nodes[1161].visible = false
  else
    nodes[1139].visible = teamMode and canSeeEnemySecrets
    nodes[1150].visible = false
    nodes[1161].visible = true
    prepareTimeline()
    updateTimeline()
  end
end

function updateAttackWarnings()
  local vSession = root.session_visual
  local gSession = root.session_gameplay
  local gameplay = gSession.gameplay
  local nodes = interface.nodes
  local myFaction = vSession.currentFaction
  local myPlayer = getPlayerOfFaction(myFaction)
  local myFactions = gameplay.player[myPlayer].controlledFactions
  local myRelations = gameplay.scene[0].relation[myFaction]
  local time = gameplay.time
  for facId = 0, vSession.faction_size - 1 do
    local fact = vSession.faction[facId]
    local lastDamageTime = fact.lastDamageTime
    local lastDamageFrom = fact.lastDamageFrom
    if 0 < lastDamageTime and lastDamageFrom ~= facId then
      if myFactions[facId] then
        lastDamageTimeMe = lastDamageTime
        attackedPositionMe = {
          fact.lastDamagePosition_x,
          fact.lastDamagePosition_y
        }
      elseif myRelations[facId] == 1 and 1 < lastDamageFrom then
        lastDamageTimeAlly = lastDamageTime
        attackedPositionAlly = {
          fact.lastDamagePosition_x,
          fact.lastDamagePosition_y
        }
      end
    end
  end
  local newVisibleAttackMe = time - lastDamageTimeMe < 7000
  local newVisibleAttackAlly = time - lastDamageTimeAlly < 7000
  if newVisibleAttackMe and not nodes[949].visible then
    vSession.sound.f_playSound(247, 0.07)
  end
  nodes[949].visible = newVisibleAttackMe
  if newVisibleAttackAlly and not nodes[1093].visible then
    vSession.sound.f_playSound(259, 0.07)
  end
  nodes[1093].visible = newVisibleAttackAlly
end

function showWorkCost(unitTypeId, unitType, workId, x, y)
  local work = unitType.ability_work[workId]
  local ability = unitType.ability_ability[work.ability]
  local iconText = getUnitWorkIconText(unitTypeId, work.ability)
  local costOrder = work.costOrder
  local costStart = work.costStart
  local costProcess = work.costProcess
  updateCostRequirements(ability.requirements)
  local nodes = interface.nodes
  nodes[50].visible = true
  nodes[221].visible = true
  local reserveTime = work.reserveTime
  if 0 < reserveTime then
    nodes[219].widget_text = work.makeTime // 1000 .. " / " .. reserveTime // 1000
  else
    nodes[219].widget_text = work.makeTime // 1000
  end
  local factionId = root.session_visual_currentFaction
  local gameplay = root.session_gameplay_gameplay
  local sFaction = gameplay.scene[0].faction[factionId]
  local resources = sFaction.treasury_resources
  local i0 = costOrder[0] + costStart[0]
  local i1 = costOrder[1] + costStart[1]
  local i2 = costOrder[2] + costStart[2]
  local i3 = costOrder[3] + costStart[3]
  local i4 = costOrder[4] + costStart[4]
  local c0 = i0 + costProcess[0]
  local c1 = i1 + costProcess[1]
  local c2 = i2 + costProcess[2]
  local c3 = i3 + costProcess[3]
  local c4 = i4 + costProcess[4]
  local r0 = resources[0]
  local r1 = resources[1]
  local r2 = resources[2]
  local r3 = resources[3]
  local r4 = resources[4]
  outCostDigit(nodes[123], nodes[52], i0, c0, r0, 1000)
  outCostDigit(nodes[124], nodes[53], i1, c1, r1, 1000)
  outCostDigit(nodes[126], nodes[97], i2, c2, r2, 1000)
  outCostDigit(nodes[321], nodes[317], i3, c3, r3, 1000)
  outCostDigit(nodes[320], nodes[319], i4, c4, r4, 1000)
  nodes[315].visible = 0 < c3 or 0 < c4
  local abilityType = ability.type
  local abilityName = ""
  local name = ""
  local text = ""
  nodes[112].visible = false
  nodes[128].visible = false
  if abilityType == 0 then
    local object = ability.data_unit
    local workUnitType = gameplay.unitType[object]
    if workUnitType.supplyOn then
      local limit = sFaction.supply_limitMaximized - sFaction.supply_sum
      local sup = workUnitType.supply_cost
      outCostDigit(nodes[128], nodes[130], sup, sup, limit, 10)
    end
    name = unitNames[object + 1]
    text = unitTexts[object + 1]
    abilityName = localize("<*workTraining>")
  elseif abilityType == 1 then
    local object = ability.data_research
    local gFaction = gameplay.faction[factionId]
    local unavailable = gFaction.researchesUnavailable[object]
    nodes[112].visible = unavailable
    nodes[128].visible = false
    name = researchNames[object + 1]
    text = researchTexts[object + 1]
    abilityName = localize("<*workResearch>")
  elseif abilityType == 2 then
    local object = ability.data_unit
    nodes[128].visible = false
    local workUnitType = gameplay.unitType[object]
    if workUnitType.supplyOn then
      local sup = workUnitType.supply_cost
      if unitType.supplyOn then
        sup = sup - unitType.supply_cost
      end
      if 0 < sup then
        local limit = sFaction.supply_limitMaximized - sFaction.supply_sum
        outCostDigit(nodes[128], nodes[130], sup, sup, limit, 10)
      end
    end
    name = unitNames[object + 1]
    text = unitTexts[object + 1]
    abilityName = localize("<*workTransformation>")
  elseif abilityType == 3 then
    local ec = unitType.createEnvs[ability.data_id]
    local data = workEnvCreateData[ec.tag]
    if data == nil then
      name = ec.tag
      text = ""
    else
      name = envNames[data[1]]
      text = data[2]
    end
    abilityName = localize("<*workEnvsCreate>")
  elseif abilityType == 7 then
    abilityName = localize("<*workUnitCustomAbility>")
    local ue = unitsExtraData[unitTypeId]
    if ue ~= nil and ue.customAbility ~= nil then
      local ca = ue.customAbility[work.ability]
      name = ca[2]
      text = ca[3]
    end
  end
  if iconText ~= nil then
    name = iconText[2]
    text = iconText[3]
  end
  nodes[72].widget_text = abilityName
  nodes[213].widget_setText = name
  nodes[94].widget_text = text
end

function isChatBanned(player)
  local factionId = getPlayerFaction(player)
  if root.session_gameplay_gameplay_faction[factionId].abilities[18] then
    return true
  end
  if playersChatBan[player] == nil then
    return false
  end
  return playersChatBan[player]
end

function getSendResourcesPercent(fromEra, toEra)
  local d = math.abs(toEra - fromEra)
  local p = 20 + 10 * d
  return 100 - p
end

function updateSendResourcesValue(res, value)
  local nodes = interface.nodes
  local sendText = {
    1449,
    1450,
    1455,
    391,
    398
  }
  local recieveText = {
    1456,
    1457,
    1458,
    396,
    399
  }
  local sliders = {
    1441,
    1446,
    1452,
    386,
    397
  }
  local mx = nodes[sliders[res + 1]].widget_max
  if value < 0 or value > mx then
    value = mx
  end
  nodes[sendText[res + 1]].widget_text_text = value
  nodes[sliders[res + 1]].widget_current = value
  nodes[recieveText[res + 1]].widget_text_text = math.floor(value * sendResourcesPercent // 100)
end

function updateSendResourcesWindow()
  local nodes = interface.nodes
  local resources = root.session_gameplay_gameplay_scene[0].faction[sendResourcesFromFaction].treasury_resources
  local r0 = math.floor(resources[0] / 1000)
  local r1 = math.floor(resources[1] / 1000)
  local r2 = math.floor(resources[2] / 1000)
  local r3 = math.floor(resources[3] / 1000)
  local r4 = math.floor(resources[4] / 1000)
  local myEra = getAgeFaction(sendResourcesFromFaction)[1]
  local targetEra = getAgeFaction(sendResourcesToFaction)[1]
  sendResourcesPercent = getSendResourcesPercent(myEra, targetEra)
  nodes[1594].visible = 0 < r0
  nodes[1441].widget_max = r0
  nodes[1593].visible = 0 < r1
  nodes[1446].widget_max = r1
  nodes[1591].visible = 0 < r2
  nodes[1452].widget_max = r2
  nodes[380].visible = 0 < r3
  nodes[386].widget_max = r3
  nodes[374].visible = 0 < r4
  nodes[397].widget_max = r4
  nodes[1445].widget_text = 100 - sendResourcesPercent
  updateSendResourcesValue(0, nodes[1441].widget_current)
  updateSendResourcesValue(1, nodes[1446].widget_current)
  updateSendResourcesValue(2, nodes[1452].widget_current)
  updateSendResourcesValue(3, nodes[386].widget_current)
  updateSendResourcesValue(4, nodes[397].widget_current)
end

function showResourceSendingWindow(player)
  local nodes = interface.nodes
  sendResourcesFromFaction = root.session_visual_currentFaction
  sendResourcesToFaction = getPlayerFaction(player)
  if sendResourcesFromFaction == sendResourcesToFaction then
    nodes[1451].visible = false
    return
  end
  local notOnlyAllies = toBool(root.session_gameplay_gameplay_dataStorage_sendResourcesNotOnlyAllies)
  if not notOnlyAllies and getRelation(root.session_gameplay_gameplay_scene[0].relation, sendResourcesFromFaction, sendResourcesToFaction) ~= 1 then
    nodes[1451].visible = false
    return
  end
  nodes[1451].visible = true
  nodes[1579].disabled = false
  nodes[1274].visible = false
  nodes[74].visible = false
  nodes[1275].visible = false
  nodes[1441].widget_current = 0
  nodes[1449].widget_text_text = "0"
  nodes[1456].widget_text_text = "0"
  nodes[1446].widget_current = 0
  nodes[1450].widget_text_text = "0"
  nodes[1457].widget_text_text = "0"
  nodes[1452].widget_current = 0
  nodes[1455].widget_text_text = "0"
  nodes[1458].widget_text_text = "0"
  nodes[386].widget_current = 0
  nodes[391].widget_text_text = "0"
  nodes[396].widget_text_text = "0"
  nodes[397].widget_current = 0
  nodes[398].widget_text_text = "0"
  nodes[399].widget_text_text = "0"
  updateSendResourcesWindow()
end

function showPlayerWindow(player)
  local nodes = interface.nodes
  nodes[873].visible = true
  nodes[1484].visible = false
  nodes[871].visible = false
  complaintPlayer = player
  writePlayerToWidget(complaintPlayer, nodes[973].widget)
  nodes[874].widget_value = 0
  nodes[868].widget_text_text = ""
  nodes[1410].widget_checked = isChatBanned(player)
  showResourceSendingWindow(player)
end

function onResize()
  local nodes = interface.nodes
  local b = 0
  if nodes[60].visible then
    b = nodes[205].sizeY
  end
  if root.interface_scene_scripts_ready then
    root.interface_scene.f_sendEvent("initOffsets", toJson({bottom = b}))
  end
end

function isUnitTypeBought(unitTypeId)
  local nationId = unitNations[unitTypeId + 1]
  if nationId == nil then
    return true
  end
  local ab = culturesAbilities[nationId]
  if ab == nil then
    return true
  end
  local currentFaction = root.session_visual_currentFaction
  local abilities = root.session_gameplay_gameplay_faction[currentFaction].abilities
  return abilities[ab]
end

function getCommands()
  if canControl then
    return root.session_visual_commands
  else
    return nil
  end
end

function getTeamsVictoryPrediction()
  local teams = {}
  local gameplay = root.session_gameplay_gameplay
  local scene = gameplay.scene[0]
  local factions = gameplay.faction
  local sFactions = scene.faction
  for facId = 0, sFactions.size - 1 do
    local sFaction = sFactions[facId]
    local resources = sFaction.treasury_resources
    local teamId = sFaction.team
    if teams[teamId] == nil then
      teams[teamId] = {
        res = {
          0,
          0,
          0,
          0,
          0
        },
        units = {}
      }
    end
    local team = teams[teamId]
    for i = 1, 5 do
      team.res[i] = team.res[i] + resources[i - 1]
    end
    local unitsStat = factions[facId].statistics_units
    local list = unitsStat.liveConstructedList
    for _, id in ipairs(list) do
      if team.units[id] == nil then
        team.units[id] = 0
      end
      team.units[id] = team.units[id] + unitsStat[id].liveEnabled
    end
  end
  
  function getTeamData(array, teamId)
    local team = teams[teamId]
    table.insert(array, team.res[1])
    table.insert(array, team.res[2])
    table.insert(array, team.res[3])
    table.insert(array, team.res[4])
    table.insert(array, team.res[5])
    for id = 0, gameplay.unitType_size - 1 - 17 do
      if team.units[id] == nil then
        table.insert(array, 0)
      else
        table.insert(array, team.units[id])
      end
    end
  end
  
  local wonderData = fromJson(gameplay.dataStorage_wonderWin)
  local wonder1 = 0
  local wonder2 = 0
  local wonderWin = 0
  if wonderData ~= nil then
    if wonderData.faction <= 9 then
      wonder1 = 1
    else
      wonder2 = 1
    end
    wonderWin = wonderData.finish - gameplay.time
  end
  local arrayCommon = {
    gameplay.time,
    wonderWin
  }
  local arrayTeam1 = {wonder1}
  local arrayTeam2 = {wonder2}
  getTeamData(arrayTeam1, 2)
  getTeamData(arrayTeam2, 3)
  return arrayCommon, arrayTeam1, arrayTeam2
end

function addPredictionNumbers(id)
  assert(predictionTask == nil)
  local ann = root.ann
  local arrayCommon, arrayTeam1, arrayTeam2 = getTeamsVictoryPrediction()
  predictionTask = {
    id,
    ann.task.f_create(0, arrayCommon, arrayTeam1, arrayTeam2),
    ann.task.f_create(0, arrayCommon, arrayTeam2, arrayTeam1)
  }
end

function removeBit(friendly, factionExclude)
  local mask = ~(1 << factionExclude)
  return friendly & mask
end

function addPredictionSpatial(myFaction, enemyFaction, factionExclude)
  local ann = root.ann
  if ann == nil then
    return
  end
  local facs = getAllControlledFactions()
  local scene = root.session_gameplay_gameplay_scene[0]
  local units = scene.units
  local friendly = scene.relation.f_friendly(myFaction) & facs
  local enemies = scene.relation.f_friendly(enemyFaction) & facs
  local neutral = enemies ~ scene.relation.f_notFriendly(myFaction)
  if factionExclude ~= nil then
    friendly = removeBit(friendly, factionExclude)
    enemies = removeBit(enemies, factionExclude)
  end
  units.f_dumpSpatial(-1000000, -1000000, 1000000, 1000000, friendly, enemies, neutral, false, false, false, 1120)
  units.f_dumpSpatial(-1000000, -1000000, 1000000, 1000000, friendly, enemies, neutral, true, false, false, 1120)
  return ann.task.f_create(1, "unitsMap1"), ann.task.f_create(1, "unitsMap2")
end

function readPredictionResult(task1Id, task2Id)
  local ann = root.ann
  local task1 = ann.task[task1Id]
  local task2 = ann.task[task2Id]
  assert(task1 ~= nil)
  assert(task2 ~= nil)
  if task1.state == 3 or task2.state == 3 then
    ann.task.f_release(task1Id)
    ann.task.f_release(task2Id)
    log("Ann: victory prediction error")
    return 0, 0
  elseif task1.state == 2 and task2.state == 2 then
    local v1 = task1.output[1]
    local v2 = 1 - task2.output[1]
    ann.task.f_release(task1Id)
    ann.task.f_release(task2Id)
    return v1, v2
  end
end

function addPredictionLeave()
  if leavePredTasks == nil then
    local fac = root.session_visual_currentFaction
    local players = root.session_gameplay_gameplay.player
    local scene = root.session_gameplay_gameplay_scene[0]
    local factions = scene.faction
    local team = factions[fac].team
    local plSum = 0
    local enemyFac = 0
    for fId = 0, factions.size - 1 do
      local eTeam = factions[fId].team
      if eTeam == team then
        local plId = getPlayerOfFaction(fId)
        local pl = players[plId]
        if not pl.eliminated then
          plSum = plSum + 1
        end
      elseif 1 < eTeam then
        enemyFac = fId
      end
    end
    leavePredTasks = {
      {
        addPredictionSpatial(fac, enemyFac)
      },
      {
        addPredictionSpatial(fac, enemyFac, fac)
      },
      plSum
    }
    interface.nodes[226].visible = true
  end
end

function addPrediction(id)
  if predictionTask ~= nil then
    return false
  end
  if id ~= 1 and victoryPredictions[1] == nil and predictionTask == nil then
    return false
  end
  local scene = root.session_gameplay_gameplay_scene[0]
  if scene.faction_size > 6 then
    predictionTask = {
      id,
      addPredictionSpatial(2, scene.faction_size - 1)
    }
  else
    addPredictionNumbers(id)
  end
  assert(predictionTask ~= nil)
  return true
end

function lerp(v1, v2, k)
  return v1 + k * (v2 - v1)
end

function commandAttack(targetId, weapon, single, attackerType)
  local command = root.session_visual_commands
  if command == nil then
    return
  end
  local vSession = root.session_visual
  local clearTasks = not interface.hotKeys.f_check(addTaskHotKey)
  local gameplay = root.session_gameplay_gameplay
  local target = gameplay.scene[0].units_list[targetId]
  local unitType = gameplay.unitTypeModified[target.typeModified]
  local radius = unitType.radius / 2500
  command.f_attack(clearTasks, targetId, weapon, attackerType, single)
  local createEnvs = unitType.createEnvs
  if 0 < createEnvs.size then
    local tag = createEnvs[0].tag
    if tag:sub(1, 18) == "nature.animal.meat" then
      command.f_gatherAnything(false, 32, 100000, 2, targetId)
    end
  end
  local xg = target.position_x
  local yg = target.position_y
  local zg = gameplay.scene[0].landscape.f_getHeight(xg, yg)
  local onWater = zg ~= nil and underWater(zg)
  local x = vSession.f_coordinateToVisual2(xg)
  local y = vSession.f_coordinateToVisual2(yg)
  vSession.f_createEmitters(0, 1647, radius, true, x, y, 0, 0, 0, 0, "", 0, onWater)
end

function commandMoveAttack(x, y, xg, yg)
  local command = root.session_visual_commands
  if command == nil then
    return
  end
  local vSession = root.session_visual
  local selector = vSession.scene[0].selection_units_list
  if selector.size == 0 then
    return
  end
  local clearTasks = not interface.hotKeys.f_check(addTaskHotKey)
  local zg = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(xg, yg)
  local onWater = zg ~= nil and underWater(zg)
  command.f_moveAgro(clearTasks, xg, yg, -1)
  vSession.f_createEmitters(0, 1641, 1, true, x, y, 0, 0, 0, 0, "", 0, onWater)
end

function getAllControlledFactions()
  local result = 0
  local players = root.session_gameplay_gameplay_player
  for playerId = 0, players.size - 1 do
    local player = players[playerId]
    if not player.eliminated then
      result = result | player.controlledFactions_value
    end
  end
  return result
end

function splitByComma(inputStr)
  local result = {}
  local start = 1
  while true do
    local pos = string.find(inputStr, ",", start, true)
    if not pos then
      table.insert(result, string.sub(inputStr, start))
      break
    end
    table.insert(result, string.sub(inputStr, start, pos - 1))
    start = pos + 1
  end
  return result
end

function hideInterfaces_(hide)
  if root.system_platformName == "web" then
    return
  end
  if hide ~= nil then
    hideInterfaces(hide)
    return
  end
  local nodes = interface.nodes
  local v = nodes[60].visible
  hideInterfaces(v)
end

function updateSurrender(list)
  local sumSur = 0
  local sumTeam = 0
  local controlledPlayer = root.session_gameplay_controlledPlayer
  local controlledTeam = getPlayerTeam(controlledPlayer)
  local players = root.session_gameplay_gameplay_player
  if list ~= nil then
    for plId, _ in pairs(list) do
      if not players[plId].eliminated and getPlayerTeam(plId) == controlledTeam then
        sumSur = sumSur + 1
      end
    end
    iSurrendered = list[controlledPlayer]
  end
  for plId = 0, players.size - 1 do
    if not players[plId].eliminated and getPlayerTeam(plId) == controlledTeam then
      sumTeam = sumTeam + 1
    end
  end
  local nodes = interface.nodes
  teamSurrendered = 0.7 < sumSur / sumTeam
  nodes[231].visible = not teamSurrendered
  nodes[225].visible = teamSurrendered
  nodes[242].visible = not iSurrendered
  nodes[255].visible = iSurrendered
  nodes[256].widget_text = localize("<*surrenderedTeammates/0>") .. sumSur .. localize("<*surrenderedTeammates/1>") .. sumTeam .. localize("<*surrenderedTeammates/2>")
  nodes[182].visible = iSurrendered and leavePredTasks == nil or not nodes[220].visible
end

canPredict = false
local gSes = root.session_gameplay
isModeNetwork = gSes.streamMode == 1
isModeReplay = gSes.streamMode == 2
local nodes = interface.nodes
if toBool(root.session_visual_dataStorage_matchmaking) then
  local gameplay = gSes.gameplay
  local players = gameplay.player_size
  local scene = gameplay.scene[0]
  local sFactions = scene.faction
  local teams = 0
  for plId = 0, players - 1 do
    local func = function(facId)
      local sFaction = sFactions[facId]
      teams = teams | 1 << sFaction.team
    end
    forEachPlayerFaction(plId, func)
  end
  local teamGame = teams == 12
  nodes[220].visible = not isModeReplay and teamGame
  if teamGame then
    local data = root.session_gameplay_gameplay_dataStorage.f_get("surrender")
    if data ~= "" then
      updateSurrender(fromJson(data))
    else
      updateSurrender()
    end
  end
  if isModeReplay then
    do
      local passMapSize = scene.landscape_passability_size
      canPredict = teamGame and passMapSize.x == passMapSize.y and passMapSize.x <= 1120
    end
  end
else
  nodes[220].visible = false
end
if root.ann == nil then
  canPredict = false
end
nodes[102].visible = canPredict
hotKeysResult = {
  id = interfaceId,
  name = localize("<*sessionInterfaceName>"),
  hotKeys = {}
}
local list = fromJson("[" .. localize("<*sessionHotKeysList>") .. "]")
if list ~= nil then
  for _, v in ipairs(list) do
    local name = localize("<*sessionHotKeyName" .. v .. ">")
    table.insert(hotKeysResult.hotKeys, {v, name})
  end
end
hotKeysResult = toJson(hotKeysResult)
