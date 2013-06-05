
local tx,ty = 0,0

Camera = require "lib.hump.camera"



function love.load()
	player = {
		x = 0, y = 0
	}

	local loader = require("lib.AdvTiledLoader.loader")
	loader.path = "maps/"

	-- desert map
	map = loader.load("bajs2.tmx")

	layer = map("Objects")
	--debug.debug()

	for i=1, #layer.objects do
		if layer.objects[i].name == "Player" then
			player = layer.objects[i]
			--player.x = player.x * map.tileWidth
			--player.y = player.y * map.tileHeight
		end
	end
	player = convertPlayer(player)
	

	map.drawObjects = false

	-- Limits the drawing range of the map. Important for performance
	--map:setDrawRange(0,0,love.graphics.getWidth(), love.graphics.getHeight())

	namedTiles = getNamedTilesFromMap(map)
	
	cam = Camera(-player.x, player.y)

	screen_width = love.graphics.getWidth()
	screen_height = love.graphics.getHeight() 
	
end

function love.update(dt)
	if love.keyboard.isDown("up") then player.y = player.y - 96*dt end
	if love.keyboard.isDown("down") then player.y = player.y + 96*dt end
	if love.keyboard.isDown(player.goRight) then player.x = player.x + 96*dt end
	if love.keyboard.isDown(player.goLeft) then player.x = player.x - 96*dt end

	
	--if isCameraInsideLevel() then
	--local dx,dy = player.x - cam.x, player.y - cam.y
	--cam:move(dx/2, dy/2)
	--end
end

function love.draw()
	--map:autoDrawRange( math.floor(-cam.x + screen_width), math.floor(cam.y), 1, pad)

	cam:attach()
	-- apply translation
	--love.graphics.translate( math.floor(tx), math.floor(ty))

	-- set the draw range. setting this will significantly increase performance
	map:draw()

	love.graphics.draw(player.image, player.x, player.y)

	cam:detach()

end

function getNamedTilesFromMap(map)
	local foundTilesWithNames = {}
	for id, tile in pairs(map.tiles) do
		if tile.properties.name then
			foundTilesWithNames[tile.properties.name] = tile
		end
	end
	return foundTilesWithNames
end

function getNamedObjectsFromMap(map)
	local foundObjectsWithName = {}
	for id, object in pairs(map.layers["objects"].objects) do
		if object.properties.name then
			foundObjectsWithName[object.properties.name] = object
		end
	end
	return foundObjectsWithName
end


function convertPlayer(playerOld)
	local player = { x = playerOld.x, y = playerOld.y }
	player.name = "player"
	player.image = love.graphics.newImage("gfx/player/penis.png")
	player.goLeft = "left"
	player.goRight = "right"
	player.goJump = "space"

	return player
end

function isCameraInsideLevel()
	return false
end