local nodes = interface.nodes
local value = getParameter("value")
nodes[272].visible = true
editingModsList = getParameter("list")
local modStr, mods
if editingModsList == "g" then
  assert(value < #modsG)
  modStr = modsG[value + 1]
  nodes[8].widget_currentLine = nil
else
  assert(value <= #modsV)
  modStr = modsV[value + 1]
  nodes[92].widget_currentLine = nil
end
editingModCode = string.sub(modStr[1], 1, 11)
local mod = getEditingMod()
nodes[253].widget_text_text = "mod-" .. editingModCode
if mod.parameters == nil then
  nodes[270].visible = true
  nodes[695].visible = false
  nodes[270].widget_text_text = mod.parametersStr
else
  nodes[270].visible = false
  nodes[695].visible = true
  nodes[690].visible = false
  local lines = nodes[693].widget_lines
  lines.f_clear()
  for _, p in ipairs(mod.parameters) do
    lines.f_create(p.name)
  end
end
nodes[261].visible = false
nodes[539].visible = mod.version ~= mod.releaseVersion and mod.releaseVersion ~= nil
nodes[7].widget_text = mod.name
nodes[251].widget_text = mod.description
nodes[518].visible = false
