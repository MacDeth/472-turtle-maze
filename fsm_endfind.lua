local GPS_TIMEOUT = 5
local abs_x, abs_y, abs_z = gps.locate(GPS_TIMEOUT)

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
    while turtle.detect() do -- State: Observe
      turtle.turnRight()
    end
    -- State: Move
    turtle.forward()
    i = i + 1
  end

  return (end_found, end_x, end_y, end_z)
end

--[[
  For now end is marked with no block below the robot,
  will change to detecting colored wool or something later.
]]--
local function IsEnd()
  --[[
    local success, data = turtle.inspectDown()
    if success then
      if data.name = "minecraft:wool or some shit" then return true end
      -- data.metadata is another thing we can use maybe
    end

    return false
  ]]--
  return not turtle.detectDown()
end
