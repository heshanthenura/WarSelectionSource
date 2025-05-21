if toBool(getParameter("start")) then
  if root.session_visual_scene[0].selection_units_list_size == 0 then
    return
  end
  showUnit = root.session_visual_scene[0].selection_units_list[0].id
else
  showUnit = nil
end
