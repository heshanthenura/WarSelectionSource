if toBool(getParameter("me")) then
  root.session_visual_scene[0].cameraShowPosition = attackedPositionMe
else
  root.session_visual_scene[0].cameraShowPosition = attackedPositionAlly
end
