if not canControl then
  return
end
if not getParameter("pressed") then
  return
end
if trySendSignal(getParameter("x"), getParameter("y"), "moveLandscape") then
  return
end
local x, y, xg, yg = getPosition(getParameter("x"), getParameter("y"))
local data = {
  button = "right",
  x = x,
  y = y,
  xg = xg,
  yg = yg
}
root.interface.f_sendEvent("minimapPress", toJson(data))
