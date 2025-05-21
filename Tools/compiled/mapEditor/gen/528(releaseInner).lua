local nodes = interface.nodes
nodes[518].visible = false
log("Updating mod-" .. editingModCode)
local mod = getEditingMod()
nodes[539].visible = false
assert(mod.releaseVersion ~= nil)
mod.version = mod.releaseVersion
hasModNewVersion = hasModNewVersion - 1
nodes[536].visible = hasModNewVersion > 0
local mods
if mod.type == 0 then
  mods = modsG
else
  mods = modsV
end
for _, modData in ipairs(mods) do
  local code = string.sub(modData[1], 1, 11)
  if code == editingModCode then
    modData[1] = code .. "_" .. mod.version
  end
end
markMapNotSaved()
