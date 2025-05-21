local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end
buttonsBuildings = {
  1,
  193,
  2,
  3,
  4,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30
}
namesBuildings = {
  197,
  199,
  200,
  201,
  202,
  203,
  204,
  205,
  206,
  207,
  208,
  209,
  210,
  211,
  212,
  213,
  214,
  215,
  216,
  217,
  218,
  219,
  220,
  221,
  224,
  225,
  226,
  227,
  222,
  223
}
buttonsInfantry = {
  31,
  32,
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42,
  43,
  44,
  45,
  46,
  47,
  48,
  49,
  50
}
namesInfantry = {
  258,
  259,
  260,
  261,
  262,
  263,
  264,
  265,
  266,
  267,
  268,
  269,
  270,
  271,
  272,
  273,
  274,
  275,
  276,
  277
}
buttonsTechnic = {
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  58,
  59,
  60,
  61,
  62,
  63,
  64,
  65,
  66,
  67,
  68,
  69,
  70
}
namesTechnic = {
  228,
  229,
  230,
  231,
  232,
  233,
  234,
  235,
  236,
  237,
  238,
  239,
  240,
  241,
  242,
  243,
  244,
  245,
  246,
  247
}
buttonsWater = {
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  78,
  79,
  80
}
namesWater = {
  248,
  249,
  250,
  251,
  252,
  253,
  254,
  255,
  256,
  257
}
buttonsAir = {
  81,
  82,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  90
}
namesAir = {
  278,
  279,
  280,
  281,
  282,
  283,
  284,
  285,
  286,
  287
}

function getNationName(id)
  if id >= #nationNames then
    return "---"
  end
  local r = nationNames[id + 1]
  if type(r) == "string" then
    return r
  end
  return r[1]
end

function getUnitName(typeId)
  local name = unitNames[typeId + 1]
  if name == nil then
    return "Noname"
  end
  return name
end

function getUnitNation(typeId)
  if unitNations == nil then
    return nil
  end
  local nation = unitNations[typeId + 1]
  if nation == nil then
    return nil
  end
  return getNationName(nation)
end

function updateFilteredUnitsComboBox()
  local array = root[unitTypesAddress]
  local nodes = interface.nodes
  local filterText = nodes[189].widget_text_text
  local filterType = nodes[190].widget_value
  local filterGroup = nodes[302].widget_value
  if filterGroup == nil then
    filterGroup = 0
  end
  local node = nodes[191]
  node.widget_dropDown_hideEmptyLines = true
  local lines = node.widget_lines
  lines.f_clear()
  local count = array.size
  node.visible = 0 < count
  local typeId = 0
  while count > typeId do
    local unit = array[typeId]
    if unit ~= nil then
      local movable = unit.movementOn
      local fleet = movable and unit.tilt == 3
      local air = movable and unit.movement_airplaneOn and not fleet
      local ground = movable and not fleet and not air
      if filterType == 0 or filterType == 1 and ground or filterType == 2 and fleet or filterType == 3 and air or filterType == 4 and not movable then
        local name = typeId .. " - " .. getUnitName(typeId)
        if (filterGroup == 0 or unitNations ~= nil and unitNations[typeId + 1] ~= nil and filterGroup == unitNations[typeId + 1] + 1) and string.find(name, filterText, 1, true) ~= nil then
          local nationName = getUnitNation(typeId)
          if nationName ~= nil then
            name = name .. " (" .. nationName .. ")"
          end
          lines.f_create(name)
        else
          lines.f_create()
        end
      else
        lines.f_create()
      end
    else
      lines.f_create()
      count = count + 1
    end
    typeId = typeId + 1
  end
  nodes[192].visible = 0 < filterGroup
  nodes[181].visible = 0 < filterGroup
  buttonsUnits = {}
  if 0 < filterGroup then
    nodes[195].widget_text = nationNames[filterGroup]
    local infantryCount = 0
    local technicCount = 0
    local airCount = 0
    local waterCount = 0
    local buildingCount = 0
    local addUnit = function(widgetImageId, widgetTextId)
      buttonsUnits[widgetImageId] = b
      local w = nodes[widgetImageId]
      w.visible = true
      w.widget_middle_set_normal = unitIcons[b + 1]
      nodes[widgetTextId].widget_text = getUnitName(b)
    end
    local array = root[unitTypesAddress]
    local count = array.size
    b = 0
    while count > b do
      local unit = array[b]
      if unit ~= nil and filterGroup - 1 == unitNations[b + 1] then
        if not unit.movementOn then
          buildingCount = buildingCount + 1
          addUnit(buttonsBuildings[buildingCount], namesBuildings[buildingCount])
        elseif unit.tilt == 3 then
          waterCount = waterCount + 1
          addUnit(buttonsWater[waterCount], namesWater[waterCount])
        elseif unit.movement_airplaneOn then
          airCount = airCount + 1
          addUnit(buttonsAir[airCount], namesAir[airCount])
        elseif unit.radius <= 5000 then
          infantryCount = infantryCount + 1
          addUnit(buttonsInfantry[infantryCount], namesInfantry[infantryCount])
        else
          technicCount = technicCount + 1
          addUnit(buttonsTechnic[technicCount], namesTechnic[technicCount])
        end
      end
      b = b + 1
    end
    nodes[338].visible = 0 < buildingCount
    nodes[337].visible = 0 < infantryCount
    nodes[339].visible = 0 < technicCount
    nodes[336].visible = 0 < waterCount
    nodes[187].visible = 0 < airCount
    for i = buildingCount + 1, #buttonsBuildings do
      nodes[buttonsBuildings[i]].visible = false
    end
    for i = infantryCount + 1, #buttonsInfantry do
      nodes[buttonsInfantry[i]].visible = false
    end
    for i = technicCount + 1, #buttonsTechnic do
      nodes[buttonsTechnic[i]].visible = false
    end
    for i = waterCount + 1, #buttonsWater do
      nodes[buttonsWater[i]].visible = false
    end
    for i = airCount + 1, #buttonsAir do
      nodes[buttonsAir[i]].visible = false
    end
  end
  node.widget_value = selectedUnit
end

function onUnitChoose()
  local nodes = interface.nodes
  selectedUnit = nodes[191].widget_value
  assert(selectedUnit ~= nil)
  assert(root[unitTypesAddress][selectedUnit] ~= nil)
  root.interface[parentInterface].f_sendEvent("selectedUnitType", tostring(selectedUnit))
end

function findImage(images, name)
  local id = images.f_find(name)
  if id == nil then
    log("Can't find image for '" .. name .. "'")
    return nil
  end
  if id == nil or images[id] == nil then
    log("interface." .. interfaceId .. ".content.image: No image with id=" .. id .. " (name=" .. name .. ")")
  end
  return id
end
