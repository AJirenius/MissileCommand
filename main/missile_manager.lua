local M = {}

local missiles = {}
local m_count = 0

function create_cross_hair(missile)

end

function M.add_missile(pos_x,pos_y)
	m_count = m_count + 1
	local new_missile = { id = hash(to_string(m_count)), x = pos_x, y = pos_y }
	
	create_crosshair(new_missile)
	create_missile(new_missile)
	
	missiles[new_missile.id] = new_missile
end


return M
