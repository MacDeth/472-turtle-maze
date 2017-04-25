-- open rednet
rednet.open("left")

--listen for state and map updates
--listen for exit state to end infinite display loop
--Send name of robot
senderID, robotName = rednet.receive()
while(true) do
    io.write("Current robot: ", robotName)
    io.write("\n")
    --Send current state of the robot
    senderID, state = rednet.receive()
    if state == "exit" then 
        break 
    end
    io.write("Current state: ", state)
    io.write("\n")
    --listen for the row and column length
    senderID, rowsString = rednet.receive()
    senderID, columnsString = rednet.receive()
    rows = tonumber(rowsString)
    columns = tonumber(columnsString)
    --listen for string of map and print it in an array format
    senderID, mapString = rednet.receive()
    count = 1
    io.write("Current map known by the AI robot: ")
    io.write("\n")
    for i = 1, rows do
        for j = 1, columns do
            io.write(string.sub(mapString, count, count))
            count = count + 2
        end
        io.write("\n")
    end
end