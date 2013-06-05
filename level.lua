Class = require "lib.hump.class"

TilesetImage = Class{
}

Level = Class{
	tiles = {},
	init = function(self, fileName)
		self.tilesetImage = love.graphics.loadImage(fileName)
	end,
}

function Level:loadTileset(self, leveldata)
	self.imagewidth = self.
end

function Level:createQuads(self, leveldata) 
	local tileWidth = leveldata.layers[0].width
	local tileHeight = leveldata.layers[0].height
	local tilemapSize = tileWidth * tileHeight;
	local tilesetWidth = leveldata.tilesets[0].imagewidth
	local tilesetHeight = leveldata.tilesets[0].imageheight

	local x,y = 0,0

	for x = 1, leveldata.width do
		for y = 1, leveldata.height do
			love.graphics.newQuad( x, y, width, height, sw, sh)	
			love.graphics.newQuad( tileWidth*(x-1), tileHeight*(x-1), 
				tileWidth, tileHeight, tilesetWidth, tilesetHeight )
		end
		x = math.floor(i % tileWidth)
		y = math.floor(i / tileWidth)
		tables.insert(self.tiles, love.graphics.newQuad())
	end
	table.insert(self.tiles, love.graphics.newQuad())
end

function Level:draw()

end

Point = Class {
	init = function(self, x, y)
		self.x = x
		self.y = y
	end,
}

function Point:distanceBetween(self, point)

end

function Point:Asdf()
	end


Enemy = Class{
	pos = { 0, 0},

	init = function() 
	end,
}

function Enemy:update(dt)
end
function Enemy:draw()
end

EnemyContainer = Class{
	enemies = {},

	getEnemiesInArea = function(x,y,w,h)
		return nil
	end,

}

function DrawWorld()
	level:draw() 
	enemies:draw()
	items:draw()
	player:draw()
end
