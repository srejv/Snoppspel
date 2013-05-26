


scene = {
	update = function(dt) end,
	draw = function() end,
	load = function() end,
	onEnter = function() end,
	onExit = function() end,
}






function love.load()
	-- initialize

end


function love.update(dt)
	-- update input

	-- update game

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
		
end