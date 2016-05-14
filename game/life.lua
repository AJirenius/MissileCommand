local M = {}

local life = 5

function M.reset()
	life = 5
	msg.post("/hud#gui", "update", { life = life })
end

function M.get_life()
	return life
end

function M.dec_life()
	if life == 0 then return end
	life = life - 1
	msg.post("/hud#gui", "update", { life = life })
	if life < 1 then
		msg.post("/main","game_over")
	end
	return life
end

return M

