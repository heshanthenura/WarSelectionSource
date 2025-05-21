regionCoef = 1
playingCountryMusic = false
rateFirst3 = {
  "",
  "",
  ""
}
culturesAvailable = 0
matchMode = "ffa"
maxAge = 1
math.randomseed(os.time())
newMatchMode = ""
interfaceScale = 1
sessionWork = false
waitProjectLoad = true
connectServerTime = 0
connectLocalTime = 0
account = {}
account.seasons1v1 = {}
account.name = "Player"
account.properties = ""
account.totalDonations = 0
account.availableDonations = 0
account.specialRights = 0
account.couponActions = ""
account.techPoints = 0
account.techPointsTotal = 0
account.props = {}
account.propValues = {}
account.coupons = {}
local storage = root.storage
interfaceScale = tonumber(storage.interfaceScale)
root.interface.f_setScale(interfaceScale, interfaceScale)
local nodes = interface.nodes
local n = nodes[124]
root.interface.f_create("/project/WarSelection/interfaces/store", "store", interfaceScale, interfaceScale, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface_store_priority = 120
messengerInit = true
local n = nodes[83]
root.interface.f_create("/project/Tools/privateCreated", "privateRoom", interfaceScale, interfaceScale, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface_privateRoom_priority = 110
root.interface.f_create("/project/Tools/mapEditorStart", "mapEditorStart", interfaceScale, interfaceScale, "parent", interfaceId, "generatorInterface", "/project/WarSelection/interfaces/mapEditorStartSettings")
root.interface_mapEditorStart_priority = 110
local n = nodes[379]
root.interface.f_create("/project/Tools/customMapChoosing", "customMapChoosing", interfaceScale, interfaceScale, "parent", interfaceId, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface_customMapChoosing_priority = 110
local n = nodes[395]
root.interface.f_create("/project/Tools/customMapOptions", "customMapOptions", interfaceScale, interfaceScale, "parent", interfaceId, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface_customMapOptions_priority = 110
local n = nodes[81]
root.interface.f_create("/project/Tools/replaysList", "replaysList", interfaceScale, interfaceScale, "parent", interfaceId, "lastReplayFile", root.system_localFolder .. "/replay.rep", "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface_customMapOptions_priority = 110
setScaleWidget()
initSoundVolume()
newMatchMode = "ffa"
applyGameMode()
onDisconnect()
startMusic()
if not webVersion then
  local screenSize = root.system_screenWidth .. "x" .. root.system_screenHeight
  if storage.screen ~= screenSize then
    storage.f_set("screen", screenSize)
    setInterfaceScale(calcInterfaceScaleAuto(root.system_screenHeight))
  end
  if toBool(storage.windowed) then
    root.window.f_maximize()
  else
    root.window.f_fullScreen(true)
  end
end
nodes[523].disabled = true
nodes[133].disabled = true
nodes[801].disabled = true
nodes[405].visible = true
