local faction = getParameter("faction")
local initiator = getParameter("initiator")
local scene = root.scene[0]
local op = scene.units_operation
op.f_transform(initiator, 11)
op.f_killAll(0, faction)
op.f_killAll(28, faction)
scene.faction[getParameter("faction")].f_removeBuildPlans()
local b = root.faction[getParameter("faction")].build
b[0].available = false
b[1].available = false
b[2].available = false
b[3].available = false
b[4].available = false
b[5].available = false
b[6].available = false
