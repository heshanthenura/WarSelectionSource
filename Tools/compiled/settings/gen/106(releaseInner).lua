local nodes = interface.nodes
local name = nodes[89].widget_lines[nodes[89].widget_value]
local data = itfData[name]
local hkId = data.hotKeys[nodes[86].widget_currentLine + 1][1]
local itf = root.interface[data.id]
local hks = itf.hotKeys_list[hkId]
local keys = hks.keys
if fixedPressedKeys ~= nil then
  keys.f_clear()
  for v, _ in pairs(fixedPressedKeys) do
    local id = keys.f_create()
    keys[id].value = v
  end
end
hks.doubleClick = nodes[114].widget_checked
updateHotKeysList(data.id, data.hotKeys)
nodes[90].visible = false
nodes[92].visible = false
root.interface[data.id].f_resetHotKeysLabels()
root.interface.f_saveUsersHotKeys()
