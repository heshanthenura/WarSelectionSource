function addText(text)
  local nodes = interface.nodes
  
  local w = nodes[2].widget
  w.lines.f_create(text)
  w.f_showLine()
end

function processCommand(text)
  if text == "cls" then
    local nodes = interface.nodes
    nodes[2].widget_lines.f_clear()
    return
  end
  if text == "help" then
    addText("Available commands:")
    addText("\t\"cls\" clears console")
    addText("\t\"help\" prints this message")
    return
  end
  if text:find("attach.") ~= nil and root.session_gameplay == nil then
    addText("Can't use attacher as there is no game session")
    return
  end
  addText("> " .. text)
  if text:find("=") == nil then
    local res = editorGet(text)
    addText(res)
  else
    local res = editorExecute(text)
    if res ~= "" then
      addText(res)
    end
  end
end
