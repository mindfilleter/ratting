function Player ()
   local self = Sprite()
   local super_update = self.update

   self.w = 8
   self.h = 16
   self.sx = 0
   self.sy = 0
   self.max_s = 1

   self.framesets = {
      n={67, 68, 67, 69},
      e={73, 74, 73, 75},
      s={64, 65, 64, 66},
      w={70, 71, 70, 72}
   }
   self.frame_delay = 0
   self.frames = self.framesets.s
   self.current_frame = 1
   
   function self.update()
      super_update()
      process_input()
      process_movement()
      animate()
   end

   function process_input()
      if btn(0) then
         self.sx = -self.max_s
         self.frames = self.framesets.w
      elseif btn(1) then
         self.sx = self.max_s
         self.frames = self.framesets.e
      else
         self.sx = 0.0
      end

      if btn(2) then
         self.sy = -self.max_s
         self.frames = self.framesets.n
      elseif btn(3) then
         self.sy = self.max_s
         self.frames = self.framesets.s         
      else
         self.sy = 0.0
      end
   end

   function process_movement()
      process_horizontal_movement()
      process_vertical_movement()
   end

   function process_horizontal_movement()
      if self.sx ~= 0 then
         self.x = self.x + self.sx
         if self.in_wall() then
            self.x = self.ox
            self.sx = 0
         end
      end
   end

   function process_vertical_movement()
      if self.sy ~= 0 then
         self.y = self.y + self.sy
         if self.in_wall() then
            self.y = self.oy
            self.sy = 0
         end
      end
   end

   function animate()
      if is_moving() then
         self.frame_delay = self.frame_delay + 1
         if self.frame_delay == 3 then
            self.frame_delay = 0
            self.current_frame = self.current_frame + 1
            if self.current_frame == 5 then
               self.current_frame = 1
            end
         end
      else
         self.frame_delay = 0
         self.current_frame = 1
      end
   end

   function is_moving()
      return self.sx ~= 0 or self.sy ~= 0
   end

   function self.draw()
      spr(self.frames[self.current_frame], self.x, self.y)
      spr(self.frames[self.current_frame] + 16, self.x, self.y + 8)
   end

   function self.in_wall()
      t = (self.y + 8) \ 8
      l = self.x \ 8
      b = ((self.y + 8) + ((self.h \ 2) - 1)) \ 8
      r = (self.x + (self.w - 1)) \ 8
      return fget(mget(l, t), 0)
         or fget(mget(r, t), 0)
         or fget(mget(l, b), 0)
         or fget(mget(r, b), 0)      
   end

   return self
end
