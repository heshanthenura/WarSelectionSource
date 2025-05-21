local eventName = getParameter("name")
if eventName == "serverError" then
  local error = tonumber(getParameter("data"))
  log("Server er_ror " .. error)
  local clearRejoin = function()
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    local nodes = interface.nodes
    nodes[1158].visible = false
    nodes[334].disabled = false
  end
  clearRejoin()
  if error == 0 then
    showError("Server errCode 'protocolFailure'")
  elseif error == 1 then
    showError(localize("<*menuErrorNoSession>"))
  elseif error == 2 then
    showError("Server errCode 'wrongProtocol'")
  elseif error == 3 then
    showError(localize("<*menuErrorSessionWrongVersion>"))
  elseif error == 4 then
    showError(localize("<*menuErrorSessionUnavailable>"))
  else
    showError("Unknown server errCode: " .. error)
  end
  root.session.f_break()
end
if eventName == "lobbyDisconnect" then
  onDisconnect()
  return
end
if eventName == "lobbyAccountData" then
  local data = fromJson(getParameter("data"))
  account.name = data.name
  account.seasons1v1 = data.seasons1v1
  account.seasons2v2 = data.seasons2v2
  account.techPoints = data.techpointsAvailable
  account.techPointsTotal = data.techPointsTotal
  account.lastMatchResult = data.lastMatchResult
  account.totalDonations = data.totalDonations
  account.availableDonations = data.availableDonations
  account.bans = data.bans
  account.specialRights = data.specialRights
  account.couponActions = data.couponActions
  account.props = data.props
  account.coupons = data.coupons
  account.chest = data.chest
  if account.techPointsTotal == nil then
    account.techPointsTotal = 0
  end
  if account.seasons1v1 == nil then
    account.seasons1v1 = {}
  end
  if account.seasons2v2 == nil then
    account.seasons2v2 = {}
  end
  if account.techPoints == nil then
    account.techPoints = 0
  end
  if account.specialRights == nil then
    account.specialRights = 0
  end
  if account.couponActions == nil then
    account.couponActions = ""
  end
  if account.props == nil then
    account.props = {}
  end
  if account.coupons == nil then
    account.coupons = {}
  end
  local accPlayDay = data.playDay
  rewards = {}
  for mode, data in pairs(playDay.rewards) do
    rewards[mode] = data
  end
  local accPlayDay = data.playDay
  if accPlayDay ~= nil and accPlayDay.number == playDay.number then
    for mode, data in pairs(rewards) do
      am = accPlayDay.activity[mode]
      if am ~= nil then
        data.count = data.count - am
      end
    end
  end
  local nodes = interface.nodes
  nodes[16].visible = rewards[7] ~= nil and 0 < rewards[7].count
  if nodes[16].visible then
    nodes[40].widget_text = rewards[7].value
    nodes[154].widget_text = rewards[7].count
  end
  if editorMode then
    account.props = {}
    for i = 0, 50 do
      table.insert(account.props, {i, 1})
    end
  end
  account.propValues = {}
  for _, p in ipairs(account.props) do
    account.propValues[p[1]] = p[2]
  end
  account.specialRights = math.floor(account.specialRights)
  updateAccountProperties()
  local nodes = interface.nodes
  tryShowLastMatchResult(fromJson(account.lastMatchResult))
  nodes[38].widget_text = account.name
  if account.name ~= "" then
    local fn = getFontName(account.name)
    nodes[38].widget_fontName = fn
  end
  nodes[26].widget_text = account.techPoints
  nodes[147].visible = 0 < #account.coupons
  if 0 < #account.coupons then
    local shownCoupons = tonumber(root.storage_shownCoupons)
    if shownCoupons == nil then
      shownCoupons = 0
    end
    nodes[145].visible = #account.coupons > math.floor(shownCoupons)
  end
  return
end
if eventName == "lobbyData" then
  local nodes = interface.nodes
  local data = fromJson(getParameter("data"))
  local code = data.code
  local data = data.data
  if code == 0 then
    if data.season1v1 ~= nil then
      onServerInit(data)
    elseif interface.active then
      local sessionId = data.sessionId
      local server = data.server
      local ticket = data.ticket
      log("Lobby session " .. sessionId .. " start")
      root.storage_set = {
        "sessionStartTime",
        os.time()
      }
      root.storage_set = {
        "sessionServer",
        server
      }
      root.storage_set = {
        "sessionTicket",
        ticket
      }
      startMultiplay(server, ticket)
      assert(false)
    end
  elseif code == 1 then
    onGroupCreated(data.code)
  elseif code == 7 then
    onGroupOperationResult(data)
  elseif code == 14 then
    onStartMatchFinding(data ~= nil and data.outdated ~= nil and data.outdated)
  elseif code == 15 then
    log("Stopped matchfinding")
    onStopMatchFinding()
  elseif code == 16 then
    updateGroupPlayers(data.players)
  elseif code == 17 then
    nodes[89].disabled = false
    nodes[87].disabled = false
    nodes[1].disabled = false
    showError(localize("<*menuErrorModeTemporaryDisabled>"))
  elseif code == 18 then
    resetPanels()
    showError(localize("<*multiplayIsOff>"))
  elseif code == 19 then
    regionCoef = tonumber(data.coeff)
    nodes[41].disabled = false
    updateAccountProperties()
  elseif code == 25 then
    log("Can't leave the queue")
  elseif code == 37 then
    log("The mode is banned")
  elseif code == 38 then
    resetPanels()
    showError(localize("<*matchfindingBan/0>" .. toTimeStr(data.period) .. "<*matchfindingBan/1>"))
  end
  return
end
if eventName == "sessionClose" then
  local data = fromJson(getParameter("data"))
  local clearRejoin = function()
    root.storage.f_set("sessionStartTime", "")
    root.storage.f_set("sessionServer", "")
    root.storage.f_set("sessionTicket", "")
    resetPanels()
  end
  if data.reason == 1 then
    showError(localize("<*menuErrorObsoleteDump>"))
  elseif data.reason == 2 then
    showError(localize("<*menuErrorCorruptedDump>"))
  elseif data.reason == 3 then
    showError(localize("<*menuErrorSessionWrongVersion>"))
    clearRejoin()
  elseif data.reason == 4 then
    showError(localize("<*menuErrorSessionCorruptedLandscape/0>") .. data.text .. localize("<*menuErrorSessionCorruptedLandscape/1>"))
  elseif data.reason == 10 then
    showError(localize("<*menuErrorSessionWrongState/0>") .. data.text .. localize("<*menuErrorSessionWrongState/1>"))
  end
  interface.active = true
  return
end
