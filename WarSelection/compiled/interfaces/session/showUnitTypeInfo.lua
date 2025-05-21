if toBool(getParameter("enter")) then
  showUnitTypeInfo()
else
  shownUnitTypeInfo = nil
  interface.nodes[193].visible = false
  return
end
