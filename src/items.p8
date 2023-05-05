ITEM_ID = 0

function new_item_id()
   ITEM_ID = ITEM_ID + 1
   return ITEM_ID
end

ITEMS = {}

do
   local function add_item(item_data)
      local id = new_item_id()
      item_data.id = id
      ITEMS[id] = item_data
   end


   local function light_armor (base, sheet)
      return function (sheet)
         return base + sheet.dex.mod
      end
   end

   local function med_armor (base, sheet)
      return function (sheet)
         return base + min(sheet.dex.mod, 2)
      end
   end

   local function heavy_armor(base, sheet)
      return function (sheet)
         return base
      end
   end

   local function make_armor (ac, cost, name, stealth_dis, str, type, weight)
      add_item({
            ac = ac,
            armor_type = type,
            cost = cost,
            equipped = false,
            name = name,
            stealth_dis = stealth_dis,
            str = str,
            type = "armor",
            weight = weight,
      })
   end

   make_armor(light_armor(11), 50, "padded armor", true, 0, "light", 8)
   make_armor(light_armor(12), 100, "leather armor", false, 0, "light", 10)
   make_armor(light_armor(13), 450, "studded leather armor", false, 0, "light", 13)
   make_armor(med_armor(12), 100, "hide armor", false, 0, "medium", 12)
   make_armor(med_armor(13), 500, "chain armor", false, 0, "medium", 20)
   make_armor(med_armor(14), 500, "scale armor", true, 0, "medium", 45)
   make_armor(med_armor(14), 4000, "breastplate", false, 0, "medium", 20)
   make_armor(med_armor(15), 7500, "half-plate", true, 0, "medium", 40)
   make_armor(heavy_armor(14), 300, "ring mail", true, 0, "heavy", 40)
   make_armor(heavy_armor(16), 750, "chain mail", true, 13, "heavy", 55)
   make_armor(heavy_armor(17), 2000, "splint armor", true, 15, "heavy", 60)
   make_armor(heavy_armor(18), 15000, "plate armor", true, 15, "heavy", 65)

   add_item({
      ac = 2,
      cost = 100,
      name = "shield",
      type = "shield",
      weight = 6,
      equipped = false,
      str = 0
   })

end

function select_items (query)
   local matches = {}
   for item_id, item in pairs(ITEMS) do
      local match = true
      for key, value in pairs(query) do
         if type(value) == "function" then
            if not value(item[key]) then
               match = false
               break
            end
         elseif item[key] ~= query[key] then
            match = false
            break
         end
      end
      if match then
         matches[#matches + 1] = item
      end
   end
   return matches
end
