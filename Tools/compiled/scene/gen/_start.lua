local interfaceName = getParameter("interfaceName")
interfaceId = root.interface.f_getIndex(interfaceName)
directionAppearance = getParameter("directionAppearance")
signalScript = getParameter("signalScript")
signalHotKey = 0
movePlacer = false
envSignalTags = getParameter("envSignalTags")
addSelectionHotKey = getParameter("addSelectionHotKey")
zoomStep = getParameter("zoomStep")
if zoomStep == nil then
  zoomStep = 150
end
useFrame = getParameter("useFrame")
if useFrame == nil then
  useFrame = false
end
useSingleSelect = getParameter("useSingleSelect")
if useSingleSelect == nil then
  useSingleSelect = 0
end
useSignals = getParameter("useSignals")
if useSignals == nil then
  useSignals = false
end
useDrag = getParameter("useDrag")
if useDrag == nil then
  useDrag = 0
end
interface.mapSceneToWidget = 1
local left = getParameter("left")
local right = getParameter("right")
local top = getParameter("top")
local bottom = getParameter("bottom")
initOffsets(left, right, top, bottom)
