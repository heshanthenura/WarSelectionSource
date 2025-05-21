local nodes = interface.nodes
local ig = root.session_render_ignore
ig.models = not nodes[61].widget_checked
ig.decals = not nodes[62].widget_checked
ig.water = not nodes[60].widget_checked
ig.landscape = not nodes[138].widget_checked
ig.grass = not nodes[280].widget_checked
if nodes[145].widget_checked then
  root.session_render_landscape_debug_bitsPassMap.f_show(50)
else
  root.session_render_landscape_debug_bitsPassMap.f_hide()
end
