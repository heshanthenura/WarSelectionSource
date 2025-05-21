local nodes = interface.nodes
if getParameter("value") == 1 then
  startLoadingPrivateConfigDraft(openingPrivateMapCode, openingPrivateVersionDraft)
  disablePanel()
elseif openingPrivateVersionRelease == nil then
  nodes[12].widget.checked = true
else
  startLoadingPrivateConfigRelease(openingPrivateMapCode, openingPrivateVersionRelease)
  disablePanel()
end
