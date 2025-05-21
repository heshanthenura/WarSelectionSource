if joinTime ~= nil then
  interface.nodes[6].widget_text = toTimeStr(os.time() - joinTime)
end
