if couponTicketUpload ~= nil then
  return
end
couponTicketUpload = createUpload("https://coupons.warselect.io/auth")
createUploadPostParameter(couponTicketUpload, "ticket", root.lobby_ticket)
startUploading(couponTicketUpload, "coupon")
local nodes = interface.nodes
nodes[1074].disabled = true
