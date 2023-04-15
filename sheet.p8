function mk_attr (score)
   return {
      score = score,
      mod = (score - 10) \ 2
   }
end


function Sheet ()
   local self = {
      lvl = 1,
      xp = 0,
      class = "fighter",
      prof = 2,
      hp = 0,
      hd = 0, -- hit dice
      exhaust = 0,
      con = mk_attr(8),
      str = mk_attr(8),
      dex = mk_attr(8),
      int = mk_attr(8),
      wis = mk_attr(8),
      cha = mk_attr(8),
      inv = {},
      skills = {},
      proficiencies = {},
   }

   function self.unequip (item_type)
      for _, entry in pairs(self.inv) do
         if entry.item.type == item_type then
            entry.item.equipped = false
         end
      end
   end

   function self.equip (id)
      local entry = self.inv[id]
      if entry ~= nil and entry.id == id then
         local item = entry.item
         self.unequip(item.type)
         item.equipped = true
      end
   end

   function self.add_to_inv (id)
      if self.inv[id] == nil then
         self.inv[id] = {item = ITEMS[id], qty = 1}
      else
         self.inv[id].qty = self.inv[id].qty + 1
      end
   end

   function self.get_equipped_item (type)
      for _, entry in pairs(self.inv) do
         if entry.item.type == type and entry.item.equipped then
            return item
         end
      end
   end

   function self.max_hp ()
      local hd = HIT_DIE[self.class]
      if self.lvl == 1 then
         return hd + self.con.mod
      else
         return hd + (self.level * ((hd \ 2) + 1))         
      end
   end

   function self.ac ()
      local shield = self.get_equipment("shield")
      local armor = self.get_equipment("armor")
      local ac = 0
      if armor ~= nil then
         ac = armor.ac
      else
         ac = 10 + self.dex.mod
      end
      if shield ~= nil then
         ac = ac + shield.ac
      end
      return ac
   end
   
   return self
end
