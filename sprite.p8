function Sprite ()
   local self = {
      position = Vec2(0, 0),
      rect = Rect(0, 0, 8, 8),
      old_position = Vec2(0, 0),
   }

   function self.update()
      self.old_position.x = self.position.x
      self.old_position.y = self.position.y
      self.rect.x = self.position.x
      self.rect.y = self.position.y
   end

   function self.in_wall()
      rect = self.rect
      t = rect.t() \ 8
      l = rect.l() \ 8
      b = rect.b() \ 8
      r = rect.r() \ 8
      return fget(mget(l, t), 0)
         or fget(mget(r, t), 0)
         or fget(mget(l, b), 0)
         or fget(mget(r, b), 0)      
   end

   return self
end
