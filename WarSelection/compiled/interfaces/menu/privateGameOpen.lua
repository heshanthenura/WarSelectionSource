local nodes = interface.nodes
if not nodes[1241].widget_checked then
  mapCode = nil
end
local reg = nodes[376].widget_value
root.storage.f_set("privateRegion", reg)
if reg == 0 then
  reg = "auto"
elseif reg == 1 then
  reg = "europe"
elseif reg == 2 then
  reg = "asia"
elseif reg == 3 then
  reg = "america"
end
local json = {
  cmd = 0,
  version = getVersionArray(),
  make = {
    name = nodes[218].widget_text_text,
    mapCode = mapCode,
    region = reg,
    maxPlayers = 40,
    parametersUrlG = "project/WarSelection/scenes/defaultG.json",
    parametersUrlV = "project/WarSelection/scenes/defaultV.json",
    generatorData = {
      size = {
        cellsize = 16384,
        passability = {
          cellsize = 16,
          offset = nil,
          size = {x = 1624, y = 1624}
        },
        size = {x = 407, y = 407}
      },
      mapParameters = {
        seed = os.time(),
        startPositions = 40,
        script = {
          name = "T1KvZeyfjb0_9",
          parameters = "woodScale=750,woodSize=50,terrainNoiseScale=750,terrainHeightScale=300,terrainMountainsScale=2500"
        },
        style = 5
      }
    },
    scriptsV = {
      "dKsZBCbnhVf_6",
      "i6wtqtGBgid_0"
    },
    scriptsG = {
      "JnHcuvqS6ga_10",
      "sicpCjwFVT9_8"
    }
  }
}
local addResInit = function(startResources)
  local res = {
    100,
    250,
    0
  }
  if startResources == 1 then
    res = {
      1000,
      1000,
      1000
    }
  elseif startResources == 2 then
    res = {
      10000,
      10000,
      10000
    }
  elseif startResources == 3 then
    res = {
      100000,
      100000,
      100000
    }
  elseif startResources == 4 then
    res = {
      1000000,
      1000000,
      1000000
    }
  end
  table.insert(json.make.scriptsG, {
    "KgbndOUtoob_10",
    "res0=" .. res[1] .. ",res1=" .. res[2] .. ",res2=" .. res[3]
  })
end
local addAnimals = function()
  local animals = 100
  local an = nodes[407].widget_value
  if an == 1 then
    animals = 50
  elseif an == 2 then
    animals = 100
  elseif an == 3 then
    animals = 200
  else
    animals = 0
  end
  table.insert(json.make.scriptsG, {
    "kdrDA746k9d_4",
    "peacefulFaction=0,agressiveFaction=1,agressiveAmount=" .. animals .. ",peacefulAmount=100"
  })
  table.insert(json.make.scriptsG, {
    "X1uVftqwjI9_1",
    "relations='[[null,0,0],[null,1,2],[0,1,1],[1,0,1]]'"
  })
end

function addMapGen(mapSize)
  if mapSize == 0 then
    json.make.maxPlayers = playersCountPrivate[1]
    json.make.generatorData.size.passability.size = {x = 544, y = 544}
    json.make.generatorData.size.size = {x = 137, y = 137}
    json.make.generatorData.mapParameters.startPositions = playersCountPrivate[1]
    json.make.generatorData.mapParameters.script.parameters = "woodScale=750,woodSize=50,terrainNoiseScale=1500,terrainHeightScale=145,terrainMountainsScale=2500,minDistanceBetween=500000"
  elseif mapSize == 1 then
    json.make.maxPlayers = playersCountPrivate[2]
    json.make.generatorData.size.passability.size = {x = 672, y = 672}
    json.make.generatorData.size.size = {x = 169, y = 169}
    json.make.generatorData.mapParameters.startPositions = playersCountPrivate[2]
    json.make.generatorData.mapParameters.script.parameters = "woodScale=750,woodSize=50,terrainNoiseScale=1350,terrainHeightScale=150,terrainMountainsScale=2500,minDistanceBetween=500000"
  elseif mapSize == 2 then
    json.make.maxPlayers = playersCountPrivate[3]
    json.make.generatorData.size.passability.size = {x = 768, y = 768}
    json.make.generatorData.size.size = {x = 193, y = 193}
    json.make.generatorData.mapParameters.startPositions = playersCountPrivate[3]
    json.make.generatorData.mapParameters.script.parameters = "woodScale=750,woodSize=50,terrainNoiseScale=1250,terrainHeightScale=165,terrainMountainsScale=2500,minDistanceBetween=500000"
  elseif mapSize == 3 then
    json.make.maxPlayers = playersCountPrivate[4]
    json.make.generatorData.size.passability.size = {x = 960, y = 960}
    json.make.generatorData.size.size = {x = 241, y = 241}
    json.make.generatorData.mapParameters.startPositions = playersCountPrivate[4]
    json.make.generatorData.mapParameters.script.parameters = "woodScale=750,woodSize=50,terrainNoiseScale=1100,terrainHeightScale=190,terrainMountainsScale=2500,minDistanceBetween=500000"
  elseif mapSize == 4 then
    json.make.maxPlayers = playersCountPrivate[5]
    json.make.generatorData.size.passability.size = {x = 1120, y = 1120}
    json.make.generatorData.size.size = {x = 281, y = 281}
    json.make.generatorData.mapParameters.startPositions = playersCountPrivate[5]
    json.make.generatorData.mapParameters.script.parameters = "terrainNoiseScale=1000,terrainHeightScale=225,terrainMountainsScale=2500,minDistanceBetween=500000"
  elseif mapSize == 5 then
    json.make.maxPlayers = playersCountPrivate[6]
    json.make.generatorData.size.passability.size = {x = 1400, y = 1400}
    json.make.generatorData.size.size = {x = 351, y = 351}
    json.make.generatorData.mapParameters.startPositions = playersCountPrivate[6]
    json.make.generatorData.mapParameters.script.parameters = "terrainNoiseScale=900,terrainHeightScale=270,terrainMountainsScale=2500,minDistanceBetween=500000"
  end
end

if privateMode == "standard" then
  addMapGen(nodes[310].widget_value)
  table.insert(json.make.scriptsV, "BPoKSILDqIl_3")
  table.insert(json.make.scriptsV, "wFs1okaN4Ng_2")
  table.insert(json.make.scriptsV, "AfAIhxPztX1_7")
  table.insert(json.make.scriptsV, "uKeGCLnotPg_3")
  table.insert(json.make.scriptsV, {
    "up48OkgDf4d_2",
    "factions=1"
  })
  table.insert(json.make.scriptsG, "6gqH17D5rDl_3")
  table.insert(json.make.scriptsG, "t0RdMqvHcB9_14")
  table.insert(json.make.scriptsG, "PqR6QgyQlHb_4")
  table.insert(json.make.scriptsG, "NydmBBD9kr6_4")
  table.insert(json.make.scriptsG, "ElhWb6xYoj7_5")
  table.insert(json.make.scriptsG, {
    "jz0EOdJFAug_6",
    "smallAmount=10,bigAmount=10"
  })
  table.insert(json.make.scriptsG, "vUzAsp5omY9_11")
  table.insert(json.make.scriptsG, "Am5eQZtzjYd_8")
  local defeatCondition = nodes[366].widget_value
  if defeatCondition == 1 then
    table.insert(json.make.scriptsG, {
      "GOkEjX0t3G0_10",
      "specialUnit=397,trainWorkers=2"
    })
  else
    table.insert(json.make.scriptsG, {
      "GOkEjX0t3G0_10",
      "specialUnit=313,trainWorkers=2"
    })
  end
  addAnimals()
  table.insert(json.make.scriptsG, {
    "PknWbweiKTj_2",
    "faction=0"
  })
  addResInit(nodes[454].widget_value)
  if nodes[271].widget_checked then
    table.insert(json.make.scriptsG, "iZvDVNV7Aok_4")
  end
  if nodes[62].widget_value < 6 then
    table.insert(json.make.scriptsG, {
      "coz0zyLx4Md_1",
      "finalAge=" .. nodes[62].widget_value
    })
  end
  if nodes[149].widget_checked then
    table.insert(json.make.scriptsG, "4Kdob459gog_0")
  else
    table.insert(json.make.scriptsV, "VWZoanUldR4_5")
    table.insert(json.make.scriptsG, {
      "QmBfycUvwsi_4",
      "timeToWin=1800,minWinMoment=5400"
    })
  end
  if nodes[746].widget_checked then
    table.insert(json.make.scriptsG, {
      "fIoO5t44ONj_8",
      "limit=200"
    })
  else
    table.insert(json.make.scriptsG, {
      "fIoO5t44ONj_8"
    })
  end
  if culturesAvailable > 0 then
    table.insert(json.make.scriptsG, {
      "RyYmGF3DPQc_5",
      "cultures=" .. culturesAvailable
    })
  end
  if nodes[606].widget_checked then
    json.make.teamMatch = true
    json.make.generatorData.mapParameters.symmetry = nodes[1637].widget_value
    if json.make.generatorData.mapParameters.symmetry == 7 then
      json.make.generatorData.mapParameters.symmetry = math.random(6) + 1
    end
  end
  table.insert(json.make.scriptsG, {
    "BkorbliOBbj_2",
    "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
  })
  table.insert(json.make.scriptsG, {
    "osemAL0QGYe_7",
    "waitingTime=180"
  })
  table.insert(json.make.scriptsG, "WvyVbqp8LDf_4")
  table.insert(json.make.scriptsG, "3Pde611Zkqc_1")
  table.insert(json.make.scriptsG, "j8igMH4shZc_1")
  table.insert(json.make.scriptsG, "H0GMSbNnlg0_2")
  table.insert(json.make.scriptsG, {
    "X6OqsoSYnB2_7",
    "onlyAllies=" .. tostring(not nodes[280].widget_checked)
  })
  table.insert(json.make.scriptsG, "6OzC814a3Re_2")
  if not nodes[392].widget_checked then
    table.insert(json.make.scriptsV, "fBB0HwHlfzd_19")
    table.insert(json.make.scriptsG, "lFMtjJTcyml_11")
  end
  if nodes[604].widget_checked then
    table.insert(json.make.scriptsV, "xgLv68dj9V6_0")
    table.insert(json.make.scriptsG, "bxRNf7V9y4f_3")
  end
  local defeatCondition = nodes[366].widget_value
  if defeatCondition == 0 then
    table.insert(json.make.scriptsG, "Rgi6rNgLAmd_5")
  elseif defeatCondition == 1 then
    table.insert(json.make.scriptsG, "caKgiwj8lh8_5")
  else
    assert(false)
  end
elseif privateMode == "survival" then
  addMapGen()
  json.make.maxPlayers = 4
  json.make.generatorData.size.passability.size = {x = 1624, y = 1624}
  json.make.generatorData.size.size = {x = 407, y = 407}
  json.make.generatorData.mapParameters.startPositions = 62
  json.make.generatorData.mapParameters.script.parameters = "woodScale=750,woodSize=50,terrainNoiseScale=750,terrainHeightScale=300,terrainMountainsScale=2500"
  table.insert(json.make.scriptsV, "BPoKSILDqIl_3")
  table.insert(json.make.scriptsV, "wFs1okaN4Ng_2")
  table.insert(json.make.scriptsV, "AfAIhxPztX1_7")
  table.insert(json.make.scriptsV, "uKeGCLnotPg_3")
  table.insert(json.make.scriptsV, "VWZoanUldR4_5")
  table.insert(json.make.scriptsV, {
    "up48OkgDf4d_2",
    "factions=1"
  })
  local difficulty = nodes[822].widget_value
  local animals = getDifficultyAnimals(difficulty)
  table.insert(json.make.scriptsG, "6gqH17D5rDl_3")
  table.insert(json.make.scriptsG, "PqR6QgyQlHb_4")
  table.insert(json.make.scriptsG, "KgbndOUtoob_10")
  table.insert(json.make.scriptsG, "NydmBBD9kr6_4")
  table.insert(json.make.scriptsG, "s03TBDxfi55_5")
  table.insert(json.make.scriptsG, {
    "kdrDA746k9d_4",
    "peacefulFaction=0,agressiveFaction=1,agressiveAmount=" .. animals .. ",peacefulAmount=300"
  })
  table.insert(json.make.scriptsG, {
    "X1uVftqwjI9_1",
    "relations='[[null,0,0],[null,1,2],[0,1,1],[1,0,1]]'"
  })
  table.insert(json.make.scriptsG, {
    "J3v7snqXfl7_10",
    "difficulty=" .. difficulty
  })
  table.insert(json.make.scriptsG, {
    "GOkEjX0t3G0_10",
    "trainWorkers=2"
  })
  table.insert(json.make.scriptsG, "Rgi6rNgLAmd_5")
  table.insert(json.make.scriptsG, {
    "PknWbweiKTj_2",
    "faction=0"
  })
  table.insert(json.make.scriptsG, {
    "QmBfycUvwsi_4",
    "timeToWin=600"
  })
  table.insert(json.make.scriptsG, {
    "BkorbliOBbj_2",
    "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
  })
  table.insert(json.make.scriptsG, {
    "osemAL0QGYe_7",
    "waitingTime=180"
  })
  table.insert(json.make.scriptsG, "X6OqsoSYnB2_7")
  table.insert(json.make.scriptsG, "6OzC814a3Re_2")
  table.insert(json.make.scriptsG, {
    "jz0EOdJFAug_6",
    "smallAmount=10,bigAmount=10"
  })
  table.insert(json.make.scriptsG, "Am5eQZtzjYd_8")
  if not nodes[392].widget_checked then
    table.insert(json.make.scriptsV, "fBB0HwHlfzd_19")
    table.insert(json.make.scriptsG, "lFMtjJTcyml_11")
  end
  table.insert(json.make.scriptsG, {
    "fIoO5t44ONj_8",
    "limit=200"
  })
  if nodes[62].widget_value < 6 then
    table.insert(json.make.scriptsG, {
      "coz0zyLx4Md_1",
      "finalAge=" .. nodes[62].widget_value
    })
  end
elseif privateMode == "sandbox" then
  addMapGen(nodes[310].widget_value)
  table.insert(json.make.scriptsV, "BPoKSILDqIl_3")
  table.insert(json.make.scriptsV, "wFs1okaN4Ng_2")
  table.insert(json.make.scriptsV, {
    "nz4SD1WAHyj_0",
    "creatingUnits=" .. boolToStr(nodes[382].widget_checked)
  })
  if nodes[384].widget_checked then
    table.insert(json.make.scriptsV, "UV9nJd7KPS8_1")
  end
  table.insert(json.make.scriptsV, "AfAIhxPztX1_7")
  table.insert(json.make.scriptsV, "uKeGCLnotPg_3")
  table.insert(json.make.scriptsV, {
    "up48OkgDf4d_2",
    "factions=1"
  })
  table.insert(json.make.scriptsG, "6gqH17D5rDl_3")
  table.insert(json.make.scriptsG, "t0RdMqvHcB9_14")
  table.insert(json.make.scriptsG, "PqR6QgyQlHb_4")
  table.insert(json.make.scriptsG, "NydmBBD9kr6_4")
  table.insert(json.make.scriptsG, "s03TBDxfi55_5")
  table.insert(json.make.scriptsG, "lGn8Ivf5qmb_3")
  table.insert(json.make.scriptsG, {
    "jz0EOdJFAug_6",
    "smallAmount=10,bigAmount=10"
  })
  table.insert(json.make.scriptsG, "Am5eQZtzjYd_8")
  if nodes[381].widget_checked then
    table.insert(json.make.scriptsG, "lUA74NKbZSf_2")
  end
  table.insert(json.make.scriptsG, {
    "GOkEjX0t3G0_10",
    "trainWorkers=2"
  })
  addAnimals()
  table.insert(json.make.scriptsG, {
    "PknWbweiKTj_2",
    "faction=0"
  })
  addResInit(nodes[454].widget_value)
  if nodes[386].widget_checked then
    table.insert(json.make.scriptsG, {
      "fIoO5t44ONj_8",
      "limit=10000"
    })
  else
    table.insert(json.make.scriptsG, {
      "fIoO5t44ONj_8"
    })
  end
  if nodes[383].widget_checked then
    table.insert(json.make.scriptsG, {
      "IOGEe1vh385_1",
      "percent=2000"
    })
  end
  if nodes[385].widget_checked then
    table.insert(json.make.scriptsG, {
      "325s8mFhB5f_1",
      "percent=2000"
    })
  end
  table.insert(json.make.scriptsG, {
    "BkorbliOBbj_2",
    "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
  })
  table.insert(json.make.scriptsG, {
    "osemAL0QGYe_7",
    "waitingTime=180"
  })
  if not nodes[392].widget_checked then
    table.insert(json.make.scriptsV, "fBB0HwHlfzd_19")
    table.insert(json.make.scriptsG, "lFMtjJTcyml_11")
  end
elseif privateMode == "tugofwar" then
  addMapGen()
  json.make.teamMatch = true
  json.make.maxPlayers = 6
  json.make.generatorData.size.passability.size = {x = 496, y = 200}
  json.make.generatorData.size.size = {x = 125, y = 51}
  json.make.generatorData.mapParameters.startPositions = 2
  json.make.generatorData.mapParameters.script.name = "MxlDyZcBHia_2"
  json.make.generatorData.mapParameters.script.parameters = "woodScale=1500,woodSize=45,terrainNoiseScale=850,terrainHeightScale=50,terrainMountainsScale=100000,minDistanceBetween=1500000"
  json.make.generatorData.mapParameters.symmetry = 2
  table.insert(json.make.scriptsV, "5Qps7gHL1E1_0")
  table.insert(json.make.scriptsV, "t1AxUmZaZ41_1")
  table.insert(json.make.scriptsV, "uKeGCLnotPg_3")
  table.insert(json.make.scriptsG, "eMjoqml7Qfb_25")
  table.insert(json.make.scriptsG, {
    "osemAL0QGYe_7",
    "waitingTime=180"
  })
  table.insert(json.make.scriptsV, {
    "mkrXH0nVJC7_5",
    "unitTags=512"
  })
elseif privateMode == "horde" then
  addMapGen()
  json.make.maxPlayers = 16
  json.make.generatorData.size.passability.size = {x = 1200, y = 1200}
  json.make.generatorData.size.size = {x = 301, y = 301}
  json.make.generatorData.mapParameters.startPositions = 62
  json.make.generatorData.mapParameters.script.parameters = "woodScale=1000,woodSize=50,terrainNoiseScale=10000,terrainHeightScale=75,terrainMountainsScale=2000"
  local bots = nodes[859].widget_value
  table.insert(json.make.scriptsV, "BPoKSILDqIl_3")
  table.insert(json.make.scriptsV, "kre2YStMyCj_19")
  table.insert(json.make.scriptsV, "0gWl6YH1EDe_4")
  table.insert(json.make.scriptsV, {
    "mCpWa2x0F7i_8",
    "height=1500,maxHeight=3000"
  })
  table.insert(json.make.scriptsG, "6gqH17D5rDl_3")
  table.insert(json.make.scriptsG, "NydmBBD9kr6_4")
  table.insert(json.make.scriptsG, "l5ib3BJVr9i_22")
  if 0 < bots then
    table.insert(json.make.scriptsG, {
      "HWAIvxsaH9l_2",
      "weakBots=" .. tostring(bots == 1)
    })
  end
  table.insert(json.make.scriptsG, "Ov2UKssPOBi_7")
else
  assert(false)
end
if privateMode ~= "horde" then
  table.insert(json.make.scriptsV, {
    "mCpWa2x0F7i_8",
    "height=1724,borders=350"
  })
  if privateMode ~= "tugofwar" then
    table.insert(json.make.scriptsV, {
      "mkrXH0nVJC7_5",
      "unitTags=32"
    })
  end
end
table.insert(json.make.scriptsV, "JDGR2Xa7qt5_1")
if root.lobby.f_sendCommand(16, toJson(json)) then
  disablePanel(13)
  nodes[63].disabled = true
else
  showError(localize("<*menuErrorNoLobby>"))
end
