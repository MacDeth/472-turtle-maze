--Creates shortest path 
function findShortestPath(table maze, int N, int M)  
	
	print2DMaze(maze);
	mt = adjacencyMatrix(maze, N, M)
	printAdjacencyMatrix(mt)
	
	Djikstra(mt);
	
	S = {}
	u = target

	--Construct Path To Goal
	while prev[u] ~= nil do
		table.insert(S, 1, u)
		u = prev[u]
	end
	table.insert(S, 1, u) --Get final Num
	
	printShortestPath(S)
	
	return S --Shortest Path
end

function adjacencyMatrix(maze, int N, int M)
	mt = {};
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
	return mt
end

function Djikstra(table mt)

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

function print2DMaze(table maze)
	print("Original Maze:")
	for i=1, N do
	   for j=1, M do
		   io.write(string.format("%3d", maze[i][j]))
	   end
	   print()
end

function printAdjacencyMatrix(table mt)
	print("\nAdjacency Matrix:")
	for i=1, numNodes do
	   for j=1, numNodes do
		   io.write(string.format("%2d", mt[i][j]))
	   end
	   print()
	end
end

function printShortestPath(table S)
	print("\nDjikstra Path:")
	--Print Path
	for i = 1, #S do
		io.write(S[i])
		if i ~= #S then
			io.write("->")
		end
	end
end