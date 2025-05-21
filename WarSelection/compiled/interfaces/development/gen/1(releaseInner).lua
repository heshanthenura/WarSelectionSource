local gameplay = root.project.gameplay
local units = {}
for bid = 0, gameplay.build.size - 1 do
  local b = gameplay.build[bid]
  local c1 = b.initCost
  local c2 = b.buildCost
  if units[b.unit] == nil then
    units[b.unit] = {
      priceReturn = 0.8,
      price = {}
    }
  end
  table.insert(units[b.unit].price, {
    (c1[0] + c2[0]) // 1000,
    (c1[1] + c2[1]) // 1000,
    (c1[2] + c2[2]) // 1000,
    0
  })
end
units[184] = {
  priceReturn = 0.8,
  price = {
    {
      units[183].price[1][1] * 3,
      units[183].price[1][2] * 3,
      units[183].price[1][3] * 3,
      1
    }
  }
}
units[198] = units[184]
units[188] = {
  priceReturn = 0.8,
  price = {
    {
      units[187].price[1][1] * 3,
      units[187].price[1][2] * 3,
      units[187].price[1][3] * 3,
      1
    }
  }
}
units[199] = units[188]
units[214] = {
  priceReturn = 0.8,
  price = {
    {
      units[213].price[1][1] * 3,
      units[213].price[1][2] * 3,
      units[213].price[1][3] * 3,
      2
    }
  }
}
units[215] = units[214]
units[219] = {
  priceReturn = 0.8,
  price = {
    {
      units[218].price[1][1] * 3,
      units[218].price[1][2] * 3,
      units[218].price[1][3] * 3,
      2
    }
  }
}
units[220] = units[219]
units[224] = {
  priceReturn = 0.8,
  price = {
    {
      units[223].price[1][1] * 3,
      units[223].price[1][2] * 3,
      units[223].price[1][3] * 3,
      2
    }
  }
}
units[225] = units[224]
units[229] = {
  priceReturn = 0.8,
  price = {
    {
      units[228].price[1][1] * 3,
      units[228].price[1][2] * 3,
      units[228].price[1][3] * 3,
      2
    }
  }
}
units[230] = units[229]
for unitTypeId = 0, gameplay.unitType.size - 1 do
  local unitType = gameplay.unitType[unitTypeId]
  if unitType.abilityOn then
    local works = unitType.ability_work
    local abilities = unitType.ability_ability
    for workId = 0, works.size - 1 do
      local work = works[workId]
      local ability = abilities[work.ability]
      if ability.type == 0 then
        local c1 = work.costOrder
        local c2 = work.costStart
        local c3 = work.costProcess
        if units[ability.data_unit] == nil then
          units[ability.data_unit] = {
            priceReturn = 0.5,
            price = {}
          }
        end
        table.insert(units[ability.data_unit].price, {
          (c1[0] + c2[0] + c3[0]) // 1000,
          (c1[1] + c2[1] + c3[1]) // 1000,
          (c1[2] + c2[2] + c3[2]) // 1000,
          0
        })
      end
    end
  end
end
for unitTypeId = 0, gameplay.unitType.size - 1 do
  local unitType = gameplay.unitType[unitTypeId]
  if unitType.abilityOn then
    local works = unitType.ability_work
    local abilities = unitType.ability_ability
    for workId = 0, works.size - 1 do
      local work = works[workId]
      local ability = abilities[work.ability]
      if ability.type == 2 and units[unitTypeId] ~= nil and units[ability.data_unit] ~= nil then
        local priceReturn = units[unitTypeId].priceReturn
        local nxtPrice = units[ability.data_unit].price
        local cur = units[unitTypeId].price[1]
        local nxt = nxtPrice[1]
        if unitTypeId == 66 and workId == 5 or unitTypeId == 69 and workId == 11 or unitTypeId == 92 and workId == 6 or unitTypeId == 94 and workId == 12 then
          nxt = nxtPrice[2]
        end
        if cur[4] == 0 and nxt[4] == 0 or 0 < cur[4] and cur[4] < nxt[4] then
          if 0 < work.costStart[0] or 0 < work.costStart[1] or 0 < work.costStart[2] or 0 < work.costProcess[0] or 0 < work.costProcess[1] or 0 < work.costProcess[2] then
            log(unitTypeId .. "/" .. workId)
            log("wrong price stream")
            log("")
          else
            local costOrder = {
              work.costOrder[0] // 1000,
              work.costOrder[1] // 1000,
              work.costOrder[2] // 1000
            }
            if costOrder[1] ~= 0 or costOrder[2] ~= 0 or costOrder[3] ~= 0 then
              if unitTypeId == 244 and workId == 0 then
                priceReturn = 0.7
              end
              local cost = {
                math.floor(nxt[1] - cur[1] * priceReturn),
                math.floor(nxt[2] - cur[2] * priceReturn),
                math.floor(nxt[3] - cur[3] * priceReturn)
              }
              
              function priceRound(p)
                if 1000 < cost[p] then
                  cost[p] = math.floor(cost[p] / 100 + 0.5) * 100
                elseif 500 < cost[p] then
                  cost[p] = math.floor(cost[p] / 50 + 0.5) * 50
                elseif 100 < cost[p] then
                  cost[p] = math.floor(cost[p] / 10 + 0.5) * 10
                else
                  cost[p] = math.floor(cost[p] / 5 + 0.5) * 5
                end
              end
              
              priceRound(1)
              priceRound(2)
              priceRound(3)
              if 0 > cost[3] then
                cost[2] = cost[2] + cost[3] * 2
                cost[3] = 0
              end
              if 0 > cost[2] then
                cost[1] = cost[1] + cost[2]
                cost[2] = 0
              end
              if 0 > cost[1] then
                cost[2] = cost[2] + cost[1]
                cost[1] = 0
              end
              if 0 > cost[2] then
                cost[2] = 0
              end
              if cost[1] ~= costOrder[1] or cost[2] ~= costOrder[2] or cost[3] ~= costOrder[3] then
                log("Unit " .. unitTypeId .. ", work " .. workId)
                log("Unit price: " .. cur[1] .. "/" .. cur[2] .. "/" .. cur[3] .. " -> " .. nxt[1] .. "/" .. nxt[2] .. "/" .. nxt[3])
                log("Transformation price: " .. costOrder[1] .. "/" .. costOrder[2] .. "/" .. costOrder[3] .. " -> " .. cost[1] .. "/" .. cost[2] .. "/" .. cost[3])
                log("")
                work.costOrder[0] = cost[1] * 1000
                work.costOrder[1] = cost[2] * 1000
                work.costOrder[2] = cost[3] * 1000
              end
            end
          end
        end
      end
    end
  end
end
log("Transformation prices updated")
