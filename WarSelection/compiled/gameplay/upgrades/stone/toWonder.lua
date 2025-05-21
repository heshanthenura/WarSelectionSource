local faction = getParameter("faction")
local initiator = getParameter("initiator")
local op = root.scene[0].units_operation
op.f_transform(initiator, 200)
op.f_killAll(0, faction)
