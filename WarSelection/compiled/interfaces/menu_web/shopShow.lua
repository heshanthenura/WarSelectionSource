local nodes = interface.nodes
if nodes[74].visible then
  resetPanels()
  startMusic()
else
  hideAllWindows()
  stopMusic()
  nodes[74].visible = true
  root.interface_storeWeb_active = true
end
