local mod = getEditingMod()
table.remove(mod.parameters, editingParameterId)
updateModParameters(mod)
onParameterUpdated()
