local initiator = getParameter("initiator")
local scene = root.scene[0]
scene.units_operation.f_transform(initiator, 51)
scene.faction[getParameter("faction")].f_removeBuildPlans()
local b = root.faction[getParameter("faction")].build
b[8].available = false
b[9].available = false
b[10].available = false
b[11].available = false
b[12].available = false
b[13].available = false
b[22].available = false
b[23].available = false
b[68].available = false
b[69].available = false
b[70].available = false
b[15].available = false
b[16].available = false
b[17].available = false
b[18].available = false
b[19].available = false
b[20].available = false
b[21].available = false
b[30].available = false
b[71].available = false
b[72].available = false
b[73].available = false
