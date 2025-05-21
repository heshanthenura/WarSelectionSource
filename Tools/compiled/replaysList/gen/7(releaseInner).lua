local nodes = interface.nodes
local v = nodes[5].widget_currentLine
if v == nil then
  return
end
local match = mathcesList[v + 1]
assert(match.actualVersion or editorMode)
local code = "rep-" .. match.replay
local success = startLoadingReplay(code)
nodes[8].visible = success
nodes[9].visible = not success
