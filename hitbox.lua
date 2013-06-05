
Class = require 'lib.hump.class'

HitBox = Class{
	init = function(self, upperLeftX, upperLeftY, width, height)
		self.x = upperLeftX
		self.y = upperLeftY
		self.width = width
		self.height = height
	end
}


function HitBox:testIfHitPointOverlap(self, point)
	error("Not implemented yet.")
end

function HitBox:testIfHitBoxOverlap(self, hitbox)
	error("Not implemented yet.")
end
	
