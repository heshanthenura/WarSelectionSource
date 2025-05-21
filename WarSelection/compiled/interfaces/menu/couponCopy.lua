local s = ""
for i = 1, #account.coupons do
  if 1 < i then
    s = s .. ", "
  end
  s = s .. account.coupons[i]
end
root.system_clipboard_set = s
