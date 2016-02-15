front = {}

function front.load()

end

function front.draw()
	if level == 'game' then
		love.graphics.setColor(color.blank)
		love.graphics.draw(bg.game.big_one, 0, 0)
	end
end

function front.math(dt)

end

function UPDATE_FRONT(dt)
    front.math(dt)
end

function DRAW_FRONT()
    front.draw()
end
