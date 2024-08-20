--require("example") imports class
require("Debug")

print("Hello World");

function love.load()
    listOfRectangles = {}
end

function createRect()
    rect = {}
    --rect["width"] = 100
    rect.width = 70
    rect.height = 90
    rect.x = 100
    rect.y = 100
    rect.speed = 100

    table.insert(listOfRectangles, rect)
end

-- function rect.printHeight()
--     print(rect.printHeight)
-- end

function love.keypressed(key)
    if key == "space" then
        createRect()
    end
end

function love.update(dt)
    for i, v in ipairs(listOfRectangles) do
        v.x = v.x + v.speed * dt
    end
end

function love.draw()
    for i, v in ipairs(listOfRectangles) do
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
    end
end
