local mod = getEditingMod()
table.insert(mod.parameters, {
  name = "NewParameter",
  desc = "New parameter description",
  type = 1,
  min = 0,
  max = 1000000000,
  default = 0
})
updateModParameters(mod)
onParameterUpdated()
