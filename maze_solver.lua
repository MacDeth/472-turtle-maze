require fsm_endfind --FSM Which Handles Maze Solving
require search_dijkstra --Module Which performs Djikstra Searches


local STARTING, END_FIND, DIJKSTRA, TRAVERSING = 0, 1 , 2, 3
local state = STARTING

function main () 
		if state == STARTING 	then
			state = END_FIND
		end
end