local data = {
  list = getParameter("list"),
  topPlace = getParameter("topPlace"),
  service = getParameter("service")
}
root.interface_menu.f_sendEvent("rankingData", toJson(data))
