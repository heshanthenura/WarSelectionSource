local size = getParameter("size")
if size == "2x2" then
  startMatchFinding(5)
elseif size == "big" then
  startMatchFinding(1, 2)
else
  startMatchFinding(1, 0)
end
