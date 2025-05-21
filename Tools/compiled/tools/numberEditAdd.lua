local val = numValue + numStep * tonumber(getParameter("add"))
numberSetValue(val)
interface.nodes[42].widget_text_text = numValue
