local nodes = interface.nodes
local modShort
if editingModsList == "g" then
  local line = nodes[92].widget_currentLine
  modShort = modsG[line + 1]
else
  local line = nodes[8].widget_currentLine
  modShort = modsV[line + 1]
end
local mod = getEditingMod()
if mod.parameters ~= nil then
  local str = ""
  local b = false
  for val, pp in pairs(mod.parametersParsed) do
    if b then
      str = str .. ","
    end
    b = true
    str = str .. val .. "=" .. pp
  end
  modShort[2] = str
else
  modShort[2] = nodes[270].widget_text_text
end
local code = string.sub(modShort[1], 1, 11)
modsTable[code].parametersStr = modShort[2]
nodes[261].visible = false
markMapNotSaved()
