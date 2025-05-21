local fact = root.scene[0].faction[getParameter("faction")]
fact.territorySizeLimit = fact.territorySizeLimit + tonumber(getParameter("add"))
