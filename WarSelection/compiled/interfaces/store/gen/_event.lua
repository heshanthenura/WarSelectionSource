local eventName = getParameter("name")
if eventName == "lobbyAccountData" then
  local data = fromJson(getParameter("data"))
  techPoints = data.techpointsAvailable
  couponActions = data.couponActions
  props = data.props
  if techPoints == nil then
    techPoints = 0
  end
  if couponActions == nil then
    couponActions = ""
  end
  if props == nil then
    props = {}
  end
  propValues = {}
  for _, p in ipairs(props) do
    propValues[p[1]] = p[2]
  end
  updateProducts()
  tryShowChest(data.chest)
  return
end
if eventName == "lobbyData" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  local code = data.code
  local data = data.data
  if code == 0 then
    currentDecorSale = data.currentDecorSale
    if hideCosmetics or currentDecorSale == nil then
      nodes[48].visible = false
    else
      products[1].product = currentDecorSale[1]
      products[1].property = currentDecorSale[2]
      for _, v in ipairs(decorImageWidgets) do
        nodes[v].visible = false
      end
      if decorImageWidgets[currentDecorSale[1]] ~= nil then
        nodes[decorImageWidgets[currentDecorSale[1]]].visible = true
      end
      nodes[48].visible = true
    end
    if data.season1v1 ~= nil then
      onServerInit(data)
    end
  elseif code == 19 then
    updatePriceList(data.currency, data.prices, tonumber(data.coeff))
  elseif code == 29 then
    nodes[126].disabled = false
    local status = tonumber(data.status)
    if status == 0 then
      nodes[120].visible = false
    elseif status == 1 then
      showError(localize("<*storeErrorCouponDoesNotExist>"))
    elseif status == 2 then
      showError(localize("<*storeErrorCouponAlreadyActivated>"))
    elseif status == 7 then
      showError(localize("<*storeErrorCouponWaitBeforeCheckNextCoupon>"))
    else
      showError("Unknown coupon error.")
    end
  elseif code == 30 then
    nodes[44].disabled = false
    local status = tonumber(data.status)
    if status == 0 then
      showCoupon(data.code, data.expire, data.properties, data.receiver, data.action, data.regionCoeff)
    elseif status == 1 then
      showError(localize("<*storeErrorCouponDoesNotExist>"))
    elseif status == 2 then
      showError(localize("<*storeErrorCouponWaitBeforeCheckNextCoupon>"))
    elseif status == 3 then
      showError(localize("<*storeErrorCouponAnotherPlatform>"))
    else
      showError("Unknown coupon error.")
    end
  elseif code == 40 then
    nodes[1].disabled = false
  end
  return
end
