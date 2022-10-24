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
    displace_x = 0
    displace_y = 0
    drag_origin_x = 0
    drag_origin_y = 0
    dragging = false
end

function love.update(dt)
    if (love.mouse.isDown(1) and (not dragging)) then
        if (left_held == 0) then
            if(mouse_in_game_area() and not near_vertex) then
                table.insert(game_area.vertices, Vertex(love.mouse.getX(), love.mouse.getY()))
            end
            left_held = 1
        end
    else
        left_held = 0
    end
    if (love.mouse.isDown(2)) then

        if((not in_vertex) or dragging) then
            if (not dragging) then
                drag_origin_x = love.mouse.getX()
                drag_origin_y = love.mouse.getY()
            end
            if (right_held == 0) then
                dragging = true
            end
        end

        if (right_held == 0) then
            right_held = 1
        end
    else
        right_held = 0
        dragging = false
        displace_y = 0
        displace_x = 0
    end
end

function love.draw()
    game_area:draw()
    in_vertex = false
    near_vertex = false

    if (dragging) then
        displace_x = love.mouse.getX() - drag_origin_x
        displace_y = love.mouse.getY() - drag_origin_y
        drag_origin_x = love.mouse.getX()
        drag_origin_y = love.mouse.getY()
    end

    for i,vertex in pairs(game_area.vertices) do
        inside, near = vertex:draw()
        in_vertex = in_vertex or inside
        near_vertex = near_vertex or near
    end
    for i,button in ipairs(buttons) do
        button:draw()
    end
    if (near_vertex)then
        love.graphics.setColor(1,0,0)
        love.graphics.setLineWidth(4)
    end
    love.graphics.circle("line",love.mouse.getX(),love.mouse.getY(),10)
    love.graphics.setColor(1,1,1)
    love.graphics.setLineWidth(1)
    love.graphics.print(displace_x .. "," .. displace_y, 20, 20)

end