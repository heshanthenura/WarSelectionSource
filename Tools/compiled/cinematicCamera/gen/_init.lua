function updateCinCameraKeyTime()
  local nodes = interface.nodes
  
  local cam = root.session_visual_scene[0].camera_controllers_complex[0]
  local id = nodes[1].widget_currentLine
  if id ~= nil then
    nodes[8].disabled = id == 0 or id == cam.frames_size - 1
    nodes[8].widget_text_text = math.floor(cam.frames[id].time * cam.duration)
  else
    nodes[8].widget_text_text = "0"
  end
end

function autoCalcCinCameraTimes(size)
  local frames = root.session_visual_scene[0].camera_controllers_complex[0].frames
  local sz = frames.size
  if size == nil then
    size = sz
  end
  if 1 < sz then
    for i = 0, sz - 1 do
      frames[i].time = i / (size - 1)
    end
  elseif 0 < sz then
    frames[0].time = 0
  end
end

function updateCinCameraPositions()
  local nodes = interface.nodes
  local cam = root.session_visual_scene[0].camera_controllers_complex[0]
  local widget = nodes[1].widget
  local lines = widget.lines
  lines.f_clear()
  local sz = cam.frames_size
  if 0 < sz then
    for i = 1, sz do
      lines.f_create(tostring(i))
    end
    widget.currentLine = 0
  else
    widget.currentLine = nil
  end
  nodes[11].widget_text_text = math.floor(cam.duration)
  updateCinCameraKeyTime()
end

function hideInterfaces(hide)
  interface.nodes[2].visible = not hide
  root.interface[parentInterface].f_sendEvent("hideInterfaces", tostring(hide))
end

function clear()
  local nodes = interface.nodes
  local cam = root.session_visual_scene[0].camera_controllers_complex[0]
  cam.f_clear()
  updateCinCameraPositions()
  nodes[1].widget_currentLine = nil
  nodes[15].disabled = true
  nodes[4].disabled = true
end
