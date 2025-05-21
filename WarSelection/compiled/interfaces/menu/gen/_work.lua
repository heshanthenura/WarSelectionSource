local nodes = interface.nodes
local tm = os.time()
requestPriceListIfNeed()
if not root.lobby_enabled and root.interface_store_scripts_ready then
  root.lobby_enabled = true
end
if webMustInit then
  local gpuType = root.render_gpuType
  if gpuType ~= nil then
    if gpuType ~= 1 then
      nodes[938].visible = true
      nodes[1262].visible = gpuType == 2
      nodes[1263].visible = gpuType == 0
    end
    webMustInit = false
  end
end
if not sessionWork and startSessionTask ~= nil then
  startSession()
end
if hasBan then
  updateAllBanWidgets()
end
if demoShowTime ~= nil and tm > demoShowTime then
  demoShowTime = nil
  root.functions.interpolator.f_lerp("interface." .. interfaceId .. ".nodes.986.color.a", 1, 255, 10, 500, "interface." .. interfaceId .. ".nodes.986.visible", false)
end
if checkObsPic and not nodes[986].visible then
  unloadObscuringPicture()
  checkObsPic = false
end
if waitProjectLoad and root.projectLoaded then
  waitProjectLoad = false
  startDemo()
  nodes[167].widget_text = "Early Access - v" .. root.f_version(true)
  setObscuringPicture(10)
end
if joinTime ~= nil then
  nodes[48].widget_text = toTimeStr(tm - joinTime)
end
local lobby = root.lobby_pingPeriod
if lobby ~= nil then
  local pingPeriod = root.lobby_pingPeriod - 30
  if pingPeriod < 10 then
    pingPeriod = 10
  end
  local w = nodes[340].widget
  w.text = strPing1 .. pingPeriod .. strPing2
  if pingPeriod < 200 then
    w.font_textColor_value = 4278255360
  elseif pingPeriod < 300 then
    w.font_textColor_value = 4278255615
  else
    w.font_textColor_value = 4278190335
  end
end
if couponTicketUpload ~= nil then
  local upload = root.system_upload[couponTicketUpload]
  if upload.done then
    if upload.success then
      local result = upload.result
      local j = fromJson(result)
      if j ~= nil then
        if j.error == 0 then
          root.system.f_openLink("https://coupon.warselect.io/?ticket=" .. j.data)
        else
          log("Upload coupon ticket error")
          log(result)
        end
      else
        log("Upload coupon ticket no result data")
        log(result)
      end
    else
      log("Upload coupon ticket request failed")
    end
    assert(couponTicketUpload ~= nil)
    root.system_upload.f_remove(couponTicketUpload)
    couponTicketUpload = nil
    nodes[1074].disabled = false
  end
end
if messengerInit and root.messenger.inited then
  messengerInit = nil
  if 0 < root.messenger.contacts.size then
    root.interface.f_create("/project/WarSelection/interfaces/friends_list", "friends", interfaceScale, interfaceScale)
    root.interface_friends_priority = 100
    root.interface_friends_active = root.interface_menu_active
  end
end
if nodes[120].disabled and root.lobby_isTicketAvailable then
  nodes[120].disabled = false
end
local servTm = getCurrentServerTime()
if nextSeason ~= nil then
  local dt = nextSeason - servTm
  if dt < 0 then
    dt = 0
  end
  nodes[1485].visible = true
  nodes[1484].widget_text = toTimeStr(dt)
  nodes[617].visible = dt < 604800
  nodes[978].widget_text = toTimeStr(dt)
end
