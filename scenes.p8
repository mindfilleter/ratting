function Scene (game)
   local self = {game=game}

   function self.update () end
   function self.draw () end

   return self
end

function TitleScene (game)
   local self = Scene(game)

   function self.update ()
      if (btn(4) or btn(5)) self.game.switch_scene("map")
   end

   function self.draw ()
      cls()
      print("ratting", HALF_SIZE - 15, 0)
      print("[PRESS ANY BUTTON]", HALF_SIZE - 35, 8)
   end

   return self
end

function MapScene(game)
   local self = Scene(game)

   self.player = Player()
   self.player.position.x = 8
   self.player.position.y = 8
   self.sprites = {self.player}
   self.focus = self.player

   function self.update ()
      for _, sprite in pairs(self.sprites) do
         sprite.update()
      end
   end

   function self.draw ()
      cls()
      if self.focus then
         rect = self.focus.rect
         camera(rect.cx() - HALF_SIZE, rect.cy() - HALF_SIZE)
      end
      map(0, 0)
      for _, sprite in pairs(self.sprites) do
         sprite.draw()
      end
   end

   return self
end
