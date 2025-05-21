local nodes = interface.nodes
local cam = root.session_visual_scene[0].camera_controllers_complex[0]
if cam.frames_size == 0 then
  return
end
local camNum = nodes[1].widget_currentLine
local time = tonumber(nodes[11].widget_text_text)
if time == nil then
  return
end
local val = tonumber(getParameter("text"))
if val == nil then
  return
end
local v = val / time
if v < 0 then
  v = 0
  nodes[8].widget_text_text = "0"
end
if 1 < v then
  v = 1
  nodes[8].widget_text_text = time
end
local frames = cam.frames
for i = 0, frames.size - 1 do
  local frame = frames[i]
  if math.abs(v - frame.time) < 1.0E-5 then
    return
  end
end
cam.f_setTime(camNum, v)
