describe("Test Player functionality", function()
	local player, playerInstance

	setup(function()
		package.path=package.path .. ';./../?.lua'
		player = require('player')
	end)

	teardown(function()
		player = nil
	end)

	describe("initialization", function() 
		it("can create a player", function()
			local p = Player(0,0)
			assert.truthy(p)
		end)

		it("can create a player at a position", function()
			local x, y = 12, 348
			local p = Player(x, y)
			assert.are.same(p.x, x)
			assert.are.same(p.y, y)
		end)
	end)

	describe("movement", function()
		before_each(function()
			playerInstance = Player(0,0)
		end)

		it("can set movement action walk left", function()
			playerInstance:activateAction(playerInstance.action.WALK_LEFT)

			assert.True(playerInstance.actionMap[playerInstance.action.WALK_LEFT])
		end)

		it("can walk left", function()
			playerInstance.x = 0
			playerInstance.speed = 96
			playerInstance:activateAction(playerInstance.action.WALK_LEFT)

			playerInstance:update(1.0)

			assert.are.same(-playerInstance.speed, playerInstance.x)
		end)

		it("can walk right", function()
			playerInstance.x = 0
			playerInstance.speed = 96
			playerInstance:activateAction(playerInstance.action.WALK_RIGHT)

			playerInstance:update(1.0)

			assert.are.same(playerInstance.speed, playerInstance.x)
		end)

		it("can jump", function()
			playerInstance.x = 0
			playerInstance.y = 0
			playerInstance.speed = 96
			playerInstance:activateAction(playerInstance.action.JUMP)

			playerInstance:update(1.0)

			-- hur mkt efter en sekund?
			assert.True(0 > playerInstance.y)
			
		end)
	end)
end)
