function Player ()
   local self = Sprite()
   local super_update = self.update
   
   self.position = Vec2(0.0, 0.0)
   self.speed = Vec2(0.0, 0.0)
   self.max_speed = 1.0
   self.rect.h = 16

   self.h = 16
   self.framesets = {
      n={67, 68, 67, 69},
      e={},
      s={64, 65, 64, 66},
      w={}
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
         self.speed.x = -self.max_speed
      elseif btn(1) then
         self.speed.x = self.max_speed
      else
         self.speed.x = 0.0
      end

      if btn(2) then
         self.speed.y = -self.max_speed
         self.frames = self.framesets.n
      elseif btn(3) then
         self.speed.y = self.max_speed
         self.frames = self.framesets.s         
      else
         self.speed.y = 0.0
      end
   end

   function process_movement()
      process_horizontal_movement()
      process_vertical_movement()
   end

   function process_horizontal_movement()
      if self.speed.x ~= 0 then
         self.position.x = self.position.x + self.speed.x
         if self.in_wall() then
            self.position.x = self.old_position.x
            self.speed.x = 0
         end
      end
   end

   function process_vertical_movement()
      if self.speed.y ~= 0 then
         self.position.y = self.position.y + self.speed.y
         if self.in_wall() then
            self.position.y = self.old_position.y
            self.speed.y = 0
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
      return self.speed.x ~= 0 or self.speed.y ~= 0
   end

   function self.draw()
      spr(self.frames[self.current_frame], self.position.x, self.position.y)
      spr(self.frames[self.current_frame] + 16, self.position.x, self.position.y + 8)
   end

   return self
end
