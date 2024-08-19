if arg[2] == "debug" then
    require("lldebugger").start()
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end

print("Hello World")

function love.load()
    P1x = 100;
    P1y = 100;
    P2x = 100;
    P2y = 100;
    moveSpeed = 100;
    move = true;
end;

function love.draw()
    love.graphics.setColor(0, 200, 300);
    -- player 1
    love.graphics.circle("line", P1x, P1y, 50, 50);

    -- player 2
    love.graphics.rectangle("line", P2x, P2y, 200, 150);
end;

function love.update(dt)
    -- Moving Player 1
    if love.keyboard.isDown("right") then
        P1x = P1x + moveSpeed * dt;
    elseif love.keyboard.isDown("left") then
        P1x = P1x - moveSpeed * dt;
    end;

    if love.keyboard.isDown("up") then
        P1y = P1y - moveSpeed * dt;
    elseif love.keyboard.isDown("down") then
        P1y = P1y + moveSpeed * dt;
    end;

    -- Moving Player 2
    if love.keyboard.isDown("d") then
        P2x = P2x + moveSpeed * dt;
    elseif love.keyboard.isDown("a") then
        P2x = P2x - moveSpeed * dt;
    end;

    if love.keyboard.isDown("w") then
        P2y = P2y - moveSpeed * dt;
    elseif love.keyboard.isDown("s") then
        P2y = P2y + moveSpeed * dt;
    else
        print("Invalid arrow key!");
    end;
end;
