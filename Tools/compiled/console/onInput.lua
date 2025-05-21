lastChar = inputChar
inputChar = getParameter("char")
if inputChar == 27 then
  local nodes = interface.nodes
  nodes[3].widget_text_text = ""
  listId = nil
  return
end
if inputChar == 9 then
  local nodes = interface.nodes
  local text = nodes[3].widget_text_text
  local dotPos
  for i = #text, 1, -1 do
    if text:byte(i) == 46 then
      dotPos = i
      break
    end
  end
  local address = ""
  local begin = text
  if dotPos ~= nil then
    address = text:sub(1, dotPos - 1)
    begin = text:sub(dotPos + 1)
  end
  local list = editorGet(address)
  local result = ""
  local results = 0
  local samePart
  local p = 1
  local pp = list:find(":", p)
  if pp == nil then
    return
  end
  while true do
    assert(pp ~= nil)
    local name = list:sub(p, pp - 1)
    if name:sub(1, #begin) == begin then
      if lastChar == 9 then
        if address == "" then
          nodes[3].widget_text_text = name
        else
          nodes[3].widget_text_text = address .. "." .. name
        end
        return
      end
      result = result .. name .. " "
      results = results + 1
      if samePart == nil then
        samePart = name
      else
        while name:sub(1, #samePart) ~= samePart do
          samePart = samePart:sub(1, #samePart - 1)
        end
      end
    end
    pp = list:find(string.char(10), pp)
    if pp == nil then
      break
    end
    p = pp + 1
    pp = list:find(":", p)
  end
  if 1 < results then
    addText(result)
  end
  if samePart ~= nil then
    if address == "" then
      nodes[3].widget_text_text = samePart
    else
      nodes[3].widget_text_text = address .. "." .. samePart
    end
  end
  return
end
if inputChar == 18 then
  if listId == nil then
    listId = #texts
  elseif listId > 1 then
    listId = listId - 1
  end
  local nodes = interface.nodes
  nodes[3].widget_text_text = texts[listId]
  return
end
if inputChar == 20 then
  local nodes = interface.nodes
  if listId ~= nil and listId < #texts then
    listId = listId + 1
    nodes[3].widget_text_text = texts[listId]
  else
    listId = nil
    nodes[3].widget_text_text = ""
  end
  return
end
if inputChar == 13 then
  listId = nil
  local nodes = interface.nodes
  local text = nodes[3].widget_text_text
  nodes[3].widget_text_text = ""
  text = string.gsub(text, "\r", "")
  table.insert(texts, text)
  for command in text:gmatch([[
([^
]*)]]) do
    processCommand(command)
  end
end
