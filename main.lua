Object = require "Classic"
require "Graphs"
require "Buttons"
require "Utilities"

function love.load()
    game_area = GameArea(200,20,300,400)
    buttons = {}
    left_held = 0
    right_held = 0
    table.insert(buttons,Button(50,100))
    in_vertex = false
end

function love.update(dt)
    if (love.mouse.isDown(1)) then
        if (left_held == 0) then
            if(mouse_in_game_area()) then
                table.insert(game_area.vertices, Vertex(love.mouse.getX(), love.mouse.getY()))
            end
            left_held = 1
        end
    else
        left_held = 0
    end
    if (love.mouse.isDown(2)) then
        if (right_held == 0) then
            right_held = 1
        end
    else
        right_held = 0
    end
end

function love.draw()
    game_area:draw()

    for i,vertex in pairs(game_area.vertices) do
        inside = vertex:draw()
        in_vertex = in_vertex or inside
    end
    for i,button in ipairs(buttons) do
        button:draw()
    end
end