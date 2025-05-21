local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end
local images = interface.content_image

function onEvent(abilityId, time)
  local nodes = interface.nodes
  if abilityId == 2 then
    nodes[4].disabled = true
    if 0 < time then
      abilityDisableTime[1] = time
      nodes[6].visible = true
    end
  elseif abilityId == 21 then
    nodes[16].disabled = true
    if 0 < time then
      abilityDisableTime[7] = time
      nodes[17].visible = true
    end
  elseif abilityId == 23 then
    nodes[19].disabled = true
    if 0 < time then
      abilityDisableTime[9] = time
      nodes[23].visible = true
    end
  elseif abilityId == 25 then
    nodes[28].disabled = true
    if 0 < time then
      abilityDisableTime[11] = time
      nodes[29].visible = true
    end
  elseif abilityId == 28 then
    nodes[2].disabled = true
    if 0 < time then
      abilityDisableTime[13] = time
      nodes[3].visible = true
    end
  end
  for i = 1, 3 do
    local statueId = statuesOnButtons[i]
    if abilityId == statueAbilities[statueId] then
      nodes[statueButtons[i]].disabled = true
      if 0 < time then
        abilityDisableTime[statueAbilitiesId[statueId]] = time
        nodes[statueProgress[i]].visible = true
      end
    end
  end
end

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

function findImageUnit(i)
  return findImage(images, "unit" .. statueUnits[i] .. ".png")
end

function updateStatueButtons()
  local nodes = interface.nodes
  for i = 1, 3 do
    local node = nodes[statueButtons[i]]
    node.visible = statuesOnButtons[i] ~= nil
    if statuesOnButtons[i] ~= nil then
      node.widget_middle_set_normal = statueImages[statuesOnButtons[i]]
    end
  end
end

function updateStatueButtonsTemp()
  local nodes = interface.nodes
  for i = 1, 3 do
    if statuesOnButtonsTemp[i] ~= nil then
      local node = nodes[statueButtonsTemp[i]]
      node.widget_middle_set_normal = statueImages[statuesOnButtonsTemp[i]]
    end
  end
end

statueUnits = {
  251,
  334,
  357,
  383,
  384,
  396,
  399,
  434,
  435
}
statueImages = {
  findImageUnit(1),
  findImageUnit(2),
  findImageUnit(3),
  findImageUnit(4),
  findImageUnit(5),
  findImageUnit(6),
  findImageUnit(7),
  findImageUnit(8),
  findImageUnit(9)
}
statueAbilities = {
  3,
  16,
  17,
  19,
  20,
  22,
  24,
  27,
  29
}
statueAbilitiesId = {
  2,
  3,
  4,
  5,
  6,
  8,
  10,
  12,
  14
}
statueButtonChoose = {
  61,
  31,
  64,
  62,
  65,
  60,
  66,
  69,
  9
}
markerStatueChanged = {
  80,
  81,
  82
}
statueButtons = {
  32,
  33,
  34
}
statueButtonsTemp = {
  74,
  73,
  78
}
statueProgress = {
  35,
  36,
  37
}
