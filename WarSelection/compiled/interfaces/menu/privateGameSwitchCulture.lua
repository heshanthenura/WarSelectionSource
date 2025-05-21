local culture = math.floor(tonumber(getParameter("culture")))
local culturesChain = {
  {
    0,
    2,
    3,
    7,
    8,
    9,
    10,
    15,
    16,
    18
  },
  {
    1,
    4,
    5,
    11,
    12,
    13,
    14,
    17
  },
  {
    2,
    7,
    8,
    9,
    18
  },
  {
    3,
    10,
    15
  },
  {
    4,
    11,
    17
  },
  {
    5,
    13,
    14
  },
  {6},
  {7},
  {8},
  {9},
  {10},
  {11},
  {12},
  {13},
  {14},
  {15},
  {16},
  {17},
  {18}
}
local childRules = {
  {2, 3},
  {4, 5},
  {
    6,
    7,
    8,
    9,
    16,
    18
  },
  {
    6,
    10,
    15,
    16
  },
  {
    6,
    11,
    12,
    17
  },
  {
    6,
    12,
    13,
    14
  }
}
local parents = {
  {},
  {},
  {0},
  {0},
  {1},
  {1},
  {
    2,
    3,
    4,
    5
  },
  {2},
  {2},
  {2},
  {3},
  {4},
  {4, 5},
  {5},
  {5},
  {3},
  {2, 3},
  {4},
  {2}
}
local isOn = function(state, culture)
  return state >> culture & 1
end
local setState = isOn(culturesAvailable, culture) ~ 1
local newState = culturesAvailable
local sChain = culturesChain[culture + 1]
for i = 1, #sChain do
  if setState == 0 then
    newState = newState & ~(1 << sChain[i])
  else
    newState = newState | 1 << sChain[i]
  end
end
local isValidState = function(state)
  if isOn(state, 0) == 1 and isOn(state, 1) == 1 then
    return false
  end
  for i = 1, #parents do
    if isOn(state, i - 1) == 0 then
      local pr = parents[i]
      if 0 < #pr then
        local sum = 0
        for j = 1, #pr do
          if isOn(state, pr[j]) == 0 then
            sum = sum + 1
          end
        end
        if sum == 0 then
          return false
        end
      end
    end
  end
  for parent = 1, #childRules do
    if isOn(state, parent - 1) == 0 then
      local sum = 0
      for j = 1, #childRules[parent] do
        local child = childRules[parent][j]
        if isOn(state, child) == 0 then
          sum = sum + 1
        end
      end
      if sum == 0 then
        return false
      end
    end
  end
  return true
end
if not isValidState(newState) then
  return
end
culturesAvailable = newState
local nodes = interface.nodes
for i = 1, #culturesSwitchButtons do
  local set = nodes[culturesSwitchButtons[i]].widget_bottom_set
  if isOn(culturesAvailable, i - 1) == 1 then
    set.normal = set.pressed
  else
    set.normal = set.disabled
  end
end
