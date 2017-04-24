local GPS_TIMEOUT = 5
local abs_x, abs_y, abs_z = gps.locate(GPS_TIMEOUT)
local maze = {}
local orientation = 0 --0 = -x, 1 = -z, 2 = +x, 3 = +z
--In Array, Treat down as +z and right as +x. Dir assumes we start looking towards -x.

local function IsEnd()

	local success, data = turtle.inspectDown()
	if success then
		if data.metadata == 14 then return true end --Checks if ending block is Green.
	end

  return false
end

function turnLeft()
	turtle.turnLeft();
	orientation = (orientation - 1) % 4;
end
 
function turnRight()
  turtle.turnRight();
  orientation = (orientation + 1) % 4;
end


function FindEnd(x, y, z, length, width)
	local ITERATION_MAX = 10000
	local end_found = false
	local end_x, end_y, end_z

	local i = 0
	while i < ITERATION_MAX do
		
		if IsEnd() then
			-- State: End Found
			end_found = true
			end_x, end_y, end_z = gps.locate(GPS_TIMEOUT)
			break
		end

		-- State: Turn to Opening
		turtle.turnLeft()
		-- State: Observe
		while turtle.detect() do
			 --[[
				Map the block on array map:
				
			  ]]--
			  -- State: Turn to Opening
			  turtle.turnRight()
			  -- State: Observe
		end
    -- State: Move
    turtle.forward()
    i = i + 1
  end

  return end_found, end_x, end_y, end_z
end

print(FindEnd(0,0,0,0,0))
