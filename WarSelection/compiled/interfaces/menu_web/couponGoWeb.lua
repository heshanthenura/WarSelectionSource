if couponTicketUpload ~= nil then
  return
end
couponTicketUpload = root.system_upload.f_add("https://coupons.warselect.io/auth", 60)
local post = root.system_upload[couponTicketUpload].postParams
local p = post[post.f_create()]
p.name = "ticket"
p.value = root.lobby_ticket
root.system_upload[couponTicketUpload].start = nil
local nodes = interface.nodes
nodes[127].disabled = true
