local nodes = interface.nodes
nodes[238].visible = false
local setLang = getParameter("language")
if root.language == setLang then
  return
end
showError(localize("<*menuChangedLanguage>"))
root.language = setLang
