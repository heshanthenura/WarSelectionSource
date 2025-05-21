createInterfaces = {}
canAddInterfaces = true
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
replayCode = getParameter("replayCode")
graphicsQuality = {
  {
    fowStyle = 0,
    grassEnabled = false,
    specialDeathAnimations = false,
    submarineSampling = false,
    surf = false,
    waterBuffer = false,
    precipitation = false,
    pixelDisplacement = false,
    normalMaps = false,
    modelsMipLevel = 3,
    animationsInterpolation = false,
    anisotropy = 1,
    bloom = {main = 0, reflection = 0},
    landscape = {
      mipLevel = 4,
      specular = 0,
      method = 0,
      colorPriority = false,
      strength = false
    },
    showParticlesPriorityBlock = 20,
    fog = false,
    occlusion = 0,
    maxLightRadius = 0
  },
  {
    fowStyle = 1,
    grassEnabled = false,
    specialDeathAnimations = false,
    submarineSampling = false,
    surf = false,
    waterBuffer = false,
    precipitation = false,
    pixelDisplacement = false,
    normalMaps = false,
    modelsMipLevel = 2,
    animationsInterpolation = false,
    anisotropy = 1,
    bloom = {main = 1, reflection = 0},
    landscape = {
      mipLevel = 3,
      specular = 0,
      method = 1,
      colorPriority = false,
      strength = false
    },
    showParticlesPriorityBlock = 40,
    fog = true,
    occlusion = 1,
    maxLightRadius = 0
  },
  {
    fowStyle = 1,
    grassEnabled = false,
    specialDeathAnimations = true,
    submarineSampling = false,
    surf = false,
    waterBuffer = false,
    precipitation = true,
    pixelDisplacement = true,
    normalMaps = false,
    modelsMipLevel = 1,
    animationsInterpolation = true,
    anisotropy = 2,
    bloom = {main = 1, reflection = 0},
    landscape = {
      mipLevel = 2,
      specular = 1,
      method = 1,
      colorPriority = false,
      strength = false
    },
    shadow = {
      quality = 2,
      size = {2048, 2048},
      biasMin = 0.005
    },
    reflection = {
      level = 3,
      size = {512, 512}
    },
    showParticlesPriorityBlock = 60,
    fog = true,
    occlusion = 1,
    maxLightRadius = 200
  },
  {
    fowStyle = 1,
    grassEnabled = false,
    specialDeathAnimations = true,
    submarineSampling = true,
    surf = true,
    waterBuffer = true,
    precipitation = true,
    pixelDisplacement = true,
    normalMaps = true,
    modelsMipLevel = 0,
    animationsInterpolation = true,
    anisotropy = 3,
    bloom = {main = 2, reflection = 0},
    landscape = {
      mipLevel = 1,
      specular = 1,
      method = 1,
      colorPriority = true,
      strength = false
    },
    shadow = {
      quality = 2,
      size = {4096, 4096},
      biasMin = 1.0E-4
    },
    reflection = {
      level = 4,
      size = {1024, 1024}
    },
    showParticlesPriorityBlock = 80,
    fog = true,
    occlusion = 1,
    maxLightRadius = 100000
  },
  {
    fowStyle = 2,
    grassEnabled = true,
    specialDeathAnimations = true,
    submarineSampling = true,
    surf = true,
    waterBuffer = true,
    precipitation = true,
    pixelDisplacement = true,
    normalMaps = true,
    modelsMipLevel = 0,
    animationsInterpolation = true,
    anisotropy = 4,
    bloom = {main = 2, reflection = 0},
    landscape = {
      mipLevel = 0,
      specular = 1,
      method = 1,
      colorPriority = true,
      strength = true
    },
    shadow = {
      quality = 2,
      size = {4096, 4096},
      biasMin = 1.0E-4
    },
    reflection = {
      level = 4,
      size = {2048, 2048}
    },
    showParticlesPriorityBlock = 255,
    fog = true,
    occlusion = 2,
    maxLightRadius = 100000
  }
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
unitNames = {}
for i = 0, root.session_gameplay_gameplay_unitType_size + 10 do
  table.insert(unitNames, localize("<*unitName" .. i .. ">"))
end
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
modVars = {}
onTickFuncs = {}
onStartFuncs = {}
onDumpStartFuncs = {}
onSpecialCommandFuncs = {}
onWorkFuncs = {}
onUnitDeathFuncs = {}
specialFunctions = {}

function addFunction(funcs, func, name, var)
  if funcs == nil then
    return
  end
  for _, data in ipairs(funcs) do
    if data[1] == name then
      data[2] = func
      data[3] = var
      return
    end
  end
  table.insert(funcs, {
    name,
    func,
    var
  })
end

function addTickFunction(func, name, var)
  log("Warning: using addTickFunction")
  addFunction(onTickFuncs, func, name, var)
end

function addStartFunction(func, name, var)
  log("Warning: using addStartFunction")
  addFunction(onStartFuncs, func, name, var)
end

function addDumpInitFunction(func, name, var)
  log("Warning: using addDumpInitFunction")
  addFunction(onDumpStartFuncs, func, name, var)
end

function addDumpStartFunction(func, name, var)
  log("Error: using addDumpStartFunction")
  addFunction(onDumpStartFuncs, func, name, var)
end

function addScriptFunction(func, name, var)
  log("Warning: using addScriptFunction")
  addFunction(onSpecialCommandFuncs, func, name, var)
end

function addSpecialCommandFunction(func, name, var)
  log("Error: using addSpecialCommandFunction")
  addFunction(onSpecialCommandFuncs, func, name, var)
end

function addWorkFunction(func, name, var)
  log("Warning: using addWorkFunction")
  addFunction(onWorkFuncs, func, name, var)
end

function addUnitDeathFunction(func, name, var)
  log("Error: using addUnitDeathFunction")
  addFunction(onUnitDeathFuncs, func, name, var)
end

function addSpecialFunction(name, func)
  specialFunctions[name] = func
end

function runSpecialFunction(name, parameters)
  local func = specialFunctions[name]
  if func == nil then
  else
    func(parameters)
  end
end

function addMod(functions, modCode)
  if modCode == nil then
    modCode = getParameter("modCode")
  end
  if modVars[modCode] == nil then
    modVars[modCode] = {}
  end
  mod = {
    var = modVars[modCode],
    onInit = functions.onInit,
    onStart = functions.onStart,
    onDumpStart = functions.onDumpStart,
    onTick = functions.onTick,
    onSpecialCommand = functions.onSpecialCommand,
    onUnitDeath = functions.onUnitDeath,
    onWork = functions.onWork
  }
  if mod.onInit ~= nil and not mod.var.inited__ then
    mod.var.inited__ = true
    local status, error = pcall(mod.onInit, mod.var)
    if not status then
      log("Caught an error in mod-" .. modCode .. " on init:", error)
    end
  end
  if mod.onStart ~= nil then
    addFunction(onStartFuncs, mod.onStart, modCode, mod.var)
  end
  if mod.onTick ~= nil then
    addFunction(onTickFuncs, mod.onTick, modCode, mod.var)
  end
  if mod.onDumpStart ~= nil then
    addFunction(onDumpStartFuncs, mod.onDumpStart, modCode, mod.var)
  end
  if mod.onSpecialCommand ~= nil then
    addFunction(onSpecialCommandFuncs, mod.onSpecialCommand, modCode, mod.var)
  end
  if mod.onUnitDeath ~= nil then
    addFunction(onUnitDeathFuncs, mod.onUnitDeath, modCode, mod.var)
  end
  if mod.onWork ~= nil then
    addFunction(onWorkFuncs, mod.onWork, modCode, mod.var)
  end
end

function initColorScheme()
  local rScene = root.render_scene
  local vScene = root.session_visual_scene[0]
  if vScene == nil then
    return
  end
  local light = vScene.light
  local lightLightColor = light.lightColor
  local lightDarkColor = light.darkColor
  local water = vScene.water
  local waterColor = water.color
  local waterDarkColor = water.darkColor
  local colorLut = root.render_scene_colorLut
  local luminance = root.render_scene_luminance
  local mainBloom = root.render_scene_mainBloom
  local reflectionBloom = root.render_scene_reflectionBloom
  colorLut.preset = "Content/crv/original_like.png"
  luminance.white = 1
  luminance.average = 1
  mainBloom.intensity = 1
  mainBloom.treshold = 0.9
  mainBloom.tresholdSoftness = 0.5
  mainBloom.color_r = 255
  mainBloom.color_g = 255
  mainBloom.color_b = 255
  mainBloom.diffusion = 6.5
  reflectionBloom.intensity = 2
  reflectionBloom.treshold = 1
  reflectionBloom.tresholdSoftness = 0.5
  reflectionBloom.color_r = 255
  reflectionBloom.color_g = 255
  reflectionBloom.color_b = 255
  reflectionBloom.diffusion = 6.5
  colorLut.brightness = -0.065
  colorLut.contrast = 0.21
  lightLightColor.r = 5
  lightLightColor.g = 4.8
  lightLightColor.b = 4.47
  lightDarkColor.r = 0.25
  lightDarkColor.g = 0.25
  lightDarkColor.b = 0.25
  water.level = 515
  water.normalScale1 = 0.00293
  water.normalScale2 = 0.00474
  water.normalScale1 = 0.002767
  water.normalScale2 = 0.004477
  water.normalSpeed1.x = 5.0E-4
  water.normalSpeed1.y = 0.0015
  water.normalSpeed2.x = 3.0E-4
  water.normalSpeed2.y = 0.0025
  water.roughness = 0.14
  water.metalness = 0.99
  water.specularFactor = 0.1
  water.specularNormalsFactor = 1.2
  water.reflectionNormalsFactor = 0.9
end

function setGraphicsQuality(level)
  local s = graphicsQuality[level + 1]
  local q = root.render_quality
  local storage = root.storage
  local notVolFow = tonumber(storage.notVolFow)
  if notVolFow == nil then
    notVolFow = 0
  end
  q.fowStyle = s.fowStyle
  if 1 < q.fowStyle and 0 < notVolFow then
    q.fowStyle = 1
  end
  q.grassEnabled = s.grassEnabled and root.interface.development ~= nil
  root.session_visual_canUseDeathAnimations = s.specialDeathAnimations
  root.session_render_entities_units_canUseAnimationsInterpolation = s.animationsInterpolation
  if s.shadow == nil then
    q.shadow = 0
    q.shadowSize_x = 1
    q.shadowSize_y = 1
  else
    q.shadow = s.shadow.quality
    q.shadowSize_x = s.shadow.size[1]
    q.shadowSize_y = s.shadow.size[2]
    q.shadowBiasMin = s.shadow.biasMin
  end
  if s.reflection == nil then
    q.reflection = 0
    q.reflectionSize_x = 1
    q.reflectionSize_y = 1
  else
    q.reflection = s.reflection.level
    q.reflectionSize_x = s.reflection.size[1]
    q.reflectionSize_y = s.reflection.size[2]
  end
  q.precipitation = s.precipitation
  q.waterBuffer = s.waterBuffer
  q.surfEnabled = s.surf
  q.submarineSampling = s.submarineSampling
  q.pixelDisplacement = s.pixelDisplacement
  q.anisotropy = s.anisotropy
  q.mainBloom = s.bloom.main
  q.reflectionBloom = s.bloom.reflection
  q.landscape_method = s.landscape.method
  q.landscape_colorPriority = s.landscape.colorPriority
  q.landscape_strength = s.landscape.strength
  q.landscape_specular = s.landscape.specular
  q.landscape_mipLevel = s.landscape.mipLevel
  q.modelsMipLevel = s.modelsMipLevel
  q.normalsEnabled = s.normalMaps
  q.showParticlesPriorityBlock = s.showParticlesPriorityBlock
  q.fog = s.fog
  q.occlusion = s.occlusion
  q.maxLightRadius = s.maxLightRadius
  q.shadowBiasScale = 0.005
  q.polygonOffsetFactor = 3
  q.polygonOffsetUnits = 0
  storage.f_set("rQuality", level)
  root.render.f_applyQualityChanges()
  if root.interface ~= nil then
    root.interface.f_sendEvent("graphicsChanged", "")
  end
end

local sound = root.session_visual_sound
sound.maxDistance = 2250
sound.referenceDistance = 450
resourcesFontId = root.render.f_getFont(localize("<*fontFamily>"), 18, 0)
eliminatedPlayers = {}
addTaskHotKey = 0
teamsColors = {
  4278255360,
  4278255615,
  4278190335
}
factionColors = {
  4286545791,
  4292532954,
  4278190335,
  4282384319,
  4294950656,
  4278239231,
  4286513343,
  4294901887,
  4290772736,
  4278255615,
  4286513407,
  4286513152,
  4286562175,
  4294934272,
  4278222847,
  4290707647,
  4278239039,
  4286562239,
  4286562303,
  4278190207,
  4284887859,
  4278255423,
  4286578687,
  4286529535,
  4294934399,
  4282367871,
  4278222783,
  4294902015,
  4294950847,
  4286578559,
  4290772991,
  4290740223,
  4290723647,
  4286578655,
  4290756607,
  4294934527,
  4290740031,
  4282351423,
  4286545919,
  4294901951,
  4294950783,
  4278222592,
  4286545855,
  4290707583,
  4294967231,
  4278239167,
  4282335167,
  4282318911,
  4290756352,
  4278190271,
  4294950911,
  4286562048,
  4282335103,
  4290756479,
  4278222719,
  4278190143,
  4290740159,
  4290772927,
  4286529407,
  4294967040,
  4290772863,
  4286545664,
  4286513279,
  4289921024,
  4290756543
}

function underWater(z)
  return z < 130200
end

function addNotification(id)
  local data = {id = id}
  root.interface.f_sendEvent("notification", toJson(data))
end

function checkResource(resId, resValue, notificationId, time)
  if 10000 < resValue then
    hasResources[resId] = true
  else
    if hasResources[resId] and 10000 < time - outOfResourcesTime[resId] then
      outOfResourcesTime[resId] = time
      addNotification(notificationId)
    end
    hasResources[resId] = false
  end
end

function getRelation(relations, fromFaction, toFaction)
  return relations[fromFaction][toFaction].value
end

function setFactionsColors(byTeams)
  factionColorsByTeam = byTeams
  local gameplay = root.session_gameplay_gameplay
  local vSession = root.session_visual
  local myFaction = vSession.currentFaction
  local factions = vSession.faction
  local relations = gameplay.scene[0].relation
  local myFactionId = vSession.currentFaction
  local myPlayer = getPlayerOfFaction(myFaction)
  local players = gameplay.player
  local myFacs = players[myPlayer].controlledFactions
  local allFactionsUnderControl = 0
  for playerId = 0, players.size - 1 do
    allFactionsUnderControl = allFactionsUnderControl | players[playerId].controlledFactions_value
  end
  for factionId = 0, factions.size - 1 do
    local underControl = allFactionsUnderControl >> factionId & 1 == 1
    local color
    if byTeams and underControl then
      if myFacs[factionId] then
        color = teamsColors[1]
      else
        local rel = getRelation(relations, myFaction, factionId)
        color = teamsColors[rel + 1]
      end
    else
      color = factionColors[factionId + 1]
    end
    factions[factionId].maskColor_value = color
  end
end

function commandAttack(targetId, weapon, single, attackerType)
  local vSession = root.session_visual
  local command = vSession.commands
  if command == nil then
    return
  end
  local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
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

function addInterface(name, path, priority, useMenuScale, parameters)
  if not canAddInterfaces then
    return
  end
  for _, itf in ipairs(createInterfaces) do
    if itf[1] == name then
      log("Attempt to create the interface '" .. name .. "' a second time")
      return
    end
  end
  table.insert(createInterfaces, {
    name,
    path,
    priority,
    useMenuScale,
    parameters
  })
end

function onStartOrDump__()
  canAddInterfaces = false
  local vSession = root.session_visual
  local scene = vSession.scene[0]
  scene.fogOfWar_enabled = true
  scene.fogOfWar_texture = 1015
  root.session.f_startGameplay()
  setFactionsColors(false)
  local interfaces = root.interface
  if interfaces ~= nil then
    local interfaceScale = root.interface_menu_scaleWidgets
    if interfaceScale == nil then
      interfaceScale = root.interface_menuWeb_scaleWidgets
    end
    if interfaceScale == nil then
      interfaceScale = 1
    end
    for _, itf in ipairs(createInterfaces) do
      local scale = 1
      if itf[4] == nil or itf[4] then
        scale = interfaceScale
      end
      local p = {
        itf[2],
        itf[1],
        scale,
        scale
      }
      if itf[5] ~= nil then
        assert(#itf[5] % 2 == 0, itf[1])
        for _, itfd in ipairs(itf[5]) do
          table.insert(p, itfd)
        end
      end
      if interfaces.create ~= nil then
        interfaces.f_create(p)
        interfaces[itf[1]].active = true
        if itf[3] ~= nil then
          interfaces[itf[1]].priority = itf[3]
        end
      end
    end
  end
  local storage = vSession.dataStorage
  storage.f_set("playersLocalId", getParameter("playersLocalId"))
  storage.f_set("matchmaking", getParameter("matchmaking"))
  local playerNames = {}
  local playerRankings = {}
  if getParameter("data") ~= nil then
    local dataInit = fromJson(getParameter("data"))
    for player, playerInit in pairs(dataInit.players) do
      playerNames[player] = playerInit.name
      playerRankings[player] = playerInit.rating
    end
  end
  storage.f_set("playerNames", toJson(playerNames))
  storage.f_set("playerRankings", toJson(playerRankings))
end

function onDumpMain__()
  onStartOrDump__()
  if getParameter("abilities") ~= nil then
    local faction = root.session_gameplay_gameplay_faction[root.session_visual_currentFaction]
    local abilities = getParameter("abilities")
    local ru = faction.researchesUnavailable
    local ok = not ((ru[61] or isAbilityAvailable(abilities, 14)) and (ru[62] or isAbilityAvailable(abilities, 10)) and (ru[63] or isAbilityAvailable(abilities, 8)) and (ru[64] or isAbilityAvailable(abilities, 5)) and (ru[65] or isAbilityAvailable(abilities, 9)) and (ru[67] or isAbilityAvailable(abilities, 7)) and (ru[68] or isAbilityAvailable(abilities, 6)) and (ru[70] or isAbilityAvailable(abilities, 11)) and (ru[71] or isAbilityAvailable(abilities, 30)) and (ru[72] or isAbilityAvailable(abilities, 13))) or ru[73] or isAbilityAvailable(abilities, 12)
    if not ok then
      log("Error! Save game cheat detected!")
      assert(false)
    end
  end
end

function onSpecialCommandMain__()
  local command = getParameter("command")
  if command == "chat" then
    if getParameter("destination") ~= nil and getParameter("text") ~= nil then
      local data = {
        player = getParameter("player"),
        text = getParameter("text"),
        system = getParameter("system"),
        destination = getParameter("destination"),
        font = getParameter("font")
      }
      root.interface.f_sendEvent("chatMessage", toJson(data))
    end
    return
  end
  if command == "surrenderDone" then
    local playerId = getParameter("player")
    root.interface.f_sendEvent("playerSurrender", tostring(playerId))
    return
  end
  if command == "kick" then
    local data = {
      player = getParameter("player"),
      reason = "kick",
      kickPlayer = getParameter("kickPlayer")
    }
    root.interface.f_sendEvent("playerEliminate", toJson(data))
    return
  end
  if command == "serverkick" then
    log("Error SERVER KICK")
    log(getParameters(true))
    local data = {
      player = getParameter("player"),
      reason = "desync"
    }
    root.interface.f_sendEvent("playerEliminate", toJson(data))
    return
  end
  if command == "teamKiller" then
    local data = {
      player = getParameter("player")
    }
    root.interface.f_sendEvent("teamKiller", toJson(data))
    return
  end
  if command == "teamKill" then
    local data = {
      player = getParameter("player"),
      killedFaction = getParameter("killedFaction"),
      unitType = getParameter("unitTypeId"),
      x = getParameter("x"),
      y = getParameter("y")
    }
    root.interface.f_sendEvent("teamKill", toJson(data))
    return
  end
end

function checkErrorFow()
  local time = root.session_gameplay_gameplay_time
  if hasWin == nil and time % 60000 == 0 and root.session_gameplay_streamMode == 1 then
    if root.session_render_fogOfWar_ignore then
      log("Error type S")
    end
    if not root.session_visual_scene[0].hideInFogOfWar then
      log("Error type D")
    end
    if not root.session_visual_scene[0].fogOfWar_enabled then
      log("Error type F")
    end
  end
end

function onTickMain__()
  local gameplay = root.session_gameplay_gameplay
  local vSession = root.session_visual
  local currentFaction = vSession.currentFaction
  local sFaction = gameplay.scene[0].faction[currentFaction]
  local noSupply = sFaction.supply_sum >= sFaction.supply_limitMaximized
  if noSupply and noSupply ~= lastNoSupply then
    addNotification(0)
  end
  lastNoSupply = noSupply
  local time = gameplay.time
  if time % 5000 == 0 then
    vSession.scene[0].factionsMap_update = 1000
  end
  local factionResources = sFaction.treasury_resources
  local r0 = factionResources[0]
  local r1 = factionResources[1]
  local r2 = factionResources[2]
  if root.session_gameplay_streamMode ~= 2 then
    checkResource(1, r0, 4, time)
    checkResource(2, r1, 5, time)
    checkResource(3, r2, 6, time)
  end
  checkErrorFow()
end

function onCommandMoveDefault()
  root.window_cursor = 0
  local vSession = root.session_visual
  local command = vSession.commands
  if command == nil then
    return
  end
  local selector = vSession.scene[0].selection_units_list
  if selector.size == 0 then
    return
  end
  local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
  local x = getParameter("x")
  local y = getParameter("y")
  local xg = getParameter("xg")
  local yg = getParameter("yg")
  local zg = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(xg, yg)
  local onWater = zg ~= nil and underWater(zg)
  command.f_move(clearTasks, xg, yg, getParameter("directiong"))
  vSession.f_createEmitters(0, 1640, 1, true, x, y, 0, 0, 0, 0, "", 0, onWater)
end

function onCommandMove()
  onCommandMoveDefault()
end

function onCommandGatherDefault()
  local vSession = root.session_visual
  local command = vSession.commands
  if command == nil then
    return
  end
  local clearTasks = not vSession.hotKeys.f_check(addTaskHotKey)
  local target = getParameter("target")
  local gEnv = root.session_gameplay_gameplay_scene[0].env[target]
  command.f_gather(clearTasks, target, clearTasks)
  local scale = vSession.envType[gEnv.type].radius / 40
  local xg = gEnv.position_x
  local yg = gEnv.position_y
  local x = vSession.f_coordinateToVisual2(xg)
  local y = vSession.f_coordinateToVisual2(yg)
  local zg = root.session_gameplay_gameplay_scene[0].landscape.f_getHeight(xg, yg)
  local onWater = underWater(zg)
  vSession.f_createEmitters(0, 4, scale, true, x, y, 0, 0, 0, 0, "", 0, onWater)
end

function onCommandGather()
  onCommandGatherDefault()
end

factionsColorsByTeams = false
math.randomseed(os.time())
hasResources = {
  false,
  false,
  false
}
outOfResourcesTime = {
  0,
  0,
  0
}
local storage = root.storage
setGraphicsQuality(tonumber(storage.rQuality))
initColorScheme()
addMod({
  onStart = onStartOrDump__,
  onDumpStart = onDumpMain__,
  onTick = onTickMain__,
  onSpecialCommand = onSpecialCommandMain__
}, "main__V")
