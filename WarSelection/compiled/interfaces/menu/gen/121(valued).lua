if getParameter("value") == 1 then
  setAccountServerKey("anonym", "true")
else
  setAccountServerKey("anonym", "false")
end
interface.nodes[121].disabled = true
