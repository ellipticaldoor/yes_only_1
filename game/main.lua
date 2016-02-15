require "/lua/background"
require "/lua/front"
require "/lua/player"

math.randomseed( os.time() )

function love.load()
	love.window.setMode(1280, 720)
	
	level = 'intro'

	f = love.graphics.newFont( "fonts/Red_Alert_INET.ttf", 48 )
	love.graphics.setFont(f)

	--Loading classes
	love.mouse.setVisible(false)

	bg.load()
	player.load()
	front.load()
end

function love.update(dt)
	UPDATE_BG(dt)
	UPDATE_PLAYER(dt)
	UPDATE_FRONT(dt)

	local fps=love.timer.getFPS
	love.window.setTitle("LD28 - "..fps().." FPS")
end

function love.draw()
	DRAW_BG()
	DRAW_PLAYER()
	DRAW_FRONT()
end

function love.keypressed(key)
	if key == 'escape' then love.event.quit() end
end
