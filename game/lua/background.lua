bg = {}

function bg.load()
	-- Colors
	color = {
		white = {236,240,241},
		black = {52,73,94},
		blue = {52,152,219},
		red = {231,76,60},
		blank = {255,255,255}
	}

	-- Intro
	bg.intro = {
		love.graphics.newImage("/images/intro/You.png"),
		love.graphics.newImage("/images/intro/only.png"),
		love.graphics.newImage("/images/intro/get.png"),
		love.graphics.newImage("/images/intro/1.png"),
	}

	bg.show = 1
	bg.intro_timer = 0

	bg.blip = love.audio.newSource("sound/blip.wav")
	love.audio.play(bg.blip)

	-- Game
	bg.game = {
		big_one = love.graphics.newImage("/images/game/big_one.png"),
		arrow = love.graphics.newImage("/images/game/arrow.png")
	}

	bg.show_arrow = true
end

function bg.draw()
	if level == 'intro' then
		love.graphics.setColor(color.blank)
		love.graphics.draw(bg.intro[bg.show], 0, 0)
	end

	if level == 'game' then
		love.graphics.setColor(color.white)
		love.graphics.rectangle("fill", 0, 0, 1280, 720)

		if bg.show_arrow == true then
			love.graphics.draw(bg.game.arrow, player.x + player.w/2 - 149/2, player.y - player.h/2 - 200)
		end
	end
end

function bg.math(dt)
	if level == 'intro' then
		bg.intro_timer = bg.intro_timer + dt*75

		if bg.intro_timer > 100 then
		   bg.show = bg.show + 1
		   bg.intro_timer = 0

		   love.audio.play(bg.blip)

		   if bg.show > 4 then
				level = 'game'
			end
		end 
	end

	if level == 'game' then
		showplayer, moveplayer = true, true

		if bg.show_arrow == true
			and player.x ~= 1280/4 - player.w/2
			or player.y ~= 720/2 - player.h/2
			then
			bg.show_arrow = false
		end
	end
end

function UPDATE_BG(dt)
	bg.math(dt)
end

function DRAW_BG()
	bg.draw()
end
