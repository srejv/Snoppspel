love.filesystem.load("animation.lua")()


scene = {
	update = function(dt) end,
	draw = function() end,
	load = function() end,
	onEnter = function() end,
	onExit = function() end,
}

function newBullet(x,y,xspeed,yspeed) 
	bullet = {
		x = x,
		y = y,
		xspeed = xspeed,
		yspeed = yspeed,
		width = 32,
		height = 32,
		time = 3,
	}

	return bullet
end

bullets = {}


function love.load()
	-- initialize
	playerWalk = love.graphics.newImage("gfx/player/penis_walking.png")
	playerJump = love.graphics.newImage("gfx/player/penis_jumping.png")
	sagg = love.graphics.newImage("gfx/player/sagg.png")

	-- Create an animation with a frame size of 32x32 and
	-- 0.1s delay betwen each frame.
	player = {
		x = 400,
		y = 300,
		xspeed = 100,
		yspeed = 20,

		gravity = 0,

		ground = 400,
		walk = newAnimation(playerWalk, 64, 128, 0.15, 3),
		jump = newAnimation(playerJump, 64, 128, 0.50, 3),
		state = "walk",

		shootCooldown = 0,
	}



	love.graphics.setBackgroundColor(200,156,200)
end


function love.update(dt)
	-- update input
	moveHor = love.joystick.getAxis( 1, 1 )
	if moveHor > 0.2 or moveHor < -0.2 then
		player.x = player.x + player.xspeed * dt * moveHor
	end

	moveVer = love.joystick.getAxis( 1, 2 )
	if moveVer > 0.2 or moveVer < -0.2 then
		player.y = player.y + player.yspeed * dt * moveVer
	end

	doJump = love.joystick.isDown(1, 1)
	if doJump and player.state == "walk" then
		player.state = "jump"
		player.jump.position = 1
		player.ground = player.y
		player.gravity = -600
	end

	if player.state == "jump" then
		player.y = player.y + player.gravity*dt

		player.gravity = player.gravity + 980 * dt

		if player.y > player.ground then
			player.y = player.ground
			player.state = "walk"
		end

	end

	doAttack = love.joystick.isDown(1, 2)
	if doAttack and player.shootCooldown <= 0 then
		player.shootCooldown = 0.1
		table.insert(bullets, newBullet(player.x + 52, player.y + 14, moveHor*250, moveVer*250))
	else
		player.shootCooldown = player.shootCooldown - dt
	end

	-- update game
	if player.state == "walk" then
		player.walk:update(dt)
	end

	if player.state == "jump" then
		player.jump:update(dt)
	end

	-- update bullets
	for i,v in pairs(bullets) do
		v.x = v.x + v.xspeed * dt
		v.y = v.y + v.yspeed * dt

		v.time = v.time - dt
		if v.time <= 0 then
			table.remove(bullets, i)
		end
	end
end

function love.draw()
	-- draw stuff
	-- axisDir1, axisDir2, axisDirN = love.joystick.getAxes( joystick )
	joysticks = love.joystick.getNumJoysticks( )

	for i=1,joysticks do
		

		love.graphics.print("Gamepad " .. joysticks, 10, 100)
		
		axis = love.joystick.getNumAxes( i )
		--axes = love.joystick.getAxes( 2 )
		for j=1, axis do
			direction = love.joystick.getAxis( i, j )
			love.graphics.print("Axis " .. j .. ": " .. direction , 10, 10+60*j)
			--love.graphics.print("Axis1: " .. axisDir1, 10, 10+60*j)
			--love.graphics.print("Axis2: " .. axisDir2, 10, 20+60*j)
			--love.graphics.print("AxisN: " .. axisDirN, 10, 40+60*j)
		end
		buttons = love.joystick.getNumButtons(i)

		for j=1,buttons do
			if love.joystick.isDown(i, j) then 
				love.graphics.print("Button " .. j .. ": " .. "Down", 200, 100+j*20)		
			else 
				love.graphics.print("Button " .. j .. ": " .. "Up" , 200, 100+j*20)		
			end
		end
	end
	
	-- Draw the animation the center of the screen.
	if player.state == "walk" then
		player.walk:draw(math.floor(player.x), math.floor(player.y), 0, 1, 1)
	end

	if player.state == "jump" then
		player.jump:draw(math.floor(player.x), math.floor(player.y), 0, 1, 1)
	end

	for i,v in pairs(bullets) do
		love.graphics.draw(sagg, v.x, v.y)
	end

end