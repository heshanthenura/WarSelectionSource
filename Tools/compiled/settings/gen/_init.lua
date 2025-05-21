local interfaceName = getParameter("interfaceName")
if interfaceName ~= nil then
  interfaceId = root.interface.f_getIndex(interfaceName)
end
hotKeyNames = {
  [32] = "Space",
  [39] = "'",
  [44] = ",",
  [45] = "-",
  [46] = ".",
  [47] = "/",
  [48] = "0",
  [49] = "1",
  [50] = "2",
  [51] = "3",
  [52] = "4",
  [53] = "5",
  [54] = "6",
  [55] = "7",
  [56] = "8",
  [57] = "9",
  [59] = ";",
  [61] = "=",
  [65] = "A",
  [66] = "B",
  [67] = "C",
  [68] = "D",
  [69] = "E",
  [70] = "F",
  [71] = "G",
  [72] = "H",
  [73] = "I",
  [74] = "J",
  [75] = "K",
  [76] = "L",
  [77] = "M",
  [78] = "N",
  [79] = "O",
  [80] = "P",
  [81] = "Q",
  [82] = "R",
  [83] = "S",
  [84] = "T",
  [85] = "U",
  [86] = "V",
  [87] = "W",
  [88] = "X",
  [89] = "Y",
  [90] = "Z",
  [91] = "[",
  [92] = "\\",
  [93] = "]",
  [96] = "~",
  [256] = "Esc",
  [257] = "Enter",
  [258] = "Tab",
  [259] = "Backspace",
  [260] = "Insert",
  [261] = "Delete",
  [262] = "Right",
  [263] = "Left",
  [264] = "Down",
  [265] = "Up",
  [266] = "Page up",
  [267] = "Page down",
  [268] = "Home",
  [269] = "End",
  [280] = "Caps lock",
  [281] = "Scroll lock",
  [282] = "Num lock",
  [283] = "Print screen",
  [284] = "Pause",
  [290] = "F1",
  [291] = "F2",
  [292] = "F3",
  [293] = "F4",
  [294] = "F5",
  [295] = "F6",
  [296] = "F7",
  [297] = "F8",
  [298] = "F9",
  [299] = "F10",
  [300] = "F11",
  [301] = "F12",
  [340] = "Shift",
  [341] = "Ctrl",
  [342] = "Alt",
  [344] = "Shift",
  [345] = "Ctrl",
  [346] = "Alt"
}
dblPrs = {
  localize("<*doublePressKey/0>"),
  localize("<*doublePressKey/1>")
}
pingMsTxt = {
  localize("<*currentPingMs/0>"),
  localize("<*currentPingMs/1>")
}

function toBool(v, default)
  local t = type(v)
  if t == "boolean" then
    return v
  end
  if t == "number" then
    return v ~= 0
  end
  if t == "string" then
    if v == "true" then
      return true
    end
    local n = tonumber(v)
    return n ~= nil and n ~= 0
  end
  if default == nil then
    return false
  end
  return default
end

function setGamma(value)
  local colorLut = root.render_scene_colorLut
  if colorLut == nil then
    return
  end
  colorLut.gamma = value / 100
  root.storage.f_set("gamma2", value)
end

function getHotKey(hotKeyId, interfaceId)
  local itf = interface
  if itf == nil then
    return "Error"
  end
  local keysList = itf.hotKeys_list[hotKeyId]
  if keysList == nil then
    return "No hot keys"
  end
  local keys = keysList.keys
  local sz = keys.size
  assert(0 < sz)
  local key = keys[0].value
  local result = hotKeyNames[key]
  if result == nil then
    return "Unknown"
  end
  for i = 1, sz - 1 do
    local key = keys[i].value
    result = result .. " + " .. hotKeyNames[key]
  end
  if keysList.doubleClick then
    result = dblPrs[1] .. result .. dblPrs[2]
  end
  return result
end

function calcInterfaceScaleAuto()
  local res = root.window_height / 1080
  if res < 0.5 then
    res = 0.5
  end
  if 2 < res then
    res = 2
  end
  return res
end

function setScaleWidget()
  local v = tonumber(root.storage_interfaceScale)
  if v < 1 then
    v = (v - 0.5) * 100
  else
    v = v * 50
  end
  v = math.floor(v)
  local nodes = interface.nodes
  nodes[24].widget_current = v
end

function setInterfaceScale(setValue)
  assert(setValue ~= nil)
  root.storage.f_set("interfaceScale", setValue)
  root.interface.f_setScale(setValue, setValue)
end

function updateHotKeysList(interfaceId, hotKeys)
  local nodes = interface.nodes
  local lines = nodes[86].widget_lines
  lines.f_clear()
  for _, v in ipairs(hotKeys) do
    lines.f_create(v[2] .. ": " .. getHotKey(v[1], interfaceId))
  end
end

root.interface.f_sendEvent("soundVolume", root.storage.soundVolume)
root.interface.f_sendEvent("musicVolume", root.storage.musicVolume)
