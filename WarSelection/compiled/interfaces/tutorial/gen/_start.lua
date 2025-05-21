questWidgets = {
  cameraMove = 2,
  cameraZoom = 3,
  unitsSelect = 4,
  unitsMove = 5,
  unitsGatherBerry = 6,
  unitsGatherWood = 7,
  trainWorkers1 = 8,
  putPlanHouse = 9,
  buildHouse = 10,
  trainWorkers2 = 11,
  trainPathfinder = 12,
  moveMapOnMinimap = 13,
  centerPathfinder = 14,
  openFow = 15,
  collectResources = 16,
  putPlanPit = 17,
  buildPit = 18,
  wariors = 19,
  selectArmy = 20,
  killAnimal1 = 21,
  upgradeWarriors = 22,
  killAnimal2 = 23,
  buildStorage = 24,
  gatherMeat = 25,
  buildStonecutter = 26,
  slingers = 27,
  upgradeSlingers = 43,
  clubbers = 44,
  killMammoth = 28,
  upgradeStonecutter = 29,
  sendInAttackMode = 30,
  defeatEnemy = 31,
  buildTemple = 32,
  changeAge = 33,
  finish = 34
}

function getNodesSession()
  return root.interface_session_nodes
end

function finishQuest(questName)
  if questName == nil then
    return
  end
  local nodes = interface.nodes
  local id = questWidgets[questName]
  if id ~= nil then
    nodes[id].visible = false
  end
  if questName == "trainWorkers1" then
    nodes[37].visible = false
  elseif questName == "putPlanHouse" then
    nodes[38].visible = false
  elseif questName == "moveMapOnMinimap" then
    nodes[36].visible = false
  elseif questName == "centerPathfinder" then
    nodes[39].visible = false
  elseif questName == "collectResources" then
    nodes[40].visible = false
  elseif questName == "selectArmy" then
    nodes[41].visible = false
  elseif questName == "sendInAttackMode" then
    nodes[42].visible = false
  end
end

function startQuest(questName)
  root.session_visual_sound.f_playSound(354, 1)
  local nodes = interface.nodes
  local id = questWidgets[questName]
  if id ~= nil then
    nodes[id].visible = true
  end
  if questName == "putPlanHouse" then
    nodes[38].visible = true
  elseif questName == "moveMapOnMinimap" then
    nodes[36].visible = true
  elseif questName == "centerPathfinder" then
    nodes[39].visible = true
  elseif questName == "collectResources" then
    nodes[40].visible = true
  elseif questName == "selectArmy" then
    nodes[41].visible = true
  elseif questName == "finish" then
    getNodesSession()[1439].visible = true
  end
end

workerImage = root.interface_session_content_image.f_find("unit1.png")
assert(workerImage ~= nil)
