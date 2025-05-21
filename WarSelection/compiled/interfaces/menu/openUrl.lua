local url = getParameter("url")
if url == "discord" then
  url = localize("<*discordUrl>")
end
root.system.f_openLink(url)
