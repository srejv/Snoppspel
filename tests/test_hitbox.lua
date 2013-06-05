describe("Test hitbox functionality", function()
	local hitbox

	setup(function()
		package.path=package.path .. ';../?.lua'
		hitbox = require('hitbox.lua')
	end)

	teardown(function()
		hitbox = nil
	end)

	--before_each(function()
	--end)

	it("Can create a player", function()
		upperLeftX, upperLeftY, width, height = 0, 0, 100, 100
		local h = hitbox.createHitbox()
		assert.truthy(h)
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