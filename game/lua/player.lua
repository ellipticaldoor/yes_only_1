--require "/lua/background"

player = {}

function player.load()
	showplayer, moveplayer = false, false

	player.w, player.h = 50, 50
	player.x, player.y = 1280/4 - player.w/2, 720/2 - player.h/2
	player.xvel, player.yvel = 0, 0
	player.spd, player.fr = 10000, 4.5

	top, ground = 0, 720
end

function player.draw()
	if showplayer == true then
		love.graphics.setColor(color.blue)
		love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
	end
end

function player.move(dt)
	if moveplayer == true then
		if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
			player.xvel = player.xvel + player.spd * dt
		end
		if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
			player.xvel = player.xvel - player.spd * dt
		end
		
		if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
			player.yvel = player.yvel - player.spd*2 * dt
		end
		if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
			player.yvel = player.yvel + player.spd*2 * dt
		end
	end
end

function player.math(dt)
	-- Velocidad
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	
	-- Fricción
	player.xvel = player.xvel * (1 - math.min(dt * player.fr, 1))
	player.yvel = player.yvel * (1 - math.min(dt * player.fr, 1))
end


function player.limit()
	if player.x < -player.w then
		player.x = 1280 - 5
	end

	if player.x > 1280 then
		player.x = -player.w + 5
	end

	if player.y < - player.h then
		player.y = ground - 5
	end

	if player.y > ground then
		player.y = -player.h + 5
	end
end

function UPDATE_PLAYER(dt)
	player.limit()
	player.math(dt)
	player.move(dt)
end

function DRAW_PLAYER()
	player.draw()
end
