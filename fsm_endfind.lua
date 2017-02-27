local GPS_TIMEOUT = 5
local abs_x, abs_y, abs_z = gps.locate(GPS_TIMEOUT)


local function IsEnd()

  local success, data = turtle.inspectDown()
  if success then
    if data.metadata == 14 then return true end
  end

  return false
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

-- print(FindEnd(0,0,0,0,0))
