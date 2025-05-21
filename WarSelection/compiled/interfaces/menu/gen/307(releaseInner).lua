if not root.projectLoaded then
  return
end
local parameters = "data={\"players\":{\"1\":{\"specialRights\":" .. account.specialRights .. "\\,\"name\":\"" .. encodeStringJson(account.name) .. "\"\\,\"abilities\":\"" .. account.properties .. "\"}}}"
local json = {
  factions = 6,
  player = 0,
  teams = {
    {
      0,
      2,
      4
    },
    {
      1,
      3,
      5
    }
  },
  players = {
    1,
    2,
    4,
    8,
    16,
    32
  },
  seed = 0,
  scriptParameters = parameters,
  scriptsG = {
    "JnHcuvqS6ga_10",
    "sicpCjwFVT9_8",
    "eMjoqml7Qfb_25"
  },
  scriptsV = {
    "dKsZBCbnhVf_6",
    "i6wtqtGBgid_0",
    "5Qps7gHL1E1_0",
    "t1AxUmZaZ41_1",
    "uKeGCLnotPg_3",
    {
      "mCpWa2x0F7i_8",
      "height=1724,borders=350,maxHeight=1800"
    },
    {
      "mkrXH0nVJC7_5",
      "unitTags=512"
    },
    "JDGR2Xa7qt5_1"
  },
  parametersUrlG = "project/WarSelection/scenes/defaultG.json",
  parametersUrlV = "project/WarSelection/scenes/defaultV.json",
  generatorData = {
    size = {
      cellsize = 16384,
      passability = {
        cellsize = 16,
        offset = nil,
        size = {x = 496, y = 200}
      },
      size = {x = 125, y = 51}
    },
    mapParameters = {
      seed = os.time(),
      startPositions = 2,
      script = {
        name = "MxlDyZcBHia_2",
        parameters = "woodScale=1500,woodSize=45,terrainNoiseScale=850,terrainHeightScale=50,terrainMountainsScale=100000,minDistanceBetween=1500000"
      },
      style = 5,
      symmetry = 2
    }
  }
}
log("Add task to start session sinlge tug of war")
addStartSessionTask("startSingle", toJson(json), root.system_localFolder .. "/replay.rep")
