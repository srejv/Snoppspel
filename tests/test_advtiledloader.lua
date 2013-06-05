describe("AdvTiledLoader for LÖVE", function()
	local avdTiledLoader

	setup(function()
		package.path=package.path .. ';./../lib/Advanced-Tiled-Loader/loader.lua'
		loader = require 'loader'
		loader.path = "maps/"
	end)

	teardown(function()
		loader = nil
	end)

	--before_each(function()
	--end)

	it("is initializable", function()

	end)

	it("loads a file", function() 
		map = loader.load("desert.tmx")
		assert.truthy(map)
	end) 

	it("loads the right number of tilesets", function()
		pending("get to it")
	end)

	it("loads the tile width", function()
		pending("get to it")
	end)

	it("loads the tile height", function()
		pending("get to it")
	end)

	it("generates a drawable map", function()
		pending("get to it")
	end)

	it("", function()
		pending("get to it")
	end)

	it("", function()
		pending("get to it")
	end)
end)