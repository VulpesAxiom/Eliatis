function mouse_in_game_area()
    mouse_x = love.mouse.getX()
    mouse_y = love.mouse.getY()
    if(mouse_x <= game_area.x + game_area.width and mouse_x > game_area.x)then
        if(mouse_y <= game_area.y + game_area.height and mouse_y > game_area.y)then
            return true
        end
    end
    return false
end

function in_game_area(x,y)
    if(x <= game_area.x + game_area.width and x > game_area.x)then
        if(y <= game_area.y + game_area.height and y > game_area.y)then
            return true
        end
    end
    return false
end