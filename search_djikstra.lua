--0 represents wall, 1 represents floor, 2 represents goal
maze = {
    {0,  0,  0,  0,  0,  0,  0},
    {0,  1,  0,  7,  8,  9,  0},
    {0,  2,  0,  6,  0,  10,  0},
    {0,  3,  4,  5,  0,  11,  0},
    {0,  18, 0,  0,  0,  12,  0},
    {0,  17, 16, 15, 14, 13,  0},
    {0,  0,  0,  0,  0,  19,  0}
}
N = 7 --Width of Maze
M = 7 --Height of Maze

mt = {}
numNodes = 19 --Each Open Block is assigned a Number when found. Goal Node is highest

source = 1
target = 19

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

function Djikstra()

	--Initialization
	Q = {}
	Qsize = 0
	dist = {}
	prev = {}

	for v=1, numNodes do
			dist[v] = math.huge --Unknown Distance from source to v
			prev[v] = nil --Previous node in optimal path from source
			Q[v] = true --All nodes initially in Q (unvisited nodes)
			Qsize = Qsize + 1
	end

	dist[source] = 0 --Distance from source to source

	while Qsize > 0 do --Iterate While Q not Empty
		u = 0 --Instantiate u variable

		--Node with least distance selected first
		mindist = math.huge
		for k, v in pairs(Q) do --Iterate through set
			if v ~= nil then
				if dist[k] <= mindist then
						u = k
						mindist = dist[k]
				end
			end
		end

		Q[u] = nil; --Remove u from set Q
		Qsize = Qsize - 1

		if (u == target) then
			break
		end

		for v in pairs(Q) do
			if mt[u][v] == 1 then --For Each Neighbor
				alt = dist[u] + 1 --Length from U to V is always 1
				if alt < dist[v] then
					dist[v] = alt
					prev[v] = u
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
       io.write(string.format("%3d", maze[i][j]))
   end
   print()
end

print("\nAdjacency Matrix:")
for i=1, numNodes do
   for j=1, numNodes do
       io.write(string.format("%2d", mt[i][j]))
   end
   print()
end

Djikstra()

S = {}
u = target
print("\nDjikstra Path:")

--Construct Path To Pring
while prev[u] ~= nil do
	table.insert(S, 1, u)
	u = prev[u]
end
table.insert(S, 1, u) --Get final Num

for i = 1, #S do
	io.write(S[i])
	if i ~= #S then
		io.write("->")
	end
end
