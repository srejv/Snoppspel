describe("busted", function()
	local obj1, obj2
	local util

	setup(function()
		util = require("util")
	end)

	teardown(function()
		util = nil
	end)

	before_each(function()
		obj1 = { test = "yes" }
		obj2 = { test = "yes" }
	end)

	it("set up vars with the before_each", function()
		obj2 = { test = "no" }
		assert.are_not_same(obj1, obj2)
	end)

	it("set up vars with the before_each", function()
		-- obj2 reset thanks to before_each
		assert.same(obj1, obj2)
	end)

	describe("nested", function()
		it("also runs the before_each here", function()
			-- if this described also had a before_each, it would run
			-- both, starting with the parents'. you can go n-deep.
		end)
	end)

	describe("square", function() 
		pending("write test for square")
	end)
end)