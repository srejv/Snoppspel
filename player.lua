Class = require "lib.hump.class"

Player = Class{
	action = { STAND_STILL = 0, WALK_LEFT = 1, WALK_RIGHT = 2, JUMP = 3 },
	actionMap = {},
	
	speed = 96,
	gravity = 900,

	hitbox = 0,

	currentdt = 0,

	init = function(self, x, y)
		self.x,self.y = x, y

		for i,v in pairs(self.action) do
			self.actionMap[v] = false
		end
	end,	
}

function Player:update(dt)
	self.currentdt = dt

	if self.actionMap[self.action.WALK_LEFT] then
		self:_walkLeft()
	end

	if self.actionMap[self.action.WALK_RIGHT] then
		self:_walkRight()
	end

	if self.actionMap[self.action.JUMP] then
		self:_jump()
	end
end

function Player:_walkLeft() 
	self.x = self.x - self.speed*self.currentdt
end

function Player:_walkRight()
	self.x = self.x + self.speed*self.currentdt
end

function Player:_jump()
	


end

function Player:toggleAction(action)
	self.actionMap[action] = not self.actionMap[action]
end

function Player:activateAction(action)
	self.actionMap[action] = true
end

function Player:deactivateAction(action)
	self.actionMap[action] = false
end