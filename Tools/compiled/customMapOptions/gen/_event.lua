local eventName = getParameter("name")
if eventName == "mapChoosen" then
  mapCode = getParameter("data")
  disablePanel()
  mapMetaLoading = createUpload("https://map-upload.warselect.io/get?code=" .. mapCode)
  createUploadPostParameter(mapMetaLoading, "accountKey", root.lobby.f_makeAccountKey(0))
  startUploading(mapMetaLoading, "map meta data")
  return
end
