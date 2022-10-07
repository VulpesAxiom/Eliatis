Object = require "classic"
require "Graphs"

function love.load()
    vertices = {}
    left_held = 0
end

function love.update(dt)
    if (love.mouse.isDown(1)) then
        if (left_held == 0) then
            table.insert(vertices, Vertex(love.mouse.getX(), love.mouse.getY()))
            left_held = 1
        end
    else
        left_held = 0
    end
end

function love.draw()
    love.graphics.print("hola",50,20)
    for i,vertex in pairs(vertices) do
        vertex:draw()
    end
end