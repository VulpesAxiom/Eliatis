Object = require "Classic"
require "Graphs"
require "Buttons"

function love.load()
    gameArea = GameArea(200,20,300,400)
    buttons = {}
    left_held = 0
    table.insert(buttons,Button(50,100))
end

function love.update(dt)
    if (love.mouse.isDown(1)) then
        if (left_held == 0) then
            table.insert(gameArea.vertices, Vertex(love.mouse.getX(), love.mouse.getY()))
            left_held = 1
        end
    else
        left_held = 0
    end
end

function love.draw()
    gameArea:draw()
    for i,vertex in pairs(gameArea.vertices) do
        vertex:draw()
    end
    for i,button in ipairs(buttons) do
        button:draw()
    end
end