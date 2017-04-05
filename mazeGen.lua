--Creates square maze with length as the length of both sides
--1 = wall, 0 = open
--length should be odd

length = 15
map = {} --final grid

cellGrid = {}
gridLen = (length-1)/2

unvisited = {}

for i=1, gridLen do
  cellGrid[i] = {}
  for j=1, gridLen do
    cellGrid[i][j] = {}
    cellGrid[i][j]["u"] = 1
    cellGrid[i][j]["d"] = 1
    cellGrid[i][j]["l"] = 1
    cellGrid[i][j]["r"] = 1
    cellGrid[i][j]["visited"] = 0
    cellGrid[i][j]["prevX"] = -1
    cellGrid[i][j]["prevY"] = -1
  end
end

current = {}
current["x"] = 1
current["y"] = 1
generating = 1
math.randomseed(os.time())

while generating == 1 do
  n = math.random(0,3)
  cellGrid[current["x"]][current["y"]]["visited"] = 1

  if n == 0 then
    -- move left if possible
    if current["x"] ~= 1 and cellGrid[current["x"]-1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["l"] = 0
      cellGrid[current["x"]-1][current["y"]]["r"] = 0
      cellGrid[current["x"]-1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]-1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] - 1
      -- move right if possible
    elseif current["x"] ~= gridLen and cellGrid[current["x"]+1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["r"] = 0
      cellGrid[current["x"]+1][current["y"]]["l"] = 0
      cellGrid[current["x"]+1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]+1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] + 1
      -- move up if possible
    elseif current["y"] ~= 1 and cellGrid[current["x"]][current["y"]-1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["u"] = 0
      cellGrid[current["x"]][current["y"]-1]["d"] = 0
      cellGrid[current["x"]][current["y"]-1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]-1]["prevY"] = current["y"]
      current["y"] = current["y"] - 1
      -- move down if possible
    elseif current["y"] ~= gridLen and cellGrid[current["x"]][current["y"]+1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["d"] = 0
      cellGrid[current["x"]][current["y"]+1]["u"] = 0
      cellGrid[current["x"]][current["y"]+1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]+1]["prevY"] = current["y"]
      current["y"] = current["y"] + 1
      -- move back
    else
      if cellGrid[current["x"]][current["y"]]["prevX"] == -1 then
        generating = 0
      elseif cellGrid[current["x"]][current["y"]]["prevY"] == -1 then
        generating = 0
      else
        current["x"] = cellGrid[current["x"]][current["y"]]["prevX"]
        current["y"] = cellGrid[current["x"]][current["y"]]["prevY"]
        if current["x"] == -1 or current["y"] == -1 then
          generating = 0
        end
      end
    end

  elseif n == 1 then
    -- move down if possible
    if current["y"] ~= gridLen and cellGrid[current["x"]][current["y"]+1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["d"] = 0
      cellGrid[current["x"]][current["y"]+1]["u"] = 0
      cellGrid[current["x"]][current["y"]+1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]+1]["prevY"] = current["y"]
      current["y"] = current["y"] + 1
      -- move up if possible
    elseif current["y"] ~= 1 and cellGrid[current["x"]][current["y"]-1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["u"] = 0
      cellGrid[current["x"]][current["y"]-1]["d"] = 0
      cellGrid[current["x"]][current["y"]-1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]-1]["prevY"] = current["y"]
      current["y"] = current["y"] - 1
      -- move right if possible
    elseif current["x"] ~= gridLen and cellGrid[current["x"]+1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["r"] = 0
      cellGrid[current["x"]+1][current["y"]]["l"] = 0
      cellGrid[current["x"]+1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]+1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] + 1
      -- move left if possible
    elseif current["x"] ~= 1 and cellGrid[current["x"]-1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["l"] = 0
      cellGrid[current["x"]-1][current["y"]]["r"] = 0
      cellGrid[current["x"]-1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]-1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] - 1
      -- move back
    else
      if cellGrid[current["x"]][current["y"]]["prevX"] == -1 then
        generating = 0
      elseif cellGrid[current["x"]][current["y"]]["prevY"] == -1 then
        generating = 0
      else
        current["x"] = cellGrid[current["x"]][current["y"]]["prevX"]
        current["y"] = cellGrid[current["x"]][current["y"]]["prevY"]
        if current["x"] == -1 or current["y"] == -1 then
          generating = 0
        end
      end
    end
  elseif n == 2 then
    -- move right if possible
    if current["x"] ~= gridLen and cellGrid[current["x"]+1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["r"] = 0
      cellGrid[current["x"]+1][current["y"]]["l"] = 0
      cellGrid[current["x"]+1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]+1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] + 1
      -- move left if possible
    elseif current["x"] ~= 1 and cellGrid[current["x"]-1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["l"] = 0
      cellGrid[current["x"]-1][current["y"]]["r"] = 0
      cellGrid[current["x"]-1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]-1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] - 1
      -- move down if possible
    elseif current["y"] ~= gridLen and cellGrid[current["x"]][current["y"]+1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["d"] = 0
      cellGrid[current["x"]][current["y"]+1]["u"] = 0
      cellGrid[current["x"]][current["y"]+1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]+1]["prevY"] = current["y"]
      current["y"] = current["y"] + 1
      -- move up if possible
    elseif current["y"] ~= 1 and cellGrid[current["x"]][current["y"]-1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["u"] = 0
      cellGrid[current["x"]][current["y"]-1]["d"] = 0
      cellGrid[current["x"]][current["y"]-1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]-1]["prevY"] = current["y"]
      current["y"] = current["y"] - 1
      -- move back
    else
      if cellGrid[current["x"]][current["y"]]["prevX"] == -1 then
        generating = 0
      elseif cellGrid[current["x"]][current["y"]]["prevY"] == -1 then
        generating = 0
      else
        current["x"] = cellGrid[current["x"]][current["y"]]["prevX"]
        current["y"] = cellGrid[current["x"]][current["y"]]["prevY"]
        if current["x"] == -1 or current["y"] == -1 then
          generating = 0
        end
      end

    end

  elseif n == 3 then
    -- move up if possible
    if current["y"] ~= 1 and cellGrid[current["x"]][current["y"]-1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["u"] = 0
      cellGrid[current["x"]][current["y"]-1]["d"] = 0
      cellGrid[current["x"]][current["y"]-1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]-1]["prevY"] = current["y"]
      current["y"] = current["y"] - 1
      -- move down if possible
    elseif current["y"] ~= gridLen and cellGrid[current["x"]][current["y"]+1]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["d"] = 0
      cellGrid[current["x"]][current["y"]+1]["u"] = 0
      cellGrid[current["x"]][current["y"]+1]["prevX"] = current["x"]
      cellGrid[current["x"]][current["y"]+1]["prevY"] = current["y"]
      current["y"] = current["y"] + 1
      -- move left if possible
    elseif current["x"] ~= 1 and cellGrid[current["x"]-1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["l"] = 0
      cellGrid[current["x"]-1][current["y"]]["r"] = 0
      cellGrid[current["x"]-1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]-1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] - 1
      -- move right if possible
    elseif current["x"] ~= gridLen and cellGrid[current["x"]+1][current["y"]]["visited"] == 0 then
      cellGrid[current["x"]][current["y"]]["r"] = 0
      cellGrid[current["x"]+1][current["y"]]["l"] = 0
      cellGrid[current["x"]+1][current["y"]]["prevX"] = current["x"]
      cellGrid[current["x"]+1][current["y"]]["prevY"] = current["y"]
      current["x"] = current["x"] + 1
      -- move back
    else
      if cellGrid[current["x"]][current["y"]]["prevX"] == -1 then
        generating = 0
      elseif cellGrid[current["x"]][current["y"]]["prevY"] == -1 then
        generating = 0
      else
        current["x"] = cellGrid[current["x"]][current["y"]]["prevX"]
        current["y"] = cellGrid[current["x"]][current["y"]]["prevY"]
        if current["x"] == -1 or current["y"] == -1 then
          generating = 0
        end
      end
    end
  end
end

for i = 1, gridLen do
  x = ""
  for j = 1, gridLen do
    x= x .. " " .. cellGrid[i][j]['l'] .. cellGrid[i][j]['d'] .. cellGrid[i][j]['r'] .. cellGrid[i][j]['u']
  end
  --print(x)
end

gridMap = {}
for i=1, length do
  gridMap[i] = {}
  x = ""
  for j=1, length do
    y = ""
    if i == 1 or i == length or j == 1 or j == length then
      gridMap[i][j] = 1
    elseif i%2 == 1 and j%2 == 1 then
      gridMap[i][j] = 1
    elseif i%2 == 0 and j%2 == 0 then
      gridMap[i][j] = 0
    else
      if i%2 == 1 and j%2 == 0 then
        gridMap[i][j] = cellGrid[(i-1)/2][j/2]["r"]
      else
        gridMap[i][j] = cellGrid[(i/2)][(j-1)/2]["u"]
      end
    end

    x = x .. gridMap[i][j]
  end
  print(x)
end
