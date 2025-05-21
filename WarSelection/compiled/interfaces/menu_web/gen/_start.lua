regionCoef = 1
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
account.coupons = {}
waitProjectLoad = true
local storage = root.storage
storage.f_setIfEmpty("rQuality", "2")
storage.f_setIfEmpty("soundVolume", "1.0")
storage.f_setIfEmpty("cameraSpeed", "2000")
storage.f_setIfEmpty("cameraInertia", "200")
storage.f_setIfEmpty("bordersScroll", "1")
storage.f_setIfEmpty("showHealthBarMode", "1")
storage.f_setIfEmpty("musicVolume", "0.2")
storage.f_setIfEmpty("windowed", "0")
storage.f_setIfEmpty("vSync", "1")
storage.f_setIfEmpty("gamma2", "220")
local screenSize = root.system_screenWidth .. "x" .. root.system_screenHeight
if storage.screen ~= screenSize then
  storage.f_set("screen", screenSize)
  setInterfaceScale(calcInterfaceScaleAuto())
end
interfaceScale = tonumber(storage.interfaceScale)
root.interface_setScale = {
  interfaceScale,
  interfaceScale
}
local nodes = interface.nodes
local n = nodes[84]
root.interface.f_create("/project/WarSelection/interfaces/store", "storeWeb", interfaceScale, interfaceScale, "hideSpecialModes", true, "hideCosmetics", true, "x", n.screenLeft, "y", n.screenTop, "sx", n.sizeX, "sy", n.sizeY, "horizontalAlign", n.horizontalAlign, "verticalAlign", n.verticalAlign)
root.interface_storeWeb_priority = 120
resetPanels()
local sessionStartTime = tonumber(storage.sessionStartTime)
if sessionStartTime ~= nil and os.time() - sessionStartTime < 7200 then
  nodes[39].visible = false
  nodes[29].visible = true
end
initSoundVolume()
local musicVolumeDisabled = tonumber(root.storage_musicVolumeDisabled)
nodes[35].widget_checked = musicVolumeDisabled == nil or musicVolumeDisabled == 0
nodes[41].disabled = true
nodes[45].visible = false
