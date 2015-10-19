local config = require "main.config"

local M = {}

local missiles = {}
local m_count = 0

local function create_missile(missile)
	missile.crosshair_id = factory.create("/factories#crosshair", missile.target_pos, nil, {}, 0.5)
	for i=1,config.NR_MISSILES_IN_SHOT do
		missile.missile_id = factory.create("/factories#missile", nil, nil, { nr = i, missile_id = missile.id, start_pos = vmath.vector3(200,100,0), end_pos = missile.target_pos }, 0.5)
	end
end

function M.add_missile(pos_x,pos_y)
	m_count = m_count + 1
	local new_missile = { id = hash(tostring(m_count)), target_pos = vmath.vector3(pos_x, pos_y,0) }
	create_missile(new_missile)	
	missiles[new_missile.id] = new_missile
end

function M.remove_missile(id)
	local missile = missiles[id]
	if missile == nil then 
		print("Warning: No missile with that id")
	else
		go.delete(missile.crosshair_id)
	end
end

return M
