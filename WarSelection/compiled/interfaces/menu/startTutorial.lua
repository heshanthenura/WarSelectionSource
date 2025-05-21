if not root.projectLoaded then
  return
end
local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
local json = {
  factions = 4,
  player = 0,
  players = {4, 8},
  seed = 0,
  scriptParameters = parameters,
  scriptsG = {
    "JnHcuvqS6ga_10",
    "sicpCjwFVT9_8",
    "6gqH17D5rDl_3",
    "t0RdMqvHcB9_14",
    "PqR6QgyQlHb_4",
    "KgbndOUtoob_10",
    "fIoO5t44ONj_8",
    "NydmBBD9kr6_4",
    "s03TBDxfi55_5",
    "tZJ6M1Yrbn2_11",
    {
      "kdrDA746k9d_4",
      "peacefulFaction=0,agressiveFaction=1,agressiveAmount=100,peacefulAmount=100"
    },
    {
      "X1uVftqwjI9_1",
      "relations='[[null,0,0],[null,1,2],[0,1,1],[1,0,1]]'"
    },
    {
      "PknWbweiKTj_2",
      "faction=0"
    },
    {
      "BkorbliOBbj_2",
      "updatePeriod=5000,blockLevels=8,unitTag=7,territorySize=10000"
    },
    {
      "jz0EOdJFAug_6",
      "smallAmount=10,bigAmount=10"
    }
  },
  scriptsV = {
    "dKsZBCbnhVf_6",
    "i6wtqtGBgid_0",
    "BPoKSILDqIl_3",
    "wFs1okaN4Ng_2",
    "2ls0S3tKDXf_14",
    "uKeGCLnotPg_3",
    {
      "mCpWa2x0F7i_8",
      "height=1724,borders=350"
    },
    {
      "mkrXH0nVJC7_5",
      "unitTags=32"
    },
    "JDGR2Xa7qt5_1",
    {
      "up48OkgDf4d_2",
      "factions=1"
    }
  },
  parametersUrlG = "project/WarSelection/scenes/defaultG.json",
  parametersUrlV = "project/WarSelection/scenes/defaultV.json",
  generatorData = {
    size = {
      cellsize = 16384,
      passability = {
        cellsize = 16,
        offset = nil,
        size = {x = 400, y = 400}
      },
      size = {x = 101, y = 101}
    },
    mapParameters = {
      seed = os.time(),
      startPositions = 2,
      script = {
        name = "T1KvZeyfjb0_9",
        parameters = "woodScale=750,woodSize=50,terrainNoiseScale=1500,terrainHeightScale=100,terrainMountainsScale=2500,minDistanceBetween=1000000"
      },
      style = 5
    }
  }
}
log("Add task to start session tutorial")
addStartSessionTask("startSingle", toJson(json), root.system_localFolder .. "/replay.rep")
root.storage.f_set("tutorialDone", "1")
