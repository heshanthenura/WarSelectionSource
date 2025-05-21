if complaintPlayer == nil then
  return
end
local nodes = interface.nodes
local time = root.session_gameplay_gameplay_time
local reason = nodes[874].widget_value
local text = nodes[868].widget_text_text
local json = {
  type = "complaint",
  player = complaintPlayer,
  reason = reason,
  text = text,
  time = time
}
root.session_gameplay.f_sendDataToServer(toJson(json))
nodes[1484].visible = false
nodes[871].visible = true
