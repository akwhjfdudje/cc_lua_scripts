function mine(x)
    local xt = 0
    repeat
        turtle.dig()
        turtle.forward()
        xt = xt + 1
    until(xt >= x)
end

function mineRight(x)
    mine(x)
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
end

function mineLeft(x)
    mine(x)
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
end

function clear(x, y, z, yt)
    local zt = 0
    repeat
        mineLeft(x)
        zt = zt + 1
        mineRight(x)
        zt = zt + 1
        end
    until(zt >= z)
    mine(x)
end

function dig(x, y, z)
    local yt = 0
    repeat
        clear(x, y, z, yt)
        turtle.digDown()
        turtle.down()
        turtle.turnLeft()
        turtle.turnLeft()
        yt = yt + 1
    until(yt >= y)
end

function home(x, y, z)
    --Decrement x, y, and z by one until you reach zero if mod y isn't 0, else just decrement y
    if (y%2 ~= 0)
        repeat
            turtle.forward()
            z = z - 1
        until(z == 0)
        turtle.turnRight()
        repeat
            turtle.forward()
            x = x - 1
        until(x == 0)
    end
    repeat
        turtle.up()
        y = y - 1
    until(y == 0)
end

function quarry(x, y, z)
    --Runs down x-axis, turns when x has been reached
    --Digs block in front, goes forward, turns again, runs down x-axis
    --Keeps doing this until z has been reached
    --Digs one block down, then goes down
    --Repeats previous process until y has been reached
    dig(x, y, z)
end

local args = {...}
for i=1,3,1
    if tonumber(args[i]) =< 0 then
        print("Cannot use negative numbers or zero")
        exit()
    end
end
quarry(tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))

--put onto pastebin for any new world with cc: tweaked or computercraft in it