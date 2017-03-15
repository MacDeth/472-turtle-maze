--0 represents wall, 1 represents floor, 2 represents goal
maze = {
    {0,  0,  0,  0,  0,  0,  0},
    {0,  1,  0,  7,  8,  9,  0},
    {0,  2,  0,  6,  0, 10,  0},
    {0,  3,  4,  5,  0, 11,  18},
    {0,  8,  0,  0,  0, 12,  0},
    {0, 17, 16, 15, 14, 13,  0},
    {0,  0,  0,  0,  0,  0,  0}
}
N = 7 --Width of Maze
M = 7 --Height of Maze

mt = {}
numNodes = 18 --Each Open Block is assigned a Number when found. Goal Node is highest

function fillMatrix()
    for i=1,numNodes do
        mt[i] = {}     -- create a new row
        for j=1,numNodes do
            mt[i][j] = 0
        end
    end
end
function adjacencyMatrix()
    for i=1, N-1 do
        for j=1, M-1 do
            currValue = maze[i][j]
            if currValue ~= 0 then
                --Determine if Node Adjacent East of Current
                eastValue = maze[i+1][j]
                if eastValue ~= 0 then
                    mt[currValue][eastValue] = 1
                    mt[eastValue][currValue] = 1
                end
                --Determine if Node Adjacent South of Current
                southValue = maze[i][j+1]
                if southValue ~= 0 then
                    mt[currValue][southValue] = 1
                    mt[southValue][currValue] = 1
                end
            end
        end
    end
end

fillMatrix()
adjacencyMatrix()

print("Original Maze:")
for i=1, N do
   for j=1, M do
       io.write(maze[i][j])
   end
   print()
end

print("Adjacency Matrix:")
for i=1, numNodes do
   for j=1, numNodes do
       io.write(mt[i][j])
   end
   print()
end
