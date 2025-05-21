local nodes = getNodes()
local show = not nodes[38].visible
hideWindows()
if show then
  nodes[38].visible = true
  nodes[33].disabled = true
  nodes[28].widget_current = math.floor(root.session_visual_scene[0].water_level)
end
