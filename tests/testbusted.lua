describe("busted", function() 
	it("has tests", function() 
		local obj1 = {test = "yes"}
		local obj2 = {test = "yes"}
		assert.same(obj1, obj2)
	end)
end)

describe("point", function()
	it("test creation", function()
		local obj1 = {}
		assert.same(obj1, nil)
	end)
end)

