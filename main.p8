function Game ()
   local self = {
      scenes = {},
      current_scene = nil
   }

   function self.switch_scene (name)
      self.current_scene = self.scenes[name]
   end
   
   return self
end

local g = Game()

function _init ()
   g.scenes["title"] = TitleScene(g)
   g.scenes["map"] = MapScene(g)
   g.switch_scene("title")
end

function _update()
   if (g.current_scene) g.current_scene.update()
end

function _draw()
   if (g.current_scene) g.current_scene.draw()
end
