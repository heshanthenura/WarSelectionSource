local nodes = interface.nodes
local code
if editingModsList == "g" then
  local w = nodes[92].widget
  local line = w.currentLine
  if line == nil then
    return
  end
  w.lines.f_remove(line)
  code = string.sub(modsG[line + 1][1], 1, 11)
  table.remove(modsG, line + 1)
  w.currentLine = nil
else
  local w = nodes[8].widget
  local line = w.currentLine
  if line == nil then
    return
  end
  w.lines.f_remove(line)
  code = string.sub(modsV[line + 1][1], 1, 11)
  table.remove(modsV, line + 1)
  w.currentLine = nil
end
nodes[272].visible = false
local mod = modsTable[code]
if mod.releaseVersion == nil then
  notReleasedAttached = notReleasedAttached - 1
  nodes[470].visible = notReleasedAttached > 0
elseif mod.version ~= mod.releaseVersion then
  hasModNewVersion = hasModNewVersion - 1
  nodes[536].visible = 0 < hasModNewVersion
end
modsTable[code] = nil
markMapNotSaved()
