local M = {}

local score = 0

function M.reset()
	score = 0
	msg.post("/hud#gui", "update", { score = score })
end

function M.get_score()
	return score
end

function M.add_score(add)
	score = score + add
	msg.post("/hud#gui", "update", { score = score })
	return score
end

return M

