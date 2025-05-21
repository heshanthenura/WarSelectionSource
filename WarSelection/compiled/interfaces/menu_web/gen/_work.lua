local nodes = interface.nodes
if waitProjectLoad and root.projectLoaded then
  waitProjectLoad = false
  nodes[11].widget_text = "Early Access - v" .. root.f_version(true)
end
if not root.lobby_enabled and root.interface_storeWeb_scripts_ready then
  root.lobby_enabled = true
end
if joinTime ~= nil then
  local dt = os.time() - joinTime
  local str = toTimeStr(dt)
  nodes[42].widget_text = str
end
if hasBan then
  updateAllBanWidgets()
end
if couponTicketUpload ~= nil then
  local upload = root.system_upload[couponTicketUpload]
  if upload.done then
    if upload.success then
      local result = upload.result
      local j = fromJson(result)
      if j ~= nil then
        if j.error == 0 then
          root.system_openLink = "https://coupon.warselect.io/?ticket=" .. j.data
        else
          log("Upload coupon ticket error")
          log(result)
        end
      else
        log("Upload coupon ticket result format error")
        log(result)
      end
    else
      log("Upload coupon ticket request failed")
    end
    assert(couponTicketUpload ~= nil)
    root.system_upload_remove = couponTicketUpload
    couponTicketUpload = nil
    local nodes = interface.nodes
    nodes[127].disabled = false
    root.storage_set = {
      "shownCoupons",
      #account.coupons
    }
    nodes[145].visible = false
  end
end
