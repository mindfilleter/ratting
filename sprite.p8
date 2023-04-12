function Sprite ()
   local self = {
      x = 0,
      y = 0,
      w = 0,
      h = 0,
      ox = 0,
      oy = 0,
   }

   function self.update()
      self.ox = self.x
      self.oy = self.y
   end

   function self.get_center()
      return {x=self.x + (self.w \ 2), y=self.y + (self.h \ 2)}
   end

   return self
end
